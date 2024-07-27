import 'dart:convert';

class LessonsProgressModel {
  int score;
  double percent;
  bool start;

  LessonsProgressModel({
    required this.score,
    required this.percent,
    required this.start,
  });

  Map<String, dynamic> toMap() {
    return {
      'score': score,
      'percent': percent,
      'start': start,
    };
  }

  factory LessonsProgressModel.fromMap(Map<String, dynamic> map) {
    return LessonsProgressModel(
      score: map['score'],
      percent: map['percent'],
      start: map['start'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LessonsProgressModel.fromJson(String source) =>
      LessonsProgressModel.fromMap(json.decode(source));

  static List<LessonsProgressModel> levelOneList = List.generate(
      24, (_) => LessonsProgressModel(score: 0, percent: 0, start: false));
  static List<LessonsProgressModel> levelTwoList = List.generate(
      20, (_) => LessonsProgressModel(score: 0, percent: 0, start: false));
  static List<LessonsProgressModel> levelThreeList = List.generate(
      20, (_) => LessonsProgressModel(score: 0, percent: 0, start: false));
}
