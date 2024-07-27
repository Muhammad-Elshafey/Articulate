import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/service_locator.dart';
import '../../data/repos/auth_repo_implementation.dart';
import '../manager/sign_in_cubit/sign_in_cubit.dart';
import '../manager/validate_cubit/validate_cubit.dart';
import '../manager/visibility_cubit/visibility_cubit.dart';
import 'login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ValidateCubit()),
        BlocProvider(create: (context) => VisibilityCubit()),
        BlocProvider(
            create: (context) =>
                SignInCubit(authRepo: getIt.get<AuthRepoImplementation>())),
      ],
      child: const Scaffold(
        body: SafeArea(child: LoginViewBody()),
      ),
    );
  }
}
