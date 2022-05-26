import 'package:flutter/material.dart';
import 'package:inicie_pokedex/app_styles.dart';
import 'package:inicie_pokedex/src/models/pokemon_type_model.dart';

class PokemonTypeItem extends StatelessWidget {
  const PokemonTypeItem({
    Key? key,
    required this.pokemonType,
  }) : super(key: key);

  final PokemonTypeModel pokemonType;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        horizontal: AppStyles.kDefaultPadding / 2,
        vertical: AppStyles.kDefaultPadding / 4,
      ),
      decoration: BoxDecoration(
        color: pokemonType.color,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Text(
        pokemonType.name,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
