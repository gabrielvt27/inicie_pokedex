import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inicie_pokedex/src/screens/home/home_screen.dart';

import './app_styles.dart';
import 'src/screens/init/init_screen.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inicie Pokedéx',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppStyles.kBackgroundColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.nunitoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: kIsWeb ? const HomeScreen() : const InitScreen(),
    );
  }
}
