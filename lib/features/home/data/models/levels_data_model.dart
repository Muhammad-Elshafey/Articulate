class LevelModel {
  double progressPercent;
  final String title;
  final String supTitle;
  bool start;

  LevelModel({
    required this.progressPercent,
    required this.title,
    required this.supTitle,
    required this.start,
  });

  Map<String, dynamic> toMap() {
    return {
      'progressPercent': progressPercent,
      'title': title,
      'supTitle': supTitle,
      'start': start,
    };
  }

  static final List<LevelModel> levels = [
    LevelModel(
      title: 'Beginner',
      progressPercent: 0,
      supTitle:
          'Master essential vowel sounds for clear and accurate pronunciation from the start.',
      start: true,
    ),
    LevelModel(
      title: 'Intermediate',
      progressPercent: 0,
      supTitle:
          'Expand your skills by tackling consonant sounds and proper articulation for enhanced clarity and fluency.',
      start: true,
    ),
    LevelModel(
      title: 'Advanced',
      progressPercent: 0,
      supTitle:
          'Learn the rhythm and music of spoken English through intonation, word stress, and phonology for natural and sophisticated pronunciation.',
      start: true,
    ),
  ];
}