import 'package:flutter/material.dart';
import 'package:inicie_pokedex/app_styles.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    required this.icon,
    this.onTap,
    this.size,
  }) : super(key: key);

  final double? size;
  final VoidCallback? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircleAvatar(
        backgroundColor: AppStyles.kSecondaryTextColor,
        child: InkWell(
          onTap: onTap,
          child: Icon(
            icon,
            color: Colors.white,
            size: size,
          ),
        ),
      ),
    );
  }
}
