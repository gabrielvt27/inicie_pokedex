import 'package:flutter/material.dart';
import 'package:inicie_pokedex/app_styles.dart';
import 'package:inicie_pokedex/src/models/pokemon_model.dart';
import 'package:inicie_pokedex/src/screens/home/components/pokemon_type_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    Key? key,
    required this.pokemon,
    this.onTap,
  }) : super(key: key);

  final PokemonModel pokemon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 8,
        child: kIsWeb
            ? Padding(
                padding: const EdgeInsets.all(
                  AppStyles.kDefaultPadding / 2,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.maxFinite,
                      child: Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            pokemon.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppStyles.kPrimaryTextColor,
                            ),
                          ),
                          Text(
                            pokemon.cod,
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppStyles.kPrimaryTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: CachedNetworkImage(
                        imageUrl: pokemon.imageUrl,
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      child: Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          const Text(
                            "Altura:",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppStyles.kPrimaryTextColor,
                            ),
                          ),
                          Text(
                            '${pokemon.height}cm',
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppStyles.kPrimaryTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      child: Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          const Text(
                            "Peso",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppStyles.kPrimaryTextColor,
                            ),
                          ),
                          Text(
                            '${pokemon.weight}kg',
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppStyles.kPrimaryTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: AppStyles.kDefaultPadding / 4,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pokemon.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppStyles.kPrimaryTextColor,
                          ),
                        ),
                        const SizedBox(
                          height: AppStyles.kDefaultPadding / 4,
                        ),
                        PokemonTypeItem(
                          pokemonType: pokemon.types[0],
                        ),
                        const SizedBox(
                          height: AppStyles.kDefaultPadding / 4,
                        ),
                        Text(
                          pokemon.cod,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppStyles.kPrimaryTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/pokemon_card_background.png',
                        ),
                        CachedNetworkImage(
                          imageUrl: pokemon.imageUrl,
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
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
