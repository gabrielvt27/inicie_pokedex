import 'package:flutter/material.dart';
import 'package:inicie_pokedex/app_styles.dart';
import 'package:inicie_pokedex/src/components/pokemon_card.dart';
import 'package:inicie_pokedex/src/models/pokemon_model.dart';
import 'package:inicie_pokedex/src/screens/pokemon_details/pokemon_details_screen.dart';
import 'package:inicie_pokedex/src/services/pokemon_service.dart';

class PokemonsMaisProcuradosMobile extends StatefulWidget {
  const PokemonsMaisProcuradosMobile({
    Key? key,
    required this.pokemonService,
  }) : super(key: key);

  final PokemonService pokemonService;

  @override
  State<PokemonsMaisProcuradosMobile> createState() =>
      _PokemonsMaisProcuradosMobileState();
}

class _PokemonsMaisProcuradosMobileState
    extends State<PokemonsMaisProcuradosMobile> {
  @override
  void initState() {
    super.initState();

    widget.pokemonService.fecthPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppStyles.kDefaultPadding,
      ),
      child: ValueListenableBuilder<List<PokemonModel>>(
        valueListenable: widget.pokemonService.pokemonList,
        builder: (context, pokemonList, child) {
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: pokemonList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: AppStyles.kDefaultPadding / 2,
              crossAxisSpacing: AppStyles.kDefaultPadding / 5,
              childAspectRatio: 1.3,
            ),
            itemBuilder: (context, index) {
              final pokemon = pokemonList[index];
              return PokemonCard(
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
              );
            },
          );
        },
      ),
    );
  }
}
