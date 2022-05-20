import 'package:flutter/material.dart';
import 'package:inicie_pokedex/app_styles.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              color: Colors.amber,
              child: Stack(
                children: [
                  Positioned(
                    child: Image.asset(
                        'assets/images/inicie_logo_horizontal_2.png'),
                  ),
                  Positioned(
                    top: 230,
                    right: AppStyles.kDefaultPadding,
                    child: Image.asset('assets/images/dots1_banner.png'),
                  ),
                  Positioned(
                    child: Image.asset('assets/images/dots2_banner.png'),
                  ),
                  Positioned(
                    child: Image.asset('assets/images/pokemon_banner.png'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
