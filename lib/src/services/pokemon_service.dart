import 'package:dio/dio.dart';

class PokemonService {
  final Dio dio;

  PokemonService(this.dio);

  Future getMostWantedPokemons() async {
    final response =
        await dio.get('https://pokeapi.co/api/v2/pokemon/?limit=20&offset=0');

    print(response);
  }
}
