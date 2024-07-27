import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/levels_data_model.dart';
import '../../manager/lesson_progress_cubit/lesson_progress_cubit.dart';
import '../../manager/lesson_progress_cubit/lesson_progress_state.dart';
import 'divider.dart';
import 'level_item.dart';

class LevelsListView extends StatefulWidget {
  const LevelsListView({
    super.key,
  });

  @override
  State<LevelsListView> createState() => _LevelsListViewState();
}

class _LevelsListViewState extends State<LevelsListView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<LevelModel> list = LevelModel.levels;
    return BlocConsumer<ProgressCubit, ProgressState>(
      listener: (context, state) {
        if (state is LessonProgressGet) {
          list[2] = state.levelModel;
        }
      },
      builder: (context, state) {
        return ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return LevelItemWidget(
              levelModel: list[index],
              index: index,
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const CustomDivider(thickness: 2);
          },
        );
      },
    );
  }
}
