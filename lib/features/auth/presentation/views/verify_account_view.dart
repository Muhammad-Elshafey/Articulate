import 'package:articulate/core/services/service_locator.dart';
import 'package:articulate/features/auth/data/repos/auth_repo_implementation.dart';
import 'package:articulate/features/auth/presentation/manager/validate_cubit/validate_cubit.dart';
import 'package:articulate/features/auth/presentation/views/verify_account_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/sign_up_cubit/sign_up_cubit.dart';

class VerifyAccount extends StatelessWidget {
  const VerifyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignUpCubit(
            authRepo: getIt.get<AuthRepoImplementation>(),
          ),
        ),
        BlocProvider(
          create: (context) => ValidateCubit(),
        ),
      ],
      child: const Scaffold(
        body: SafeArea(child: VerifyAccountBody()),
      ),
    );
  }
}
