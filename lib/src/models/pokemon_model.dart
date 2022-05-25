import 'package:inicie_pokedex/src/models/pokemon_type_model.dart';

class PokemonModel {
  String id;
  String name;
  String url;
  String imageUrl;
  List<PokemonTypeModel>? types;

  PokemonModel({
    required this.id,
    required this.name,
    required this.url,
    required this.imageUrl,
    this.types,
  });

  factory PokemonModel.fromJson(Map json) {
    return PokemonModel(
      id: json['id'],
      name: json['name'],
      url: json['imageLink'],
      imageUrl: json['imageUrl'],
      types: json['type'],
    );
  }
}
