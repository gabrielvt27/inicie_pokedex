import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inicie_pokedex/app_styles.dart';
import 'package:inicie_pokedex/src/components/poke_banner_title.dart';
import 'package:inicie_pokedex/src/components/pokemon_card.dart';
import 'package:inicie_pokedex/src/models/pokemon_model.dart';
import 'package:inicie_pokedex/src/screens/pokemon_details/pokemon_details_screen.dart';
import 'package:inicie_pokedex/src/services/pokemon_service.dart';
import 'package:inicie_pokedex/utils/constants.dart';

class HomeBodyWeb extends StatelessWidget {
  HomeBodyWeb({Key? key}) : super(key: key);

  final PokemonService pokemonService = PokemonService(Dio());
  final CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: PokeBannerTitle(
                    textAlign: CrossAxisAlignment.start,
                    widget: Container(
                      margin: const EdgeInsets.only(
                        right: AppStyles.kDefaultPadding * 3,
                        top: AppStyles.kDefaultPadding,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFADADAD),
                            blurRadius: 15,
                            offset: Offset(0, 4),
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: TextField(
                                cursorColor: AppStyles.kButtonColor,
                                style: TextStyle(
                                  color: AppStyles.kPrimaryTextColor,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(
                              AppStyles.kDefaultPadding / 2,
                            ),
                            child: const Text(
                              'Buscar',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 22,
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: AppStyles.kButtonColor,
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppStyles.kSecondaryTextColor
                                      .withOpacity(0.6),
                                  blurRadius: 15,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: FutureBuilder<List<PokemonModel>>(
                      future: pokemonService.getMostWantedPokemons(
                          url: apiInitialRoute),
                      builder: (context, snapshot) {
                        if (ConnectionState.done == snapshot.connectionState) {
                          return Stack(
                            children: [
                              CarouselSlider(
                                carouselController: buttonCarouselController,
                                options: CarouselOptions(
                                    aspectRatio: 3.0,
                                    viewportFraction: .3,
                                    enlargeCenterPage: true,
                                    onPageChanged: (currentPage, reason) {
                                      print(currentPage);
                                    }),
                                items: List.generate(
                                  snapshot.data!.length,
                                  (index) {
                                    final pokemon = snapshot.data![index];
                                    return PokemonCard(
                                      pokemon: pokemon,
                                      onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              PokemonDetailsScreen(
                                            pokemonModel: pokemon,
                                            pokemonService: pokemonService,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Positioned(
                                top: 140,
                                left: 280,
                                child: FloatingActionButton(
                                  onPressed: () =>
                                      buttonCarouselController.previousPage(),
                                  child: const Icon(
                                    Icons.keyboard_arrow_left_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 140,
                                right: 280,
                                child: FloatingActionButton(
                                  onPressed: () =>
                                      buttonCarouselController.nextPage(),
                                  child: const Icon(
                                    Icons.keyboard_arrow_right_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Container();
                        }
                      }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
