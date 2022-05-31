import 'package:flutter/material.dart';
import 'package:inicie_pokedex/app_styles.dart';
import 'package:inicie_pokedex/src/components/poke_banner_title.dart';

class BannerWeb extends StatelessWidget {
  const BannerWeb({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PokeBannerTitle(
      columnAlign: CrossAxisAlignment.start,
      textAlign: TextAlign.start,
      widget: Container(
        margin: const EdgeInsets.only(
          top: AppStyles.kDefaultPadding,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xFFADADAD),
              blurRadius: 15,
              offset: Offset(0, 4),
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Row(
          children: [
            const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: TextField(
                  cursorColor: AppStyles.kButtonColor,
                  style: TextStyle(
                    color: AppStyles.kPrimaryTextColor,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(
                AppStyles.kDefaultPadding / 2,
              ),
              child: const Text(
                'Buscar',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                ),
              ),
              decoration: BoxDecoration(
                color: AppStyles.kButtonColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppStyles.kSecondaryTextColor.withOpacity(0.6),
                    blurRadius: 15,
                    offset: const Offset(0, 4),
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
