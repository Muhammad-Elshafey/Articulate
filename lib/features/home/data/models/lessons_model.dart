class LessonsModel {
  String? sound;
  String? description;

  LessonsModel({required this.sound, required this.description});

  LessonsModel.fromJson(Map<String, dynamic> json) {
    sound = json['sound'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sound'] = sound;
    data['description'] = description;
    return data;
  }
}
