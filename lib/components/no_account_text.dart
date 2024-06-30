import 'package:souq_alqua/screens/authentication/sign_in/provider/login_provider.dart';
import 'package:souq_alqua/screens/authentication/sign_up/sign_up_screen.dart';
import 'package:souq_alqua/screens/home/init_screen.dart';
import 'package:flutter/material.dart';
import 'package:souq_alqua/utils/constants.dart';
import 'package:provider/provider.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, snap, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: GestureDetector(
            onTap: () {
              snap.updateGuestLogin = true;
              Navigator.pushNamed(context, InitScreen.routeName);
            },
            child: const Text(
              "Continue as guest?",
              style: TextStyle(fontSize: 16, color: kPrimaryColor),
            ),
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "looking for guest login? ",
            style: TextStyle(fontSize: 16),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, SignUpScreen.routeName),
            child: const Text(
              "Skip login",
              style: TextStyle(fontSize: 16, color: kPrimaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
