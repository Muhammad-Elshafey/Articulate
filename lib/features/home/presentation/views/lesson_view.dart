import 'package:articulate/core/services/service_locator.dart';
import 'package:articulate/features/home/data/repos/home_repo_implementation.dart';
import 'package:articulate/features/home/presentation/manager/assess_pronunciation_cubit/assess_pronunciation_cubit.dart';
import 'package:articulate/features/home/presentation/manager/get_transcription_cubit/get_transcription_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/lesson_data_cubit/lesson_data_cubit.dart';
import '../manager/lesson_progress_cubit/lesson_progress_cubit.dart';
import '../manager/text_to_speech_cubit/text_to_speech_cubit.dart';
import 'lesson_view_body.dart';

class LessonView extends StatelessWidget {
  final int index;
  const LessonView({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TextToSpeechCubit(
            homeRepo: getIt.get<HomeRepoImplementation>(),
          ),
        ),
        BlocProvider(
          create: (context) => GetTranscriptionCubit(
            homeRepo: getIt.get<HomeRepoImplementation>(),
          ),
        ),
        BlocProvider(
          create: (context) => LessonDataCubit(
            homeRepo: getIt.get<HomeRepoImplementation>(),
          ),
        ),
        BlocProvider(
          create: (context) => AssessPronunciationCubit(
            homeRepo: getIt.get<HomeRepoImplementation>(),
          ),
        ),
        BlocProvider(
          create: (context) => ProgressCubit(),
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: LessonViewBody(index: index),
        ),
      ),
    );
  }
}
