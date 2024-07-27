import 'package:articulate/core/services/service_locator.dart';
import 'package:articulate/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repos/auth_repo_implementation.dart';
import '../manager/validate_cubit/validate_cubit.dart';
import '../manager/visibility_cubit/visibility_cubit.dart';
import 'sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => ValidateCubit()),
            BlocProvider(
                create: (context) =>
                    SignUpCubit(authRepo: getIt.get<AuthRepoImplementation>())),
            BlocProvider(create: (context) => VisibilityCubit()),
          ],
          child: const SignUpViewBody(),
        ),
      ),
    );
  }
}
