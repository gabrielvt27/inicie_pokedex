import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inicie_pokedex/app_styles.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int currentIndex = 0;

  void changeNavigationItem(int newIndex) {
    setState(() => currentIndex = newIndex);
  }

  List<Map<String, dynamic>> barItens = [
    {"label": "Home", "icon": "assets/icons/home.svg"},
    {"label": "Favoritos", "icon": "assets/icons/favorites.svg"},
    {"label": "Minha conta", "icon": "assets/icons/account.svg"},
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: AppStyles.kPrimaryTextColor,
      onTap: changeNavigationItem,
      items: List.generate(
        barItens.length,
        (index) => BottomNavigationBarItem(
          icon: SvgPicture.asset(
            barItens[index]["icon"],
            color: currentIndex == index
                ? AppStyles.kPrimaryTextColor
                : Colors.grey,
          ),
          label: barItens[index]["label"],
        ),
      ),
    );
  }
}
