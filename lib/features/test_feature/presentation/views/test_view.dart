import 'package:articulate/core/services/service_locator.dart';
import 'package:articulate/features/home/data/repos/home_repo_implementation.dart';
import 'package:articulate/features/home/presentation/manager/assess_pronunciation_cubit/assess_pronunciation_cubit.dart';
import 'package:articulate/features/test_feature/data/repos/test_repo_implementation.dart';
import 'package:articulate/features/test_feature/presentation/manager/test_timer_cubit/timer_cubit_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/test_data_cubit/test_data_cubit.dart';
import 'test_view_body.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TestTimerCubit>(
          create: (BuildContext context) => TestTimerCubit(),
        ),
        BlocProvider<AssessPronunciationCubit>(
          create: (BuildContext context) => AssessPronunciationCubit(
              homeRepo: getIt.get<HomeRepoImplementation>()),
        ),
        BlocProvider<TestDataCubit>(
          create: (BuildContext context) =>
              TestDataCubit(testRepo: getIt.get<TestRepoImplementation>()),
        ),
      ],
      child: const Scaffold(
        body: SafeArea(
          child: TestViewBody(),
        ),
      ),
    );
  }
}
