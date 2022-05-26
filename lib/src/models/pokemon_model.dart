import 'package:inicie_pokedex/src/models/pokemon_type_model.dart';
import '../../utils/extensions.dart';

class PokemonModel {
  int id;
  String name;
  String cod;
  String? description;
  String descriptionUrl;
  int hp;
  int attack;
  int defense;
  int weight;
  int height;
  String url;
  String imageUrl;
  List<PokemonTypeModel> types;

  PokemonModel({
    required this.id,
    required this.name,
    required this.cod,
    this.description,
    required this.descriptionUrl,
    required this.hp,
    required this.attack,
    required this.defense,
    required this.weight,
    required this.height,
    required this.url,
    required this.imageUrl,
    required this.types,
  });

  factory PokemonModel.fromJson(Map json) {
    final stats = {};

    for (Map stat in json['stats']) {
      stats.addAll({
        stat["stat"]["name"]: stat['base_stat'],
      });
    }

    final types = <PokemonTypeModel>[];
    for (Map type in json['types']) {
      types.add(
        pokemonTypeList.firstWhere(
          (element) => element.nameApi == type["type"]["name"],
        ),
      );
    }

    return PokemonModel(
      id: json['id'],
      name: (json['name'] as String).toCapitalized(),
      cod: "#${json['id'].toString().padLeft(3, '0')}",
      url: 'https://pokeapi.co/api/v2/pokemon/${json['id']}/',
      imageUrl: json['sprites']['other']['official-artwork']['front_default'],
      types: types,
      descriptionUrl: 'https://pokeapi.co/api/v2/pokemon-species/${json['id']}',
      hp: stats['hp'],
      attack: stats["attack"],
      defense: stats['defense'],
      weight: json['weight'],
      height: json['height'],
    );
  }
}
