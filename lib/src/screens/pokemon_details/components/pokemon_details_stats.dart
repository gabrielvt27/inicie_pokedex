import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:inicie_pokedex/app_styles.dart';

class PokemonDetailsStats extends StatelessWidget {
  const PokemonDetailsStats({
    Key? key,
    required this.statsText,
    required this.color,
    required this.widthFactor,
  }) : super(key: key);

  final String statsText;
  final Color color;
  final double widthFactor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            statsText,
            style: const TextStyle(
              color: AppStyles.kPrimaryTextColor,
              fontSize: kIsWeb ? 16 : 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: const Color(0xFFFBFDFF),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: kIsWeb
                      ? AppStyles.kDefaultPadding
                      : AppStyles.kDefaultPadding / 2,
                  child: FractionallySizedBox(
                    widthFactor: widthFactor > 1 ? 1 : widthFactor,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: color,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
