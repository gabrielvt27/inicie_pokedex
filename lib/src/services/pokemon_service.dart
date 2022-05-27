import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:inicie_pokedex/src/models/pokemon_model.dart';
import 'package:inicie_pokedex/utils/constants.dart';

class PokemonService {
  ValueNotifier<List<PokemonModel>> pokemonList =
      ValueNotifier(<PokemonModel>[]);
  String? nextPage = apiInitialRoute;

  final Dio dio;

  PokemonService(this.dio);

  getMostWantedPokemons({String? url}) async {
    nextPage = (url != null) ? url : nextPage;

    if (nextPage != null) {
      final response = await dio.get(nextPage!);

      if (response.statusCode == 200) {
        nextPage = response.data["next"] as String?;

        final pokemonsDataList = response.data["results"] as List;
        List<PokemonModel> pokemonListApi = <PokemonModel>[];

        for (Map pokemonData in pokemonsDataList) {
          final pokemon = await _getPokemonData(pokemonData["url"]);

          if (pokemon != null) {
            pokemonListApi.add(pokemon);
          }
        }

        pokemonList.value = [...pokemonList.value, ...pokemonListApi];
      }
    }
  }

  Future<PokemonModel?> _getPokemonData(String pokemonUrl) async {
    final response = await dio.get(pokemonUrl);

    if (response.statusCode == 200) {
      return PokemonModel.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<String?> getDescriptionPokemon(PokemonModel pokemon) async {
    final response = await dio.get(pokemon.descriptionUrl);

    if (response.statusCode == 200) {
      final flavorText = response.data!["flavor_text_entries"] as List;
      final description = flavorText
          .firstWhere((element) => element["language"]["name"] == "en");
      pokemon.description =
          "\"${description["flavor_text"].replaceAll("\n", " ")}\"";
      final index =
          pokemonList.value.indexWhere((element) => element.id == pokemon.id);
      pokemonList.value[index] = pokemon;
      return pokemon.description;
    } else {
      return null;
    }
  }
}
