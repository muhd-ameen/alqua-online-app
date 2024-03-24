import 'package:alqua_online/screens/sign_in/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'components/profile_menu.dart';
import 'components/profile_pic.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";

  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const ProfilePic(),
            const SizedBox(height: 10),
            Text(
              FirebaseAuth.instance.currentUser!.displayName!,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text(
              FirebaseAuth.instance.currentUser!.phoneNumber!,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: 10),
            ProfileMenu(
              text: "My Account",
              icon: "assets/icons/User Icon.svg",
              press: () => {
                // firebaseauth display name to "Abdul Samad"
                FirebaseAuth.instance.currentUser!
                    .updateDisplayName("Abdul Samad")
              },
            ),
            ProfileMenu(
              text: "Settings",
              icon: "assets/icons/Settings.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Help Center",
              icon: "assets/icons/Question mark.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Log Out",
              icon: "assets/icons/Log out.svg",
              press: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) {
                  return const SignInScreen();
                }), (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
