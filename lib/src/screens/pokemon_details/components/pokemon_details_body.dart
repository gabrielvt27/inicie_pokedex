import 'package:flutter/material.dart';
import 'package:inicie_pokedex/app_styles.dart';
import 'package:inicie_pokedex/src/models/pokemon_model.dart';
import 'package:inicie_pokedex/src/screens/pokemon_details/components/pokemon_details_image.dart';
import 'package:inicie_pokedex/src/screens/pokemon_details/components/pokemon_details_stats.dart';
import 'package:inicie_pokedex/src/screens/pokemon_details/components/pokemon_main_details.dart';
import 'package:inicie_pokedex/src/services/pokemon_service.dart';

class PokemonDetailsBody extends StatelessWidget {
  const PokemonDetailsBody({
    Key? key,
    required this.pokemonModel,
    required this.pokemonService,
  }) : super(key: key);

  final PokemonModel pokemonModel;
  final PokemonService pokemonService;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PokemonDetailsImage(
            pokemonModel: pokemonModel,
          ),
          PokemonMainDetails(
            pokemonModel: pokemonModel,
            pokemonService: pokemonService,
          ),
          const SizedBox(
            height: AppStyles.kDefaultPadding,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: AppStyles.kDefaultPadding,
              right: AppStyles.kDefaultPadding * 3,
              bottom: AppStyles.kDefaultPadding / 2,
            ),
            child: PokemonDetailsStats(
              statsText: "Vida",
              color: const Color(0XFFF7802A),
              widthFactor: pokemonModel.hp / 100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: AppStyles.kDefaultPadding,
              right: AppStyles.kDefaultPadding * 3,
              bottom: AppStyles.kDefaultPadding / 2,
            ),
            child: PokemonDetailsStats(
              statsText: "Defesa",
              color: const Color(0XFFC4F789),
              widthFactor: pokemonModel.defense / 100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: AppStyles.kDefaultPadding,
              right: AppStyles.kDefaultPadding * 3,
              bottom: AppStyles.kDefaultPadding / 2,
            ),
            child: PokemonDetailsStats(
              statsText: "Ataque",
              color: const Color(0XFFEA686D),
              widthFactor: pokemonModel.attack / 100,
            ),
          ),
        ],
      ),
    );
  }
}
