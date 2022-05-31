import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:inicie_pokedex/app_styles.dart';
import 'package:inicie_pokedex/src/screens/home/components/banner_carousel.dart';
import 'package:inicie_pokedex/src/screens/home/components/banner_web.dart';
import 'package:inicie_pokedex/src/services/pokemon_service.dart';
import 'package:inicie_pokedex/utils/sizeconfig.dart';

class HomeBodyWeb extends StatelessWidget {
  HomeBodyWeb({Key? key}) : super(key: key);

  final PokemonService pokemonService = PokemonService(Dio());

  List<Widget> layout() {
    if (SizeConfig.screenWidth >= 800) {
      return [
        SizedBox(
          height: SizeConfig.screenHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                flex: 2,
                child: BannerWeb(),
              ),
              Expanded(
                flex: 3,
                child: BannerCarousel(
                  pokemonService: pokemonService,
                ),
              ),
            ],
          ),
        ),
      ];
    } else {
      return [
        const BannerWeb(),
        const SizedBox(
          height: AppStyles.kDefaultPadding,
        ),
        SizedBox(
          height: SizeConfig.screenHeight / 2,
          child: BannerCarousel(
            pokemonService: pokemonService,
          ),
        ),
      ];
    }
  }

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
            ...layout(),
          ],
        ),
      ),
    );
  }
}
