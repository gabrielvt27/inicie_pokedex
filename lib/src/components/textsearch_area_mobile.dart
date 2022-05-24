import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../app_styles.dart';

class TextSearchAreaMobile extends StatelessWidget {
  const TextSearchAreaMobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(AppStyles.kDefaultPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppStyles.kMobileSearchBackgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Pokedéx',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppStyles.kPrimaryTextColor,
                  ),
                ),
                const Text(
                  'Todas as espécies de pokémons\nestão esperando por você!',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppStyles.kPrimaryTextColor,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    right: AppStyles.kDefaultPadding * 3,
                    top: AppStyles.kDefaultPadding,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: AppStyles.kTextFieldBorder, //
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
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
                          AppStyles.kDefaultPadding / 1.3,
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/search.svg',
                        ),
                        decoration: BoxDecoration(
                          color: AppStyles.kButtonColor,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppStyles.kSecondaryTextColor
                                  .withOpacity(0.6),
                              blurRadius: 15,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/images/pikachu.png',
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
