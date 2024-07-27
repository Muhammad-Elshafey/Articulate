import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/widgets/progress_indicator.dart';
import '../../manager/text_to_speech_cubit/text_to_speech_cubit.dart';
import '../../manager/text_to_speech_cubit/text_to_speech_state.dart';

class TextToSpeechWidget extends StatelessWidget {
  const TextToSpeechWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextToSpeechCubit, TextToSpeechState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            if (state is TextToSpeechSuccess) {
              playAudio(path: state.audioPath);
            }
          },
          child: CircleAvatar(
            radius: 20.r,
            backgroundColor: const Color(0xff0B91D6),
            child: Center(
              child: state is TextToSpeechLoading
                  ? const CustomCircularProgressIndicator()
                  : const Padding(
                      padding: EdgeInsets.only(left: 3.8),
                      child: Icon(
                        FontAwesomeIcons.play,
                        color: kWhiteColor,
                        size: 24,
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }

  void playAudio({required String path}) async {
    final AudioPlayer player = AudioPlayer();
    await player.play(UrlSource(path));
  }
}
