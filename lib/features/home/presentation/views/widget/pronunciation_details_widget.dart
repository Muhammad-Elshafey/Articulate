import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/common/enum_level.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/utils/widgets/progress_indicator.dart';
import '../../manager/get_transcription_cubit/get_transcription_cubit.dart';
import '../../manager/get_transcription_cubit/get_transcription_state.dart';
import 'text_to_speech_widget.dart';

class PronunciationDetailsWidget extends StatelessWidget {
  const PronunciationDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        const TextToSpeechWidget(),
        SizedBox(width: 10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  LevelEnum.currentIndexForLevel == 2
                      ? 'Listen to Sentence'
                      : 'Sound like',
                  style: Styles.text18.copyWith(
                      color: kBlackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(height: 6.h),
            if (LevelEnum.currentIndexForLevel != 2)
              BlocConsumer<GetTranscriptionCubit, GetTranscriptionState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return state is GetTranscriptionLoading
                      ? const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: CustomCircularProgressIndicator(
                            color: kSoundColor,
                          ),
                        )
                      : Text(
                          BlocProvider.of<GetTranscriptionCubit>(context).text,
                          style: Styles.text18Inter.copyWith(
                              color: kSoundColor,
                              fontSize: 28,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        );
                },
              ),
          ],
        ),
        const Spacer(),
        Image.asset(
          LevelEnum.currentIndexForLevel == 2
              ? AssetData.listen
              : AssetData.mouthImage,
          width: LevelEnum.currentIndexForLevel == 2 ? 60.w : 100.w,
        ),
      ],
    );
  }
}
