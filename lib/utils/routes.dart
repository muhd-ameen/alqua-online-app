import 'package:flutter/widgets.dart';
import 'package:alqua_online/screens/init_screen.dart';
import 'package:alqua_online/screens/splash/splash_screen.dart';

import 'package:alqua_online/screens/complete_profile/complete_profile_screen.dart';
import 'package:alqua_online/screens/forgot_password/forgot_password_screen.dart';
import 'package:alqua_online/screens/home/home_screen.dart';
import 'package:alqua_online/screens/login_success/login_success_screen.dart';
import 'package:alqua_online/screens/otp/otp_screen.dart';
import 'package:alqua_online/screens/profile/profile_screen.dart';
import 'package:alqua_online/screens/sign_in/sign_in_screen.dart';
import 'package:alqua_online/screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  InitScreen.routeName: (context) => const InitScreen(),
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => const LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => const CompleteProfileScreen(),
  OtpScreen.routeName: (context) => const OtpScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
};
