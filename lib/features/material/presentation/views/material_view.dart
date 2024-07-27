import 'package:articulate/features/material/presentation/manager/search_cubit/search_cubit.dart';
import 'package:articulate/features/material/presentation/views/material_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../constant.dart';
import '../../../../core/utils/assets.dart';

class MaterialView extends StatelessWidget {
  const MaterialView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: BlocProvider<SearchCubit>(
        create: (context) => SearchCubit(),
        child: Scaffold(
          backgroundColor: kWhiteColor.withOpacity(0.1),
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4),
              child: Builder(
                builder: (context) => TabBar(
                  onTap: (a) {
                    BlocProvider.of<SearchCubit>(context).clearSearchResults();
                  },
                  tabs: [
                    Tab(
                      child: Image.asset(AssetData.listeningTabBar, scale: 0.2),
                    ),
                    Tab(
                      child: Image.asset(AssetData.courseTabBar, scale: 0.2),
                    ),
                    Tab(
                      child: Image.asset(AssetData.bookTabBar, scale: 0.2),
                    ),
                    Tab(
                      child: Image.asset(AssetData.articleTabBar, scale: 0.2),
                    ),
                    Tab(
                      child: Image.asset(AssetData.gameTabBar, scale: 0.2),
                    ),
                  ],
                  dividerColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    color: kSoundColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
          body: const MaterialViewBody(),
        ),
      ),
    );
  }
}
