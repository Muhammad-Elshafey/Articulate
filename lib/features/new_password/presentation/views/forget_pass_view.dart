import 'package:articulate/features/new_password/presentation/manager/forget_pass_cubit/forget_pass_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/service_locator.dart';
import '../../../auth/presentation/manager/validate_cubit/validate_cubit.dart';
import '../../data/repos/reset_password_repo_implementation.dart';
import 'forget_pass_view_body.dart';

class ForgetPassView extends StatelessWidget {
  const ForgetPassView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ForgetPasswordCubit(
              resetPasswordRepo: getIt.get<ResetPasswordRepoImplementation>()),
        ),
        BlocProvider(create: (context) => ValidateCubit()),
      ],
      child: const Scaffold(
        body: SafeArea(child: ForgetPassViewBody()),
      ),
    );
  }
}
