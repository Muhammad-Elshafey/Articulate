import 'package:articulate/features/home/presentation/manager/assess_pronunciation_cubit/assess_pronunciation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../constant.dart';
import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/common/functions.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/utils/widgets/image_button.dart';
import '../../../../home/presentation/manager/assess_pronunciation_cubit/assess_pronunciation_cubit.dart';
import '../../manager/test_data_cubit/test_data_cubit.dart';
import '../../manager/test_timer_cubit/timer_cubit_test.dart';

class AssessPronunciationFullWidgetForTest extends StatelessWidget {
  final String referenceText;
  const AssessPronunciationFullWidgetForTest({
    super.key,
    required this.referenceText,
  });

  @override
  Widget build(BuildContext context) {
    final blocProviderObjectForTime = BlocProvider.of<TestTimerCubit>(context);
    return BlocConsumer<AssessPronunciationCubit, AssessPronunciationState>(
      listener: (context, state) {
        if (state is AssessPronunciationFailure) {
          Functions.showToastMessage(message: state.errorMessage);
        }
        if (state is AssessPronunciationSuccess) {
          BlocProvider.of<TestDataCubit>(context).getWord();
          BlocProvider.of<TestTimerCubit>(context).startTimerForTest();
        }
        if ((BlocProvider.of<TestDataCubit>(context).currentIndex ==
                BlocProvider.of<TestDataCubit>(context).data.length - 1) &&
            state is AssessPronunciationSuccess) {
          blocProviderObjectForTime.pauseTimerForTest();
          Functions.showToastMessage(message: AppStrings.toastReadingText);
          Future.delayed(
            const Duration(seconds: 2),
            () => Functions.navigateWithReplacement(
                context: context, route: Routes.congratsRoute),
          );
        }
      },
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
                      blocProviderObjectForTime.pauseTimerForTest();
                      BlocProvider.of<AssessPronunciationCubit>(context)
                          .startRecording();
                    },
                    imagePath: AssetData.micLogo,
                  ),
            SizedBox(height: 15.h),
            Text(
              state is StartRecording
                  ? 'Click to submit your pronunciation'
                  : state is AssessPronunciationLoading
                      ? 'Processing..'
                      : AppStrings.practiceText,
              style: Styles.text22.copyWith(
                color: kGreyColor,
                fontWeight: FontWeight.normal,
                fontSize: 22,
              ),
            ),
          ],
        );
      },
    );
  }
}
