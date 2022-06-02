import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:inicie_pokedex/app_styles.dart';
import 'package:inicie_pokedex/src/models/pokemon_model.dart';
import 'package:inicie_pokedex/src/screens/home/components/banner_carousel.dart';
import 'package:inicie_pokedex/src/screens/home/components/banner_web.dart';
import 'package:inicie_pokedex/src/screens/home/components/pokemon_type_item.dart';
import 'package:inicie_pokedex/src/screens/pokemon_details/components/pokemon_details_description.dart';
import 'package:inicie_pokedex/src/screens/pokemon_details/components/pokemon_details_stats.dart';
import 'package:inicie_pokedex/src/services/pokemon_service.dart';
import 'package:inicie_pokedex/utils/sizeconfig.dart';

class HomeBodyTopWebResponsive extends StatelessWidget {
  const HomeBodyTopWebResponsive({
    Key? key,
    required this.pokemonService,
  }) : super(key: key);

  final PokemonService pokemonService;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<PokemonModel?>(
      valueListenable: pokemonService.pokemon,
      builder: (context, pokemonModel, child) {
        return pokemonModel == null
            ? Column(
                children: [
                  const BannerWeb(),
                  const SizedBox(
                    height: AppStyles.kDefaultPadding * 2,
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * .5,
                    child: Center(
                      child: BannerCarousel(
                        pokemonService: pokemonService,
                      ),
                    ),
                  ),
                ],
              )
            : Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        pokemonModel.name,
                        style: const TextStyle(
                          color: AppStyles.kPrimaryTextColor,
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: AppStyles.kDefaultPadding / 4,
                      ),
                      Text(
                        "Cod: ${pokemonModel.cod}",
                        style: const TextStyle(
                          color: AppStyles.kPrimaryTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: AppStyles.kDefaultPadding / 4,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Tipo:",
                            style: TextStyle(
                              color: AppStyles.kPrimaryTextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          ...List.generate(
                            pokemonModel.types.length,
                            (index) => Container(
                              margin: const EdgeInsets.only(
                                left: AppStyles.kDefaultPadding / 2,
                              ),
                              child: PokemonTypeItem(
                                pokemonType: pokemonModel.types[index],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: AppStyles.kDefaultPadding,
                      ),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0XFFEFF4FA),
                            ),
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(
                            AppStyles.kDefaultPadding,
                          ),
                          child: CachedNetworkImage(
                            height: SizeConfig.screenHeight * .5,
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
                        ),
                      ),
                      const SizedBox(
                        height: AppStyles.kDefaultPadding,
                      ),
                      const Text(
                        "Descrição",
                        style: TextStyle(
                          color: AppStyles.kPrimaryTextColor,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      PokemonDetailsDescription(
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
                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Colors.grey,
                      ),
                      onPressed: () => pokemonService.pokemon.value = null,
                    ),
                  ),
                ],
              );
      },
    );
  }
}
