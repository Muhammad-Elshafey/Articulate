import 'dart:async';
import 'package:articulate/core/utils/common/enum_level.dart';
import 'package:articulate/core/utils/widgets/progress_indicator.dart';
import 'package:articulate/features/home/presentation/manager/assess_pronunciation_cubit/assess_pronunciation_cubit.dart';
import 'package:articulate/features/home/presentation/manager/assess_pronunciation_cubit/assess_pronunciation_state.dart';
import 'package:articulate/features/home/presentation/manager/lesson_data_cubit/lesson_data_cubit.dart';
import 'package:articulate/features/home/presentation/manager/lesson_data_cubit/lesson_data_state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:articulate/core/utils/widgets/app_bar.dart';
import 'package:articulate/features/home/presentation/views/widget/bg_widget.dart';

import '../../../../constant.dart';
import '../../../../core/utils/common/functions.dart';
import '../../../../core/utils/text_styles.dart';
import '../manager/get_transcription_cubit/get_transcription_cubit.dart';
import '../manager/text_to_speech_cubit/text_to_speech_cubit.dart';
import 'widget/custom_lessons_divider.dart';
import 'widget/no_internet_widget.dart';
import 'widget/pronunciation_details_widget.dart';
import 'widget/submit_user_pronunciation.dart';
import 'widget/user_pronunciation_evaluation.dart';
import 'widget/user_transcription_widget.dart';

class LessonViewBody extends StatefulWidget {
  final int index;
  const LessonViewBody({Key? key, required this.index}) : super(key: key);

  @override
  State<LessonViewBody> createState() => _LessonViewBodyState();
}

class _LessonViewBodyState extends State<LessonViewBody> {
  ConnectivityResult? _connectivityResult;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  @override
  void initState() {
    BlocProvider.of<LessonDataCubit>(context).getDataForLessons(
        index: LevelEnum.currentIndexForLesson + 1,
        endPoint: LevelEnum.endPointForLessonsData());
    super.initState();
    _connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      setState(() {
        _connectivityResult = result;
      });
    });
    checkCon();
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  void checkCon() async {
    var con = await Connectivity().checkConnectivity();
    setState(() {
      _connectivityResult = con;
    });
  }

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<AssessPronunciationCubit>(context);
    return _connectivityResult == ConnectivityResult.none
        ? const NoInternetWidget()
        : StreamBuilder<ConnectivityResult>(
            stream: Connectivity().onConnectivityChanged,
            builder: (BuildContext context,
                AsyncSnapshot<ConnectivityResult> snapshot) {
              if (snapshot.hasData) {
                _connectivityResult = snapshot.data;
              }
              return snapshot.data == ConnectivityResult.none
                  ? const NoInternetWidget()
                  : Stack(
                      children: [
                        LineBgWidget(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: BlocConsumer<AssessPronunciationCubit,
                                AssessPronunciationState>(
                              listener: (context, state) {
                                if (state is AssessPronunciationFailure) {
                                  Functions.showToastMessage(
                                      message:
                                          'Bad Internet Connection Try Again');
                                }
                              },
                              builder: (context, state) {
                                return AbsorbPointer(
                                  absorbing: state is AssessPronunciationLoading
                                      ? true
                                      : false,
                                  child: Column(
                                    children: [
                                      SizedBox(height: 30.h),
                                      CustomAppBar(
                                          text: 'Lesson ${widget.index + 1}'),
                                      SizedBox(height: 45.h),
                                      const PronunciationWidget(),
                                      SizedBox(height: 25.h),
                                      const CustomLessonsDivider(),
                                      SizedBox(height: 25.h),
                                      const UserTranscriptionWidget(),
                                      SizedBox(height: 25.h),
                                      UserPronunciationEvaluation(
                                        score: bloc.score1,
                                        percent: bloc.percent1,
                                        counter: '1st ',
                                        visible: bloc.visible1,
                                      ),
                                      SizedBox(height: 5.h),
                                      UserPronunciationEvaluation(
                                        score: bloc.score2,
                                        percent: bloc.percent2,
                                        counter: '2nd',
                                        visible: bloc.visible2,
                                      ),
                                      SizedBox(height: 5.h),
                                      UserPronunciationEvaluation(
                                        score: bloc.score3,
                                        percent: bloc.percent3,
                                        counter: '3rd ',
                                        visible: bloc.visible3,
                                      ),
                                      const Spacer(),
                                      BlocBuilder<LessonDataCubit,
                                          LessonDataState>(
                                        builder: (context, state) {
                                          return SubmitUserPronunciation(
                                            referenceText: BlocProvider.of<
                                                    LessonDataCubit>(context)
                                                .word,
                                            visible: bloc.visible,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    );
            },
          );
  }
}

class PronunciationWidget extends StatelessWidget {
  const PronunciationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<LessonDataCubit>(context);
    return BlocConsumer<LessonDataCubit, LessonDataState>(
      listener: (context, state) {
        if (state is LessonDataSuccess) {
          BlocProvider.of<GetTranscriptionCubit>(context)
              .getTranscriptionMethod(word: bloc.word);
          BlocProvider.of<TextToSpeechCubit>(context)
              .textToSpeech(word: bloc.word);
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            state is LessonDataLoading
                ? const Center(
                    child: CustomCircularProgressIndicator(
                      color: kSoundColor,
                    ),
                  )
                : Text(
                    bloc.word,
                    style: Styles.text18.copyWith(
                      color: kBlackColor,
                      fontSize: LevelEnum.currentIndexForLevel == 2 ? 26 : 36,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
            SizedBox(height: 25.h),
            const PronunciationDetailsWidget(),
          ],
        );
      },
    );
  }
}
