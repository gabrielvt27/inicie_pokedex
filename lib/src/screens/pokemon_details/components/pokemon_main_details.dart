import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inicie_pokedex/app_styles.dart';
import 'package:inicie_pokedex/src/models/pokemon_model.dart';
import 'package:inicie_pokedex/src/screens/home/components/pokemon_type_item.dart';
import 'package:inicie_pokedex/src/screens/pokemon_details/components/pokemon_details_description.dart';
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
          padding: kIsWeb
              ? const EdgeInsets.all(0)
              : const EdgeInsets.symmetric(
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
                  kIsWeb
                      ? Container()
                      : Row(
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
                    children: [
                      kIsWeb
                          ? const Text(
                              "Tipo:",
                              style: TextStyle(
                                color: AppStyles.kPrimaryTextColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          : Container(),
                      ...List.generate(
                        pokemonModel.types.length,
                        (index) => Container(
                          margin: const EdgeInsets.only(
                            left: AppStyles.kDefaultPadding / 2,
                          ),
                          child: PokemonTypeItem(
                            pokemonType: pokemonModel.types[index],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const Padding(
          padding: kIsWeb
              ? EdgeInsets.symmetric(
                  vertical: AppStyles.kDefaultPadding / 2,
                )
              : EdgeInsets.symmetric(
                  horizontal: AppStyles.kDefaultPadding,
                  vertical: AppStyles.kDefaultPadding / 2,
                ),
          child: Text(
            "Descrição",
            style: TextStyle(
              color: AppStyles.kPrimaryTextColor,
              fontSize: kIsWeb ? 22 : 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Padding(
          padding: kIsWeb
              ? const EdgeInsets.all(0)
              : const EdgeInsets.symmetric(
                  horizontal: AppStyles.kDefaultPadding,
                ),
          child: PokemonDetailsDescription(
            pokemonModel: pokemonModel,
            pokemonService: pokemonService,
          ),
        ),
      ],
    );
  }
}
