import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:inicie_pokedex/app_styles.dart';
import 'package:inicie_pokedex/src/models/pokemon_model.dart';
import 'package:inicie_pokedex/src/screens/home/components/action_button.dart';
import 'package:inicie_pokedex/src/screens/home/components/banner_carousel.dart';
import 'package:inicie_pokedex/src/screens/home/components/banner_web.dart';
import 'package:inicie_pokedex/src/screens/home/components/pokemons_mais_procurados_web.dart';
import 'package:inicie_pokedex/src/screens/pokemon_details/components/pokemon_details_stats.dart';
import 'package:inicie_pokedex/src/screens/pokemon_details/components/pokemon_main_details.dart';
import 'package:inicie_pokedex/src/services/pokemon_service.dart';
import 'package:inicie_pokedex/utils/sizeconfig.dart';

class HomeBodyWeb extends StatelessWidget {
  HomeBodyWeb({Key? key}) : super(key: key);

  final PokemonService pokemonService = PokemonService(Dio());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppStyles.kDefaultPadding * 2,
          vertical: AppStyles.kDefaultPadding / 2,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/inicie_logo_horizontal_2.png',
            ),
            const SizedBox(
              height: AppStyles.kDefaultPadding * 3,
            ),
            ...buildComponents(),
          ],
        ),
      ),
    );
  }

  List<Widget> buildComponents() {
    final CarouselController carouselController = CarouselController();

    if (SizeConfig.screenWidth >= 900) {
      return [
        ValueListenableBuilder<PokemonModel?>(
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
                                PokemonDetailsStats(
                                  statsText: "Defesa",
                                  color: const Color(0XFFC4F789),
                                  widthFactor: pokemonModel.defense / 100,
                                ),
                                PokemonDetailsStats(
                                  statsText: "Velocidade",
                                  color: const Color(0XFF49D0B0),
                                  widthFactor: pokemonModel.speed / 100,
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
                                CachedNetworkImage(
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
            }),
        const SizedBox(
          height: AppStyles.kDefaultPadding,
        ),
        Row(
          children: [
            const Text(
              'Mais procurados',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: AppStyles.kPrimaryTextColor,
              ),
            ),
            const Spacer(),
            ActionButton(
              icon: Icons.keyboard_arrow_left_rounded,
              size: AppStyles.kDefaultPadding * 1.5,
              onTap: () => carouselController.previousPage(),
            ),
            const SizedBox(
              width: AppStyles.kDefaultPadding / 2,
            ),
            ActionButton(
              icon: Icons.keyboard_arrow_right_rounded,
              size: AppStyles.kDefaultPadding * 1.5,
              onTap: () => carouselController.nextPage(),
            ),
          ],
        ),
        PokemonsMaisProcuradosWeb(
          pokemonService: pokemonService,
          carouselController: carouselController,
        ),
      ];
    } else {
      return [
        ValueListenableBuilder<PokemonModel?>(
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
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PokemonMainDetails(
                        pokemonModel: pokemonModel,
                        pokemonService: pokemonService,
                      ),
                      Center(
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
                      const SizedBox(
                        height: AppStyles.kDefaultPadding,
                      ),
                      PokemonDetailsStats(
                        statsText: "Vida",
                        color: const Color(0XFFF7802A),
                        widthFactor: pokemonModel.hp / 100,
                      ),
                      PokemonDetailsStats(
                        statsText: "Defesa",
                        color: const Color(0XFFC4F789),
                        widthFactor: pokemonModel.defense / 100,
                      ),
                      PokemonDetailsStats(
                        statsText: "Velocidade",
                        color: const Color(0XFF49D0B0),
                        widthFactor: pokemonModel.speed / 100,
                      ),
                      PokemonDetailsStats(
                        statsText: "Ataque",
                        color: const Color(0XFFEA686D),
                        widthFactor: pokemonModel.attack / 100,
                      ),
                    ],
                  );
          },
        ),
        const SizedBox(
          height: AppStyles.kDefaultPadding,
        ),
        const Center(
          child: Text(
            'Mais procurados',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: AppStyles.kPrimaryTextColor,
            ),
          ),
        ),
        const SizedBox(
          height: AppStyles.kDefaultPadding,
        ),
        PokemonsMaisProcuradosWeb(
          pokemonService: pokemonService,
          carouselController: carouselController,
        ),
      ];
    }
  }
}
