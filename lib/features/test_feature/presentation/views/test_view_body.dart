import 'package:articulate/core/utils/app_routes.dart';
import 'package:articulate/core/utils/app_strings.dart';
import 'package:articulate/features/test_feature/presentation/manager/test_data_cubit/test_data_cubit.dart';
import 'package:articulate/features/test_feature/presentation/manager/test_data_cubit/test_data_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constant.dart';
import '../../../../core/utils/common/functions.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/utils/widgets/practice_container.dart';
import '../manager/test_timer_cubit/timer_cubit_test.dart';
import 'widgets/assess_pronunciation_full_widget_for_test.dart';

class TestViewBody extends StatefulWidget {
  const TestViewBody({super.key});

  @override
  State<TestViewBody> createState() => _TestViewBodyState();
}

class _TestViewBodyState extends State<TestViewBody> {
  @override
  void initState() {
    BlocProvider.of<TestDataCubit>(context).getData();
    super.initState();
  }

  final TestTimerCubit _myCubit = TestTimerCubit();
  @override
  void dispose() {
    _myCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final blocProviderObjectForTest = BlocProvider.of<TestDataCubit>(context);
    final blocProviderObjectForTime = BlocProvider.of<TestTimerCubit>(context);
    return BlocConsumer<TestDataCubit, TestDataState>(
      listener: (context, state) {
        if (state is GetDataSuccess || state is TestNewData) {
          blocProviderObjectForTime.startTimerForTest();
        }
        if (state is TestFinished) {
          if (blocProviderObjectForTime.testDuration.inSeconds == 0) {
            Functions.showToastMessage(message: AppStrings.toastReadingText);
            Future.delayed(
              const Duration(seconds: 2),
              () => Functions.navigateWithReplacement(
                  context: context, route: Routes.congratsRoute),
            );
          }
        }
      },
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is GetDataLoading ? true : false,
          child: Column(
            children: [
              SizedBox(height: 40.h),
              Text(
                AppStrings.readingTest,
                style: Styles.text22.copyWith(color: kBlueColor3),
              ),
              SizedBox(height: 35.h),
              Center(
                child: PracticeContainer(
                  isLoading: state is GetDataLoading ? true : false,
                  questionNumber:
                      '${blocProviderObjectForTest.currentIndex + 1}/${blocProviderObjectForTest.data.length}',
                  text: blocProviderObjectForTest.word,
                  isWord: blocProviderObjectForTest.currentIndex < 24
                      ? true
                      : false,
                ),
              ),
              SizedBox(height: 75.h),
              AssessPronunciationFullWidgetForTest(
                referenceText: blocProviderObjectForTest.word,
              ),
            ],
          ),
        );
      },
    );
  }
}
