import 'package:flutter/material.dart';
import 'package:inicie_pokedex/app_styles.dart';
import 'package:inicie_pokedex/src/components/pokemon_type_item.dart';

class GridMaisProcurados extends StatelessWidget {
  const GridMaisProcurados({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppStyles.kDefaultPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Mais Procurados',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppStyles.kPrimaryTextColor,
              ),
            ),
            Expanded(
              child: GridView.builder(
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
                      Container(
                        color: Colors.green,
                        child: Column(
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
            ),
          ],
        ),
      ),
    );
  }
}
