import 'package:flutter/material.dart';

class PokeBanner extends StatelessWidget {
  const PokeBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Image.asset(
            'assets/images/inicie_logo_horizontal_2.png',
          ),
        ),
        Positioned(
          top: 230,
          right: 30,
          child: Image.asset('assets/images/dots1_banner.png'),
        ),
        Positioned(
          top: 45,
          left: 110,
          child: Image.asset('assets/images/dots2_banner.png'),
        ),
        Positioned(
          child: Image.asset('assets/images/pokemon_banner.png'),
        ),
      ],
    );
  }
}
