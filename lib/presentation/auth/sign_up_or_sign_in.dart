import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/common/helpers/is_dark.dart';
import 'package:spotify_clone/common/widgets/app_bar/app_bar.dart';
import 'package:spotify_clone/common/widgets/button/basic_app_button.dart';
import 'package:spotify_clone/core/config/assets/app_images.dart';
import 'package:spotify_clone/core/config/assets/app_vectors.dart';

class SignUpOrSignInPage extends StatelessWidget {
  const SignUpOrSignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BasicAppBar(),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
              AppVectors.topPattern,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(
              AppVectors.bottomPattern,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              AppImages.authBG,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppVectors.logo),
                  const SizedBox(height: 21),
                  const Text(
                    "Enjoy Listening To Music",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(height: 21),
                  const Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim ven",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 21),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: BasicAppButton(
                            onPressed: () {},
                            title: "Register",
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: BasicAppButton(
                            onPressed: () {},
                            title: "Sign In",
                            backgroundColor: Colors.transparent,
                            textColor: context.isDarkMode
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
