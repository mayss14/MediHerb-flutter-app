class PlantModel {
  int? id;
  String nom = "";
  String description = "";
  List<String> proprietes = [];
  List<String> utilisations = [];
  List<String> precautions = [];
  List<String> interactions_medicamenteuses = [];
  String image = "";

  PlantModel(
      {required this.id,
      required this.nom,
      required this.description,
      required this.proprietes,
      required this.utilisations,
      required this.precautions,
      required this.interactions_medicamenteuses,
      required this.image});

  PlantModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    description = json['description'];
    for (var element in json['proprietes']) {
      proprietes.add(element);
    }
    for (var element in json['utilisations']) {
      utilisations.add(element);
    }
    for (var element in json['precautions']) {
      precautions.add(element);
    }
    for (var element in json['interactions_medicamenteuses']) {
      interactions_medicamenteuses.add(element);
    }
    image = json['url_photo'];
  }
}
