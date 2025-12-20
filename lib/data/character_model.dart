class CharacterModel {
  CharacterModel({
    required this.name,
    required this.imageUrl,
    required this.status,
    required this.species,
    required this.gender,
  });
  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      name: json['name'] as String,
      imageUrl: json['image'] as String,
      status: json['status'] as String,
      species: json['species'] as String,
      gender: json['gender'] as String,
    );
  }
  final String name;
  final String imageUrl;
  final String status;
  final String species;
  final String gender;
}
