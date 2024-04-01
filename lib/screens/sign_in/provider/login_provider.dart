import 'dart:developer';

import 'package:alqua_online/screens/init_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool isGuestLogin = false;

  String verificationIds = "";
  bool otpSend = false;

  set setOtpSend(bool value) {
    otpSend = value;
    notifyListeners();
  }

  Future<void> sendOtp(String phoneNumber) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {
        // Automatic verification
      },
      verificationFailed: (FirebaseAuthException e) {
        // Handle verification failure
      },
      codeSent: (String verificationId, int? resendToken) {
        verificationIds = verificationId;
        otpSend = true;
        log("verificationId: $verificationId");
        notifyListeners();
        // Navigate to OTP verification screen with verificationId
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto retrieval timeout
      },
    );
  }

  Future<void> verifyOtp(String otp, BuildContext context) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationIds,
        smsCode: otp,
      );
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) => Navigator.pushNamed(context, InitScreen.routeName));

      // OTP verified, navigate to home screen
    } catch (e) {
      // Handle verification failure
    }
  }

  Future<void> resendOtp(String phoneNumber) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {
        // Automatic verification
      },
      verificationFailed: (FirebaseAuthException e) {
        // Handle verification failure
      },
      codeSent: (String verificationId, int? resendToken) {
        verificationIds = verificationId;
        otpSend = true;
        log("verificationId: $verificationId");
        notifyListeners();
        // Navigate to OTP verification screen with verificationId
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto retrieval timeout
      },
    );
  }
}
