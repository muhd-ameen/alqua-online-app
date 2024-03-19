import 'package:flutter/material.dart';
import 'package:alqua_online/utils/constants.dart';

import '../screens/sign_up/sign_up_screen.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
