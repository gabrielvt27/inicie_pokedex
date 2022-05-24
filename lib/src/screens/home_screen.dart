import 'package:flutter/material.dart';

import '../../app_styles.dart';
import '../components/textsearch_area_mobile.dart';
import '../components/type_search_mobile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset('assets/images/dots1_banner.png'),
            ),
            SizedBox(
              height: size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  TextSearchAreaMobile(),
                  TypeSearchMobile(),
                ],
              ),
            ),
            Positioned(
              top: 260,
              left: 10,
              child: Image.asset('assets/images/dots1_banner.png'),
            ),
          ],
        ),
      ),
    );
  }
}
