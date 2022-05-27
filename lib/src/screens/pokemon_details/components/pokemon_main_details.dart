import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inicie_pokedex/app_styles.dart';
import 'package:inicie_pokedex/src/models/pokemon_model.dart';
import 'package:inicie_pokedex/src/screens/home/components/pokemon_type_item.dart';
import 'package:inicie_pokedex/src/services/pokemon_service.dart';

class PokemonMainDetails extends StatelessWidget {
  const PokemonMainDetails({
    Key? key,
    required this.pokemonModel,
    required this.pokemonService,
  }) : super(key: key);

  final PokemonModel pokemonModel;
  final PokemonService pokemonService;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppStyles.kDefaultPadding,
            vertical: AppStyles.kDefaultPadding / 2,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pokemonModel.name,
                    style: const TextStyle(
                      color: AppStyles.kPrimaryTextColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: AppStyles.kDefaultPadding / 4,
                  ),
                  Text(
                    "Cod: ${pokemonModel.cod}",
                    style: const TextStyle(
                      color: AppStyles.kPrimaryTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/like.svg',
                      ),
                      SvgPicture.asset(
                        'assets/icons/share.svg',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: AppStyles.kDefaultPadding / 4,
                  ),
                  Row(
                    children: List.generate(
                      pokemonModel.types.length,
                      (index) => Container(
                        margin: const EdgeInsets.only(
                          left: AppStyles.kDefaultPadding / 2,
                        ),
                        child: PokemonTypeItem(
                          pokemonType: pokemonModel.types[index],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppStyles.kDefaultPadding,
            vertical: AppStyles.kDefaultPadding / 2,
          ),
          child: Text(
            "Descrição",
            style: TextStyle(
              color: AppStyles.kPrimaryTextColor,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppStyles.kDefaultPadding,
          ),
          child: (pokemonModel.description == null)
              ? FutureBuilder<String?>(
                  future: pokemonService.getDescriptionPokemon(pokemonModel),
                  builder: (context, snapshot) {
                    return (snapshot.hasData)
                        ? Text(
                            snapshot.data!,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppStyles.kPrimaryTextColor,
                            ),
                          )
                        : Container();
                  },
                )
              : Text(
                  pokemonModel.description!,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppStyles.kPrimaryTextColor,
                  ),
                ),
        ),
      ],
    );
  }
}
