import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './app_styles.dart';
import './src/screens/init_screen.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inicie Pokedéx',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppStyles.kBackgroundColor,
        textTheme: GoogleFonts.nunitoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const InitScreen(),
    );
  }
}
