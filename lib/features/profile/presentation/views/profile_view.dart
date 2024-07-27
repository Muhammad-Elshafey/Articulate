import 'package:articulate/core/services/service_locator.dart';
import 'package:articulate/features/profile/data/repos/user_repo_implementation.dart';
import 'package:articulate/features/profile/presentation/manager/update_user_data_cubit/update_user_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/get_user_data_cubit/get_user_data_cubit.dart';
import 'profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UpdateUserDataCubit(
              userRepo: getIt.get<UserRepoImplementation>()),
        ),
        BlocProvider(
          create: (context) =>
              GetUserDataCubit(userRepo: getIt.get<UserRepoImplementation>()),
        ),
      ],
      child: const Scaffold(
        body: SafeArea(
          child: ProfileViewBody(),
        ),
      ),
    );
  }
}
