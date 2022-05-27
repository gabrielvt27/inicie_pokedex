import 'package:flutter/material.dart';

import 'package:inicie_pokedex/src/components/custom_app_bar.dart';
import 'package:inicie_pokedex/src/components/custom_bottom_navigation_bar.dart';
import 'package:inicie_pokedex/src/models/pokemon_model.dart';
import 'package:inicie_pokedex/src/screens/pokemon_details/components/pokemon_details_body.dart';
import 'package:inicie_pokedex/src/services/pokemon_service.dart';

class PokemonDetailsScreen extends StatelessWidget {
  const PokemonDetailsScreen({
    Key? key,
    required this.pokemonModel,
    required this.pokemonService,
  }) : super(key: key);

  final PokemonModel pokemonModel;
  final PokemonService pokemonService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: PokemonDetailsBody(
        pokemonModel: pokemonModel,
        pokemonService: pokemonService,
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
