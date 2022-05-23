import 'package:flutter/material.dart';
import 'package:inicie_pokedex/app_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppStyles.kBackgroundColor,
        iconTheme: const IconThemeData(color: AppStyles.kPrimaryTextColor),
        centerTitle: true,
        title: Image.asset(
          'assets/images/inicie_logo_horizontal_2.png',
        ),
        actions: [
          Image.asset(
            'assets/images/circle_avatar.png',
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: const EdgeInsets.all(AppStyles.kDefaultPadding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xFFF1B0B3).withOpacity(0.1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Pokedéx'),
                    Text(
                      'Todas as espécies de pokémons\nestão esperando por você!',
                    ),
                  ],
                ),
                Spacer(),
                Image.asset(
                  'assets/images/pikachu.png',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
