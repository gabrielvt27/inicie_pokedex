import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:inicie_pokedex/app_styles.dart';
import 'package:inicie_pokedex/src/components/pokemon_card.dart';
import 'package:inicie_pokedex/src/models/pokemon_model.dart';
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
      future: widget.pokemonService.fetchPokemonsBanner(),
      builder: (context, pokemonList) {
        return (pokemonList.hasData)
            ? LayoutBuilder(builder: (context, constraints) {
                final width = constraints.biggest.width;
                final height = constraints.biggest.height;
                return Stack(
                  children: [
                    CarouselSlider.builder(
                      carouselController: buttonCarouselController,
                      options: CarouselOptions(
                        initialPage: currentIndex,
                        viewportFraction:
                            SizeConfig.screenWidth >= 800 ? .3 : 1,
                        enlargeCenterPage: true,
                        aspectRatio: 3.0,
                        height: SizeConfig.screenWidth >= 800
                            ? height / 2
                            : SizeConfig.screenWidth / 2,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      ),
                      itemCount: pokemonList.data!.length,
                      itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) {
                        final pokemon = pokemonList.data![itemIndex];
                        return Padding(
                          padding: SizeConfig.screenWidth >= 800
                              ? const EdgeInsets.all(0)
                              : EdgeInsets.symmetric(
                                  horizontal: SizeConfig.screenWidth * .2,
                                ),
                          child: Opacity(
                            opacity: currentIndex == itemIndex ? 1 : .5,
                            child: PokemonCard(
                              pokemon: pokemon,
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PokemonDetailsScreen(
                                    pokemonModel: pokemon,
                                    pokemonService: widget.pokemonService,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    Positioned(
                      top: SizeConfig.screenWidth >= 800
                          ? height * .2
                          : height * .4,
                      left: SizeConfig.screenWidth >= 800
                          ? width * .19
                          : width * .05,
                      width: SizeConfig.screenWidth >= 800
                          ? width / 3
                          : SizeConfig.screenWidth / 3,
                      child: SizedBox(
                        height: width / 25,
                        width: width / 25,
                        child: FloatingActionButton(
                          backgroundColor: AppStyles.kSecondaryTextColor,
                          onPressed: () =>
                              buttonCarouselController.previousPage(),
                          child: Icon(
                            Icons.keyboard_arrow_left_rounded,
                            color: Colors.white,
                            size: width / 25,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: SizeConfig.screenWidth >= 800
                          ? height * .2
                          : height * .4,
                      right: SizeConfig.screenWidth >= 800
                          ? width * .19
                          : width * .05,
                      width: SizeConfig.screenWidth >= 800
                          ? width / 3
                          : SizeConfig.screenWidth / 3,
                      child: SizedBox(
                        height: width / 25,
                        width: width / 25,
                        child: FloatingActionButton(
                          backgroundColor: AppStyles.kSecondaryTextColor,
                          onPressed: () => buttonCarouselController.nextPage(),
                          child: Icon(
                            Icons.keyboard_arrow_right_rounded,
                            color: Colors.white,
                            size: width / 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              })
            : Container();
      },
    );
  }
}
