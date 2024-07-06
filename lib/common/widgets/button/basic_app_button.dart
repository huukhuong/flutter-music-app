import 'package:flutter/material.dart';
import 'package:spotify_clone/core/config/theme/app_colors.dart';

class BasicAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height;
  final Color? backgroundColor;
  final Color? textColor;

  const BasicAppButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.height,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(
            height ?? 70,
          ),
          backgroundColor: backgroundColor ?? AppColors.primary),
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(color: textColor ?? Colors.white),
      ),
    );
  }
}
