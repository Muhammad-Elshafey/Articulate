import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/common/enum_level.dart';
import '../../../data/models/lessons_progress_model.dart';
import '../../../data/models/levels_data_model.dart';
import 'lesson_progress_state.dart';

class ProgressCubit extends Cubit<ProgressState> {
  ProgressCubit() : super(LessonProgressInitial());
  void increaseProgressLevel3() {
    LessonsProgressModel.levelThreeList[LevelEnum.currentIndexForLesson].score =
        1;
    LessonsProgressModel
        .levelThreeList[LevelEnum.currentIndexForLesson].percent = 1;
    LevelModel.levels[LevelEnum.currentIndexForLevel].progressPercent =
        (1 / 20);
    LessonsProgressModel
        .levelThreeList[LevelEnum.currentIndexForLesson + 1].start = true;
    emit(
      LessonProgressGet(
          lessonsProgressModel: LessonsProgressModel
              .levelThreeList[LevelEnum.currentIndexForLesson],
          levelModel: LevelModel.levels[LevelEnum.currentIndexForLevel],
          lessonIdex: LevelEnum.currentIndexForLesson),
    );
  }

  void increaseProgress() {
    switch (LevelEnum.currentIndexForLevel) {
      case 0:
        LessonsProgressModel
            .levelOneList[LevelEnum.currentIndexForLesson].score += 1;
        LessonsProgressModel
            .levelOneList[LevelEnum.currentIndexForLesson].percent += 0.05;
        LevelModel.levels[LevelEnum.currentIndexForLevel].progressPercent +=
            (1 / 480);
        break;
      case 1:
        LessonsProgressModel
            .levelTwoList[LevelEnum.currentIndexForLesson].score += 1;
        LessonsProgressModel
            .levelTwoList[LevelEnum.currentIndexForLesson].percent += 0.05;
        LevelModel.levels[LevelEnum.currentIndexForLevel].progressPercent +=
            (1 / 480);
        break;
    }
  }

  void nextList() {
    switch (LevelEnum.currentIndexForLevel) {
      case 0:
        LessonsProgressModel
            .levelOneList[LevelEnum.currentIndexForLesson + 1].start = true;
        break;
      case 1:
        LessonsProgressModel
            .levelTwoList[LevelEnum.currentIndexForLesson + 1].start = true;
        break;
    }
  }
}
