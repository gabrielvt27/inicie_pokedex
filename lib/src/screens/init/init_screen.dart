import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../app_styles.dart';
import '../home/home_screen.dart';
import '../../components/poke_banner.dart';
import '../../components/poke_banner_title.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: AppStyles.kDefaultPadding,
                vertical: AppStyles.kDefaultPadding,
              ),
              child: const PokeBanner(),
            ),
            PokeBannerTitle(
              textAlign: CrossAxisAlignment.center,
              widget: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppStyles.kDefaultPadding * 4,
                  vertical: AppStyles.kDefaultPadding,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppStyles.kSecondaryTextColor.withOpacity(0.6),
                        blurRadius: 15,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: AppStyles.kSecondaryTextColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Spacer(),
                          Text(
                            'Começar',
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          ),
                          const Spacer(),
                          SvgPicture.asset(
                            'assets/icons/arrow_rigth.svg',
                          ),
                        ],
                      ),
                    ),
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
