import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../app_styles.dart';

class PokeBannerTitle extends StatelessWidget {
  const PokeBannerTitle({
    Key? key,
    this.textAlign = CrossAxisAlignment.center,
    this.widget,
  }) : super(key: key);

  final CrossAxisAlignment textAlign;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: textAlign,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: GoogleFonts.nunito(
              fontSize: 35,
              fontWeight: FontWeight.w700,
            ),
            children: const [
              TextSpan(
                  text: "Explore o mundo dos ",
                  style: TextStyle(color: AppStyles.kPrimaryTextColor)),
              TextSpan(
                  text: "Pokémons",
                  style: TextStyle(color: AppStyles.kSecondaryTextColor)),
            ],
          ),
        ),
        const Text(
          'Descubra todas as espécies de Pokémons',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: AppStyles.kPrimaryTextColor,
          ),
        ),
        if (widget != null) widget!,
      ],
    );
  }
}
