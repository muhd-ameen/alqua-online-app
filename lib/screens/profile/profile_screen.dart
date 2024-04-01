import 'package:alqua_online/screens/sign_in/provider/login_provider.dart';
import 'package:alqua_online/screens/sign_in/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
              FirebaseAuth.instance.currentUser!.displayName ?? "",
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
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const LogoutDialog();
                  },
                ).then((value) {
                  // This block executes when the dialog is dismissed.
                  if (value != null && value) {
                    LoginProvider loginProvider =
                        Provider.of<LoginProvider>(context, listen: false);

                    loginProvider.setOtpSend = false;
                    FirebaseAuth.instance.signOut();
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (context) {
                      return const SignInScreen();
                    }), (route) => false);
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Logout'),
      content: const Text('Are you sure you want to logout?'),
      actions: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.withOpacity(0.2)),
          onPressed: () {
            Navigator.of(context)
                .pop(false); // Dismiss the dialog and return false
          },
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.black45),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          onPressed: () {
            Navigator.of(context)
                .pop(true); // Dismiss the dialog and return true
          },
          child: const Text('Logout'),
        ),
      ],
    );
  }
}
