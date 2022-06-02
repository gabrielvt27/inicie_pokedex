import 'package:flutter/material.dart';
import 'package:inicie_pokedex/app_styles.dart';
import 'package:inicie_pokedex/src/models/pokemon_model.dart';
import 'package:inicie_pokedex/src/services/pokemon_service.dart';

class PokemonDetailsDescription extends StatelessWidget {
  const PokemonDetailsDescription({
    Key? key,
    required this.pokemonModel,
    required this.pokemonService,
  }) : super(key: key);

  final PokemonModel pokemonModel;
  final PokemonService pokemonService;

  @override
  Widget build(BuildContext context) {
    return (pokemonModel.description == null)
        ? FutureBuilder<String?>(
            future: pokemonService.getDescriptionPokemon(pokemonModel),
            builder: (context, snapshot) {
              return (snapshot.hasData)
                  ? Text(
                      snapshot.data!,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppStyles.kPrimaryTextColor,
                      ),
                    )
                  : Container();
            },
          )
        : Text(
            pokemonModel.description!,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppStyles.kPrimaryTextColor,
            ),
          );
  }
}
