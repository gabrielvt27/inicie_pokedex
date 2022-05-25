import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:inicie_pokedex/app_styles.dart';
import 'package:inicie_pokedex/src/screens/home/components/pokemon_type_item.dart';
import 'package:inicie_pokedex/src/services/pokemon_service.dart';

class GridMaisProcurados extends StatefulWidget {
  const GridMaisProcurados({
    Key? key,
  }) : super(key: key);

  @override
  State<GridMaisProcurados> createState() => _GridMaisProcuradosState();
}

class _GridMaisProcuradosState extends State<GridMaisProcurados> {
  final pokemonService = PokemonService(Dio());

  @override
  void initState() {
    super.initState();
    pokemonService.getMostWantedPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppStyles.kDefaultPadding,
      ),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: AppStyles.kDefaultPadding / 2,
          crossAxisSpacing: AppStyles.kDefaultPadding / 5,
          childAspectRatio: 1.3,
        ),
        itemBuilder: (context, index) => Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('nome'),
                  PokemonTypeItem(
                    color: Colors.amber,
                    typeName: "aaa",
                  ),
                  Text('#COD'),
                ],
              ),
              Expanded(
                child: Image.asset(
                  'assets/images/pokemon_card_background.png',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
