import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:inicie_pokedex/app_styles.dart';
import 'package:inicie_pokedex/src/screens/home/components/grid_mais_procurados.dart';
import 'package:inicie_pokedex/src/screens/home/components/textsearch_area_mobile.dart';
import 'package:inicie_pokedex/src/screens/home/components/type_search_mobile.dart';
import 'package:inicie_pokedex/src/services/pokemon_service.dart';

class HomeBodyMobile extends StatefulWidget {
  const HomeBodyMobile({Key? key}) : super(key: key);

  @override
  State<HomeBodyMobile> createState() => _HomeBodyMobileState();
}

class _HomeBodyMobileState extends State<HomeBodyMobile> {
  final PokemonService pokemonService = PokemonService(Dio());
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        pokemonService.getMostWantedPokemons();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset('assets/images/dots1_banner.png'),
          ),
          Positioned(
            top: 260,
            left: 10,
            child: Image.asset('assets/images/dots1_banner.png'),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const TextSearchAreaMobile(),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppStyles.kDefaultPadding,
                ),
                child: Text(
                  'Tipo',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppStyles.kPrimaryTextColor,
                  ),
                ),
              ),
              const TypeSearchMobile(),
              const Padding(
                padding: EdgeInsets.only(
                  left: AppStyles.kDefaultPadding,
                  right: AppStyles.kDefaultPadding,
                  top: AppStyles.kDefaultPadding,
                  bottom: AppStyles.kDefaultPadding / 2,
                ),
                child: Text(
                  'Mais Procurados',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppStyles.kPrimaryTextColor,
                  ),
                ),
              ),
              GridMaisProcurados(
                pokemonService: pokemonService,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
