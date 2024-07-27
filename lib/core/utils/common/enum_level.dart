import 'package:flutter/material.dart';
import '../../../features/home/data/models/lessons_progress_model.dart';
import '../../../features/home/presentation/views/level_details_view.dart';

enum DetermineLevel {
  beginner,
  intermediate,
  advanced,
}

class LevelEnum {
  static int currentIndexForLevel = 0;
  static int currentIndexForLesson = 0;
  static void determineInstructionsRoute(
      {required int index, required BuildContext context}) {
    currentIndexForLevel = index;
    final determineLevel = DetermineLevel.values
        .elementAt(index.clamp(0, DetermineLevel.values.length - 1));
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LevelDetailsView(determineLevel: determineLevel),
      ),
    );
  }

  static String endPointForLessonsDetails() {
    if (currentIndexForLevel == 0) {
      return 'get_lvl_1_sd/';
    } else if (currentIndexForLevel == 1) {
      return 'get_lvl_2_sd/';
    } else {
      return 'get_lvl_3_sd/';
    }
  }

  static String endPointForLessonsData() {
    if (currentIndexForLevel == 0) {
      return 'get_sound_in_level1/';
    } else if (currentIndexForLevel == 1) {
      return 'get_sound_in_level2/';
    } else {
      return 'get_Sentence/';
    }
  }

  static List<LessonsProgressModel> list() {
    switch (currentIndexForLevel) {
      case 0:
        return LessonsProgressModel.levelOneList;
      case 1:
        return LessonsProgressModel.levelTwoList;
      default:
        return LessonsProgressModel.levelThreeList;
    }
  }

  static String getAppBarTitleForLevel(
      {required DetermineLevel determineLevel}) {
    return determineLevel.name;
  }

  static String getAppBarSubTitleForForLevel(
      {required DetermineLevel determineLevel}) {
    return determineLevel == DetermineLevel.beginner
        ? 'Vowels are the foundation of spoken language. By mastering these sounds, you\'ll improve the clarity and accuracy of your pronunciation from the very beginning'
        : determineLevel == DetermineLevel.intermediate
            ? 'Consonants are the workhorses of pronunciation! They differentiate words (like "sip" vs "ship"), shape speech flow, and contribute to rhythm and naturalness. Without them, our speech would be a mushy mess of vowels'
            : 'Test with sentences that combine all the sounds you\'ve learned for smooth, confident speaking!';
  }

  static List<LessonsProgressModel> detectList({required int index}) {
    List<LessonsProgressModel> progressList;
    switch (index) {
      case 0:
        progressList = LessonsProgressModel.levelOneList;
        break;
      case 1:
        progressList = LessonsProgressModel.levelTwoList;
        break;
      default:
        progressList = LessonsProgressModel.levelThreeList;
    }
    return progressList;
  }
}
