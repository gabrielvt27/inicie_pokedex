import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:inicie_pokedex/app_styles.dart';
import 'package:inicie_pokedex/src/models/pokemon_model.dart';
import 'package:inicie_pokedex/src/screens/home/components/banner_carousel.dart';
import 'package:inicie_pokedex/src/screens/home/components/banner_web.dart';
import 'package:inicie_pokedex/src/screens/pokemon_details/components/pokemon_details_stats.dart';
import 'package:inicie_pokedex/src/screens/pokemon_details/components/pokemon_main_details.dart';
import 'package:inicie_pokedex/src/services/pokemon_service.dart';
import 'package:inicie_pokedex/utils/sizeconfig.dart';

class HomeBodyTopWeb extends StatelessWidget {
  const HomeBodyTopWeb({
    Key? key,
    required this.pokemonService,
  }) : super(key: key);

  final PokemonService pokemonService;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<PokemonModel?>(
      valueListenable: pokemonService.pokemon,
      builder: (context, pokemonModel, child) {
        return SizedBox(
          height: SizeConfig.screenHeight * .5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: pokemonModel == null
                ? [
                    const Expanded(
                      flex: 2,
                      child: BannerWeb(),
                    ),
                    Expanded(
                      flex: 3,
                      child: SizedBox(
                        height: SizeConfig.screenHeight * .4,
                        child: BannerCarousel(
                          pokemonService: pokemonService,
                        ),
                      ),
                    ),
                  ]
                : [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PokemonMainDetails(
                            pokemonModel: pokemonModel,
                            pokemonService: pokemonService,
                          ),
                          const SizedBox(
                            height: AppStyles.kDefaultPadding,
                          ),
                          PokemonDetailsStats(
                            statsText: "Vida",
                            color: const Color(0XFFF7802A),
                            widthFactor: pokemonModel.hp / 100,
                          ),
                          const SizedBox(
                            height: AppStyles.kDefaultPadding / 2,
                          ),
                          PokemonDetailsStats(
                            statsText: "Defesa",
                            color: const Color(0XFFC4F789),
                            widthFactor: pokemonModel.defense / 100,
                          ),
                          const SizedBox(
                            height: AppStyles.kDefaultPadding / 2,
                          ),
                          PokemonDetailsStats(
                            statsText: "Velocidade",
                            color: const Color(0XFF49D0B0),
                            widthFactor: pokemonModel.speed / 100,
                          ),
                          const SizedBox(
                            height: AppStyles.kDefaultPadding / 2,
                          ),
                          PokemonDetailsStats(
                            statsText: "Ataque",
                            color: const Color(0XFFEA686D),
                            widthFactor: pokemonModel.attack / 100,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Container(
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
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0XFFEFF4FA),
                              ),
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(
                              AppStyles.kDefaultPadding,
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: IconButton(
                              icon: const Icon(
                                Icons.close,
                                color: Colors.grey,
                              ),
                              onPressed: () =>
                                  pokemonService.pokemon.value = null,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
          ),
        );
      },
    );
  }
}
