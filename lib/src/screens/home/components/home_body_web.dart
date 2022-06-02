import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:inicie_pokedex/app_styles.dart';
import 'package:inicie_pokedex/src/screens/home/components/action_button.dart';
import 'package:inicie_pokedex/src/screens/home/components/home_body_top_web.dart';
import 'package:inicie_pokedex/src/screens/home/components/home_body_top_web_responsive.dart';
import 'package:inicie_pokedex/src/screens/home/components/pokemons_mais_procurados_web.dart';
import 'package:inicie_pokedex/src/services/pokemon_service.dart';
import 'package:inicie_pokedex/utils/sizeconfig.dart';

class HomeBodyWeb extends StatelessWidget {
  HomeBodyWeb({Key? key}) : super(key: key);

  final PokemonService pokemonService = PokemonService(Dio());
  final CarouselController carouselController = CarouselController();

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
            Container(
              alignment: SizeConfig.screenWidth >= 900
                  ? Alignment.topLeft
                  : Alignment.center,
              child: Image.asset(
                'assets/images/inicie_logo_horizontal_2.png',
              ),
            ),
            const SizedBox(
              height: AppStyles.kDefaultPadding * 3,
            ),
            ...SizeConfig.screenWidth >= 900
                ? buildComponentsWeb()
                : buildComponentsWebResponsive(),
          ],
        ),
      ),
    );
  }

  List<Widget> buildComponentsWeb() {
    return [
      HomeBodyTopWeb(pokemonService: pokemonService),
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
  }

  List<Widget> buildComponentsWebResponsive() {
    return [
      HomeBodyTopWebResponsive(pokemonService: pokemonService),
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
