import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:souq_alqua/components/no_account_text.dart';
import 'package:souq_alqua/screens/authentication/sign_in/provider/login_provider.dart';
import 'package:souq_alqua/utils/constants.dart';

import 'package:souq_alqua/utils/image_class.dart';

class SignInScreen extends StatefulWidget {
  static String routeName = "/sign_in";

  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.only(top: 20, bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 10),
                          blurRadius: 50,
                          blurStyle: BlurStyle.outer,
                          color: Colors.black.withOpacity(0.23),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const Spacer(),

                        SizedBox(
                          height: 80,
                          child: Image.asset(
                            ImageClass.loginToyCar,
                          ),
                        ),
                        const Text(
                          "Welcome ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontFamily: kFontFamily,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Image.asset(
                          ImageClass.tcsLogo,
                          height: 60,
                        ),
                        // sub title
                        const Text(
                          "🚗 Explore ToyCar UAE: Discover a wide array of toy cars, from sports to off-road models.",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                            fontFamily: kFontFamily,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Consumer<LoginProvider>(
                        builder: (context, provider, child) =>
                            ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black),
                          icon: provider.loginScreenAuthLoader
                              ? LoadingAnimationWidget.horizontalRotatingDots(
                                  color: Colors.white,
                                  size: 30,
                                )
                              : Image.asset(ImageClass.googleLogo,
                                  height: 24, width: 24),
                          label: const Text(
                            'Sign in with Google',
                          ),
                          onPressed: () {
                            try {
                              provider.requestOTP().then((value) {
                                provider.setAuthLoader(false);
                              });
                            } catch (e) {
                              log(e.toString());
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      const NoAccountText(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
