import 'package:flutter/material.dart';
import 'package:inicie_pokedex/app_styles.dart';
import 'package:inicie_pokedex/src/screens/home/components/grid_mais_procurados.dart';
import 'package:inicie_pokedex/src/screens/home/components/textsearch_area_mobile.dart';
import 'package:inicie_pokedex/src/screens/home/components/type_search_mobile.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
            children: const [
              TextSearchAreaMobile(),
              Padding(
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
              TypeSearchMobile(),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppStyles.kDefaultPadding,
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
              GridMaisProcurados(),
            ],
          ),
        ],
      ),
    );
  }
}
