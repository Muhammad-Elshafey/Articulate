import 'package:articulate/core/utils/common/enum_level.dart';
import 'package:articulate/features/home/presentation/manager/assess_pronunciation_cubit/assess_pronunciation_cubit.dart';
import 'package:articulate/features/home/presentation/manager/assess_pronunciation_cubit/assess_pronunciation_state.dart';
import 'package:articulate/features/home/presentation/manager/lesson_progress_cubit/lesson_progress_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../constant.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/utils/widgets/image_button.dart';
import '../../manager/get_transcription_cubit/get_transcription_cubit.dart';
import '../../manager/lesson_data_cubit/lesson_data_cubit.dart';
import '../../manager/text_to_speech_cubit/text_to_speech_cubit.dart';

class SubmitUserPronunciation extends StatelessWidget {
  final String referenceText;
  final bool visible;
  const SubmitUserPronunciation({
    super.key,
    required this.referenceText,
    this.visible = false,
  });

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<LessonDataCubit>(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 3),
          Column(
            children: [
              AssessPronunciationButton(
                referenceText: referenceText,
              ),
            ],
          ),
          const Spacer(flex: 2),
          NextButtonInLesson(bloc: bloc, visible: visible),
        ],
      ),
    );
  }
}

class NextButtonInLesson extends StatelessWidget {
  final LessonDataCubit bloc;
  final bool visible;
  const NextButtonInLesson(
      {super.key, required this.bloc, this.visible = false});
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: GestureDetector(
        onTap: () async {
          BlocProvider.of<AssessPronunciationCubit>(context).rest();
          if (LevelEnum.currentIndexForLevel != 2) {
            BlocProvider.of<ProgressCubit>(context).increaseProgress();
            if (bloc.wordIndex == bloc.words.length - 1) {
              BlocProvider.of<ProgressCubit>(context).nextList();
              Navigator.pop(context);
            } else {
              bloc.getNextWord();
              BlocProvider.of<GetTranscriptionCubit>(context)
                  .getTranscriptionMethod(word: bloc.word);
              BlocProvider.of<TextToSpeechCubit>(context)
                  .textToSpeech(word: bloc.word);
              BlocProvider.of<AssessPronunciationCubit>(context).rest();
            }
          } else {
            BlocProvider.of<ProgressCubit>(context).increaseProgressLevel3();
            if (context.mounted) {
              Navigator.pop(context);
            }
          }
        },
        child: CircleAvatar(
          radius: 18.r,
          backgroundColor: const Color(0xff0B91D6),
          child: const Icon(
            FontAwesomeIcons.forward,
            color: kWhiteColor,
            size: 22,
          ),
        ),
      ),
    );
  }
}

class AssessPronunciationButton extends StatelessWidget {
  final String referenceText;
  const AssessPronunciationButton({
    super.key,
    required this.referenceText,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssessPronunciationCubit, AssessPronunciationState>(
      builder: (context, state) {
        return Column(
          children: [
            state is StartRecording
                ? IconButton(
                    onPressed: () {
                      BlocProvider.of<AssessPronunciationCubit>(context)
                          .stopRecording(referenceText: referenceText);
                    },
                    icon: const Icon(
                      FontAwesomeIcons.circleStop,
                      size: 52,
                      color: kBlueColor3,
                    ),
                  )
                : ImageButton(
                    isLoading:
                        state is AssessPronunciationLoading ? true : false,
                    onTap: () {
                      BlocProvider.of<AssessPronunciationCubit>(context)
                          .startRecording();
                    },
                    imagePath: AssetData.homeMic,
                    scale: 8,
                    color: const Color(0xff0B91D6),
                  ),
            SizedBox(height: 10.h),
            Text(
              state is StartRecording
                  ? 'Submit your pronunciation'
                  : state is AssessPronunciationLoading
                      ? 'Processing....'
                      : 'Let\'s Practice',
              style: Styles.text22.copyWith(
                color: kGreyColor,
                fontWeight: FontWeight.normal,
                fontSize: state is StartRecording ? 18 : 20,
              ),
            ),
          ],
        );
      },
    );
  }
}
