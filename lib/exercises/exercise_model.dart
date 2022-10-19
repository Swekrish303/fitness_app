class ExerciseModel {
  String title;
  String gif;
  String seconds;

  ExerciseModel({
    required this.title,
    required this.gif,
    required this.seconds,
  });

  factory ExerciseModel.fromMap(Map<String, dynamic> parsedJson) {
    return ExerciseModel(
      title: parsedJson["title"],
      gif: parsedJson["gif"],
      seconds: parsedJson["seconds"],
    );
  }
}
