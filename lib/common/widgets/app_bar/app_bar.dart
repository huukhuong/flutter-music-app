import 'package:flutter/material.dart';
import 'package:spotify_clone/common/helpers/is_dark.dart';

class BasicAppBar extends StatelessWidget {
  const BasicAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: context.isDarkMode
                ? Colors.white.withOpacity(.03)
                : Colors.black.withOpacity(.04),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 12,
            color: context.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
