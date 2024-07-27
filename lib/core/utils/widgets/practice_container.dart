import 'package:articulate/core/utils/widgets/progress_indicator.dart';
import 'package:articulate/features/test_feature/presentation/manager/test_timer_cubit/timer_cubit_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constant.dart';
import '../../../features/test_feature/presentation/manager/test_data_cubit/test_data_cubit.dart';
import '../common/functions.dart';
import '../text_styles.dart';

class PracticeContainer extends StatelessWidget {
  final String questionNumber;
  final String text;
  final bool isWord;
  final bool isLoading;
  const PracticeContainer({
    Key? key,
    required this.questionNumber,
    required this.text,
    this.isWord = true,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final blocProviderObjectForTime = BlocProvider.of<TestTimerCubit>(context);
    return Container(
      width: 340.w,
      height: 280.h,
      decoration: BoxDecoration(
        gradient: practiceContainer,
        borderRadius: BorderRadius.circular(24.h),
      ),
      child: isLoading
          ? const Center(child: CustomCircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20, top: 30, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Q.$questionNumber",
                        style: Styles.text18.copyWith(
                          color: kWhiteColor,
                          fontSize: 22,
                        ),
                      ),
                      BlocConsumer<TestTimerCubit, TestTimerState>(
                        listener: (context, state) {
                          if (state is TimerCubitTimeEndForTest) {
                            BlocProvider.of<TestDataCubit>(context).getWord();
                          }
                        },
                        builder: (context, state) {
                          return Text(
                            '00:${(blocProviderObjectForTime.testDuration.inSeconds % 60).toString().padLeft(2, '0')}',
                            style: BlocProvider.of<TestTimerCubit>(context)
                                        .testDuration
                                        .inSeconds >
                                    5
                                ? Styles.text18.copyWith(
                                    color: kWhiteColor,
                                    fontSize: 22,
                                  )
                                : Functions.getTimerStyleInTest(
                                    BlocProvider.of<TestTimerCubit>(context)
                                        .testDuration
                                        .inSeconds),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50.h),
                Center(
                  child: Padding(
                    padding: isWord
                        ? const EdgeInsets.only(top: 32)
                        : const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 6),
                    child: Text(
                      text,
                      style: isWord
                          ? Styles.text32.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 46,
                            )
                          : Styles.text32.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                // SizedBox(height: 100.h),
              ],
            ),
    );
  }
}
