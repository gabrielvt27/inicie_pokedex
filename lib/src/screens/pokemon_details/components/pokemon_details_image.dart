import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:inicie_pokedex/app_styles.dart';
import 'package:inicie_pokedex/src/models/pokemon_model.dart';

class PokemonDetailsImage extends StatelessWidget {
  const PokemonDetailsImage({
    Key? key,
    required this.pokemonModel,
  }) : super(key: key);

  final PokemonModel pokemonModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppStyles.kDefaultPadding * 2),
      decoration: BoxDecoration(
        color: AppStyles.kMobileSearchBackgroundColor,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      child: CachedNetworkImage(
        imageUrl: pokemonModel.imageUrl,
        placeholder: (context, url) => Container(
          margin: const EdgeInsets.only(
            left: AppStyles.kDefaultPadding,
            top: AppStyles.kDefaultPadding,
          ),
          child: const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(
              AppStyles.kSecondaryTextColor,
            ),
          ),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
