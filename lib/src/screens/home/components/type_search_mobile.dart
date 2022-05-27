import 'package:flutter/material.dart';
import 'package:inicie_pokedex/app_styles.dart';
import 'package:inicie_pokedex/src/models/pokemon_type_model.dart';
import 'package:inicie_pokedex/src/screens/home/components/pokemon_type_item.dart';

class TypeSearchMobile extends StatelessWidget {
  const TypeSearchMobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppStyles.kDefaultPadding / 2,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            pokemonTypeList.length,
            (index) {
              EdgeInsets margin;
              if (index == 0) {
                margin = const EdgeInsets.only(
                  left: AppStyles.kDefaultPadding,
                  right: AppStyles.kDefaultPadding / 2,
                );
              } else if (index < pokemonTypeList.length - 1) {
                margin = const EdgeInsets.only(
                  right: AppStyles.kDefaultPadding / 2,
                );
              } else {
                margin = const EdgeInsets.only(
                  right: AppStyles.kDefaultPadding,
                );
              }

              PokemonTypeModel pokemonType = pokemonTypeList[index];

              return Container(
                margin: margin,
                child: PokemonTypeItem(
                  pokemonType: pokemonType,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
