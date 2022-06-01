import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:inicie_pokedex/src/components/pokemon_card.dart';
import 'package:inicie_pokedex/src/models/pokemon_model.dart';
import 'package:inicie_pokedex/src/screens/home/components/action_button.dart';
import 'package:inicie_pokedex/src/services/pokemon_service.dart';
import 'package:inicie_pokedex/utils/constants.dart';
import 'package:inicie_pokedex/utils/sizeconfig.dart';

class PokemonsMaisProcuradosWeb extends StatefulWidget {
  const PokemonsMaisProcuradosWeb({
    Key? key,
    required this.pokemonService,
    required this.carouselController,
  }) : super(key: key);

  final PokemonService pokemonService;
  final CarouselController carouselController;

  @override
  State<PokemonsMaisProcuradosWeb> createState() =>
      _PokemonsMaisProcuradosWebState();
}

class _PokemonsMaisProcuradosWebState extends State<PokemonsMaisProcuradosWeb> {
  final CarouselController buttonCarouselController = CarouselController();

  @override
  void initState() {
    super.initState();

    widget.pokemonService.fecthPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight * .5,
      width: double.maxFinite,
      child: ValueListenableBuilder<List<PokemonModel>>(
        valueListenable: widget.pokemonService.pokemonList,
        builder: (context, pokemonList, child) {
          if (pokemonList.isEmpty) return Container();

          return SizeConfig.screenWidth >= 900
              ? CarouselSlider.builder(
                  carouselController: widget.carouselController,
                  options: CarouselOptions(
                    scrollPhysics: const NeverScrollableScrollPhysics(),
                    padEnds: false,
                    viewportFraction: .2,
                    disableCenter: true,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, reason) {
                      if (index ==
                          pokemonList.length - (limitPokemonsApi / 2) - 1) {
                        widget.pokemonService.fecthPokemons();
                      }
                    },
                  ),
                  itemCount: pokemonList.length,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
                    final pokemon = pokemonList[itemIndex];
                    return PokemonCard(
                      pokemon: pokemon,
                      onTap: () =>
                          widget.pokemonService.pokemon.value = pokemon,
                    );
                  },
                )
              : LayoutBuilder(
                  builder: (context, constraints) {
                    final width = constraints.maxWidth;
                    final height = constraints.maxHeight;
                    return CarouselSlider.builder(
                      carouselController: buttonCarouselController,
                      options: CarouselOptions(
                        scrollPhysics: const NeverScrollableScrollPhysics(),
                        viewportFraction:
                            SizeConfig.screenWidth >= 900 ? .3 : 1,
                        enlargeCenterPage: true,
                        height: SizeConfig.screenHeight,
                        onPageChanged: (index, reason) {
                          if (index == pokemonList.length - 1) {
                            widget.pokemonService.fecthPokemons();
                          }
                        },
                      ),
                      itemCount: pokemonList.length,
                      itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) {
                        final pokemon = pokemonList[itemIndex];
                        return Stack(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        );
                      },
                    );
                  },
                );
        },
      ),
    );
  }
}
