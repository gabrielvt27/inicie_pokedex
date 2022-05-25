import 'package:flutter/material.dart';
import 'package:inicie_pokedex/app_styles.dart';

class PokemonTypeItem extends StatelessWidget {
  const PokemonTypeItem({
    Key? key,
    required this.color,
    required this.typeName,
  }) : super(key: key);

  final Color color;
  final String typeName;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(
        horizontal: AppStyles.kDefaultPadding,
        vertical: AppStyles.kDefaultPadding / 4,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Text(
        typeName,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
