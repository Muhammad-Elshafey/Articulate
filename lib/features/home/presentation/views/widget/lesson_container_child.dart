import 'package:articulate/constant.dart';
import 'package:articulate/core/utils/common/enum_level.dart';
import 'package:articulate/core/utils/widgets/progress_indicator.dart';
import 'package:articulate/features/home/data/models/lessons_progress_model.dart';
import 'package:articulate/features/home/presentation/manager/lesson_details_cubit/lesson_details_cubit.dart';
import 'package:articulate/features/home/presentation/manager/lesson_details_cubit/lesson_details_state.dart';
import 'package:articulate/features/home/presentation/manager/lesson_progress_cubit/lesson_progress_cubit.dart';
import 'package:articulate/features/home/presentation/manager/lesson_progress_cubit/lesson_progress_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'divider.dart';
import 'lesson_details.dart';

class LessonContainerChild extends StatefulWidget {
  const LessonContainerChild({
    super.key,
  });

  @override
  State<LessonContainerChild> createState() => _LessonContainerChildState();
}

class _LessonContainerChildState extends State<LessonContainerChild> {
  final LevelEnum levelEnum = LevelEnum();
  List<LessonsProgressModel> lessonsProgressList = [];
  @override
  void initState() {
    BlocProvider.of<LessonDetailsCubit>(context)
        .getLessonDetails(endPoint: LevelEnum.endPointForLessonsDetails());
    lessonsProgressList = LevelEnum.list();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<LessonDetailsCubit>(context);
    return BlocBuilder<LessonDetailsCubit, LessonDetailsState>(
      builder: (context, state) {
        return state is LessonDetailsLoading
            ? const Center(
                child: CustomCircularProgressIndicator(color: kBlueColor3),
              )
            : BlocBuilder<ProgressCubit, ProgressState>(
                builder: (context, state) {
                  return ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: bloc.lessons.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 3, left: 6),
                        child: LessonDetails(
                          lessonsModel: bloc.lessons[index],
                          index: index,
                          lessonsProgressModel: lessonsProgressList[index],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const CustomDivider(thickness: 3);
                    },
                  );
                },
              );
      },
    );
  }
}
