import 'package:flutter/material.dart';
import 'package:inicie_pokedex/src/screens/home/components/home_body.dart';

import '../../../app_styles.dart';

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
      body: const HomeBody(),
    );
  }
}
