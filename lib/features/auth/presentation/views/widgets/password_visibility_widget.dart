import 'package:articulate/core/utils/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/visibility_cubit/visibility_cubit.dart';
import '../../manager/visibility_cubit/visibility_state.dart';

class PasswordVisibilityWidget extends StatelessWidget {
  final String textFiledName;
  final String hintText;
  final VisibilityCubit visibilityCubit;
  final TextEditingController controller;
  const PasswordVisibilityWidget({
    super.key,
    required this.textFiledName,
    required this.hintText,
    required this.visibilityCubit,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VisibilityCubit, VisibilityState>(
      bloc: visibilityCubit,
      builder: (context, state) {
        return CustomTextField(
          controller: controller,
          hintText: hintText,
          textFiledName: textFiledName,
          needIcon: true,
          suffixIcon: visibilityCubit.icon,
          obscureText: visibilityCubit.obscureText,
          needOnPressed: true,
          onPressed: () {
            if (visibilityCubit.obscureText) {
              visibilityCubit.makePasswordVisible();
            } else {
              visibilityCubit.makePasswordInvisible();
            }
          },
        );
      },
    );
  }
}
