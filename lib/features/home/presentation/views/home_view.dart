import 'package:articulate/core/services/service_locator.dart';
import 'package:articulate/features/home/data/repos/home_repo_implementation.dart';
import 'package:articulate/features/home/presentation/manager/lesson_details_cubit/lesson_details_cubit.dart';
import 'package:articulate/features/home/presentation/views/home_view_body.dart';
import 'package:articulate/features/profile/data/repos/user_repo_implementation.dart';
import 'package:articulate/features/profile/presentation/manager/get_user_data_cubit/get_user_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../../constant.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../chat_bot/presentation/chat_bot_view.dart';
import '../../../material/presentation/views/material_view.dart';
import '../../../profile/presentation/views/profile_view.dart';
import '../manager/lesson_progress_cubit/lesson_progress_cubit.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;

  void onTabChange(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const HomeViewBody(),
      const MaterialView(),
      const ChatBotView(),
      const ProfileView(),
    ];

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetUserDataCubit(
            userRepo: getIt.get<UserRepoImplementation>(),
          ),
        ),
        BlocProvider(
          create: (context) => LessonDetailsCubit(
            homeRepo: getIt.get<HomeRepoImplementation>(),
          ),
        ),
        BlocProvider(
          create: (context) => ProgressCubit(),
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: screens[selectedIndex],
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: kActiveColorColor,
              width: 2,
            ),
          ),
          child: GNav(
            gap: 12,
            activeColor: kActiveColorColor,
            color: kUnActiveColor,
            iconSize: 26,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            tabBackgroundColor: kBlueColor3.withOpacity(0.1),
            tabBorderRadius: 12,
            tabs: [
              GButton(
                icon: FontAwesomeIcons.house,
                text: 'Home',
                textStyle: Styles.text16,
              ),
              GButton(
                icon: FontAwesomeIcons.tv,
                text: 'Material',
                textStyle: Styles.text16,
              ),
              GButton(
                icon: FontAwesomeIcons.comments,
                text: 'ChatBot',
                textStyle: Styles.text16,
              ),
              GButton(
                icon: FontAwesomeIcons.user,
                text: 'Profile',
                textStyle: Styles.text16,
              ),
            ],
            selectedIndex: selectedIndex,
            onTabChange: onTabChange,
          ),
        ),
      ),
    );
  }
}
