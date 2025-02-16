import 'package:flutter/material.dart';
import 'package:spotify_clone/common/helpers/constants.dart';
import 'package:spotify_clone/core/config/theme/app_colors.dart';

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const Dialog(
        backgroundColor: Colors.transparent,
        child: SizedBox(
          width: 50,
          height: 50,
          child: Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          ),
        ),
      );
    },
  );
}

void hideLoadingDialog(BuildContext context) {
  Navigator.of(context, rootNavigator: true).pop();
}

String getImageUrlFromFileName(String? fileName) {
  return "$baseFileUrl/covers%2F$fileName$imageExtension";
}

String getSongUrlFromFileName(String? fileName) {
  return "$baseFileUrl/songs%2F$fileName$songExtension";
}
