import 'package:flutter/material.dart';

import 'package:inicie_pokedex/src/components/custom_app_bar.dart';
import 'package:inicie_pokedex/src/components/custom_bottom_navigation_bar.dart';
import 'package:inicie_pokedex/src/screens/home/components/home_body_mobile.dart';
import 'package:inicie_pokedex/src/screens/home/components/home_body_web.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return kIsWeb
        ? Scaffold(
            body: HomeBodyWeb(),
          )
        : const Scaffold(
            drawer: Drawer(),
            appBar: CustomAppBar(
              backButton: false,
            ),
            body: HomeBodyMobile(),
            bottomNavigationBar: CustomBottomNavigationBar(),
          );
  }
}
