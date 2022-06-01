import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:inicie_pokedex/app_styles.dart';
import 'package:inicie_pokedex/src/components/pokemon_card.dart';
import 'package:inicie_pokedex/src/models/pokemon_model.dart';
import 'package:inicie_pokedex/src/screens/home/components/action_button.dart';
import 'package:inicie_pokedex/src/screens/pokemon_details/pokemon_details_screen.dart';
import 'package:inicie_pokedex/src/services/pokemon_service.dart';
import 'package:inicie_pokedex/utils/sizeconfig.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({
    Key? key,
    required this.pokemonService,
  }) : super(key: key);

  final PokemonService pokemonService;

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  final CarouselController buttonCarouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
      future: widget.pokemonService.fetchPokemonsBanner(),
      builder: (context, pokemonList) {
        return (pokemonList.hasData)
            ? LayoutBuilder(builder: (context, constraints) {
                final width = constraints.maxWidth;
                final height = constraints.maxHeight;
                return CarouselSlider.builder(
                  carouselController: buttonCarouselController,
                  options: CarouselOptions(
                    scrollPhysics: const NeverScrollableScrollPhysics(),
                    initialPage: currentIndex,
                    viewportFraction: SizeConfig.screenWidth >= 900 ? .3 : 1,
                    enlargeCenterPage: true,
                    height: SizeConfig.screenHeight,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                  itemCount: pokemonList.data!.length,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
                    final pokemon = pokemonList.data![itemIndex];
                    return currentIndex == itemIndex
                        ? Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: width * .01,
                                ),
                                child: PokemonCard(
                                  pokemon: pokemon,
                                  onTap: () => widget
                                      .pokemonService.pokemon.value = pokemon,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ActionButton(
                                    icon: Icons.keyboard_arrow_left_rounded,
                                    size: height / 10,
                                    onTap: () =>
                                        buttonCarouselController.previousPage(),
                                  ),
                                  ActionButton(
                                    icon: Icons.keyboard_arrow_right_rounded,
                                    size: height / 10,
                                    onTap: () =>
                                        buttonCarouselController.nextPage(),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : Opacity(
                            opacity: .5,
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: width * .01,
                              ),
                              child: PokemonCard(
                                pokemon: pokemon,
                              ),
                            ),
                          );
                  },
                );
              })
            : Container();
      },
    );
  }
}
