import 'package:flutter/material.dart';
import 'package:inicie_pokedex/app_styles.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.backButton = true,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;
  final bool backButton;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppStyles.kBackgroundColor,
      iconTheme: const IconThemeData(color: AppStyles.kPrimaryTextColor),
      leading: (widget.backButton)
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
      centerTitle: true,
      title: Image.asset(
        'assets/images/inicie_logo_horizontal_2.png',
      ),
      actions: [
        Image.asset(
          'assets/images/circle_avatar.png',
        ),
      ],
    );
  }
}
