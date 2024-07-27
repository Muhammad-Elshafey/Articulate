import 'package:articulate/features/home/presentation/manager/assess_pronunciation_cubit/assess_pronunciation_cubit.dart';
import 'package:articulate/features/home/presentation/manager/assess_pronunciation_cubit/assess_pronunciation_state.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/common/enum_level.dart';
import '../../../../../core/utils/text_styles.dart';
import 'custom_lessons_divider.dart';

class UserTranscriptionWidget extends StatelessWidget {
  const UserTranscriptionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AudioPlayer audioPlayer = AudioPlayer();
    Source? urlSource;
    return BlocConsumer<AssessPronunciationCubit, AssessPronunciationState>(
      listener: (context, state) {
        if (state is AssessPronunciationSuccess) {
          urlSource = UrlSource(
              BlocProvider.of<AssessPronunciationCubit>(context).audioPath);
        }
      },
      builder: (context, state) {
        return Visibility(
          visible:
              BlocProvider.of<AssessPronunciationCubit>(context).userVisible,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (urlSource != null) {
                        audioPlayer.play(urlSource!);
                      }
                    },
                    child: CircleAvatar(
                      radius: 20.r,
                      backgroundColor: kSoundColor,
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.only(left: 3.8),
                          child: Icon(
                            FontAwesomeIcons.play,
                            color: kWhiteColor,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    LevelEnum.currentIndexForLevel == 2
                        ? 'Listen to your pronunciation'
                        : 'Sound like you said',
                    style: Styles.text18.copyWith(
                        color: kBlackColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              if (LevelEnum.currentIndexForLevel != 2)
                Text(
                  '/${BlocProvider.of<AssessPronunciationCubit>(context).userTranscription}/',
                  style: Styles.text18Inter.copyWith(
                    color: kSoundColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.start,
                ),
              SizedBox(height: 25.h),
              const CustomLessonsDivider(),
            ],
          ),
        );
      },
    );
  }
}
