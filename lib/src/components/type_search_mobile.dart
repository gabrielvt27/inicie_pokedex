import 'package:flutter/material.dart';
import 'package:inicie_pokedex/src/components/pokemon_type_item.dart';
import 'package:inicie_pokedex/utils/pokemon_types.dart';

import '../../app_styles.dart';

class TypeSearchMobile extends StatelessWidget {
  const TypeSearchMobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppStyles.kDefaultPadding * 5,
      padding: const EdgeInsets.only(
        left: AppStyles.kDefaultPadding,
        top: AppStyles.kDefaultPadding,
        bottom: AppStyles.kDefaultPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Tipo',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppStyles.kPrimaryTextColor,
            ),
          ),
          const SizedBox(
            height: AppStyles.kDefaultPadding / 2,
          ),
          Expanded(
            flex: 1,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: pokemonTypes.length,
              itemBuilder: (context, index) {
                return PokemonTypeItem(
                  color: pokemonTypes[index]["color"],
                  typeName: pokemonTypes[index]["name"],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
