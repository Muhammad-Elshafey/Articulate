import 'package:articulate/core/utils/app_strings.dart';
import 'package:articulate/core/utils/common/functions.dart';
import 'package:flutter/material.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/utils/widgets/text_button.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () => Functions.navigateWithoutReplacement(
              context: context, route: Routes.forgetPassRoute),
          child: const TextButtonItem(
            text: AppStrings.forgotPassword,
            textColor: kBlueColor,
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
