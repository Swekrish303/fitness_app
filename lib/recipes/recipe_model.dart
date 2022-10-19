class RecipeModel {
  String label;
  String image;
  String source;
  String url;
  List<dynamic> dietLabels;

  RecipeModel({
    required this.label,
    required this.image,
    required this.source,
    required this.url,
    required this.dietLabels,
  });

  factory RecipeModel.fromMap(Map<String, dynamic> parsedJson) {
    return RecipeModel(
        image: parsedJson["image"],
        url: parsedJson["url"],
        source: parsedJson["source"],
        label: parsedJson["label"],
        dietLabels: parsedJson["dietLabels"]);
  }
}
