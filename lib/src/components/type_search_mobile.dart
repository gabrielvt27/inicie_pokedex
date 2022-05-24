import 'package:flutter/material.dart';

import '../../app_styles.dart';

class TypeSearchMobile extends StatelessWidget {
  const TypeSearchMobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppStyles.kDefaultPadding * 5,
      padding: const EdgeInsets.only(
        left: AppStyles.kDefaultPadding * 2,
        top: AppStyles.kDefaultPadding,
        bottom: AppStyles.kDefaultPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Tipo',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppStyles.kPrimaryTextColor,
            ),
          ),
          const SizedBox(
            height: AppStyles.kDefaultPadding / 2,
          ),
          Expanded(
            flex: 1,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: types.length,
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(right: 8),
                  width: AppStyles.kDefaultPadding * 3.5,
                  decoration: BoxDecoration(
                    color: types[index]["color"],
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Text(
                    types[index]["name"],
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

List<Map> types = [
  {"name": "Normal", "color": const Color(0xFFa9a79f)},
  {"name": "Lutador", "color": const Color(0xFFdd3b4e)},
  {"name": "Voador", "color": const Color(0xFFa4beec)},
  {"name": "Veneno", "color": const Color(0xFFc063d2)},
  {"name": "Terra", "color": const Color(0xFFd59363)},
  {"name": "Pedra", "color": const Color(0xFFd3c891)},
  {"name": "Inseto", "color": const Color(0xFF92c12b)},
  {"name": "Fantasma", "color": const Color(0xFF7271cf)},
  {"name": "Ferro", "color": const Color(0xFF4d9da5)},
  {"name": "Fogo", "color": const Color(0xFFffae4c)},
  {"name": "Água", "color": const Color(0xFF559bd9)},
  {"name": "Grama", "color": const Color(0xFF5bc06f)},
  {"name": "Elétrico", "color": const Color(0xFFf9df6d)},
  {"name": "Psíquico", "color": const Color(0xFFfe9b94)},
  {"name": "Gelo", "color": const Color(0xFF8ad9d2)},
  {"name": "Dragão", "color": const Color(0xFF017dbd)},
  {"name": "Sombrio", "color": const Color(0xFF6f7684)},
  {"name": "Fada", "color": const Color(0xFFf4a7e5)},
];
