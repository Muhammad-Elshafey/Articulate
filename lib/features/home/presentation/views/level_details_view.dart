import 'package:articulate/core/services/service_locator.dart';
import 'package:articulate/features/home/data/repos/home_repo_implementation.dart';
import 'package:articulate/features/home/presentation/manager/lesson_details_cubit/lesson_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/common/enum_level.dart';
import '../manager/lesson_progress_cubit/lesson_progress_cubit.dart';
import 'level_details_view_body.dart';

class LevelDetailsView extends StatelessWidget {
  final DetermineLevel determineLevel;
  const LevelDetailsView({super.key, required this.determineLevel});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LessonDetailsCubit>(
          create: (context) => LessonDetailsCubit(
            homeRepo: getIt.get<HomeRepoImplementation>(),
          ),
        ),
        BlocProvider<ProgressCubit>(
          create: (context) => ProgressCubit(),
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: LevelDetailsViewBody(determineLevel: determineLevel),
        ),
      ),
    );
  }
}
