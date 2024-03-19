// ignore_for_file: library_private_types_in_public_api

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:alqua_online/screens/init_screen.dart';

import '../../../components/custom_surfix_icon.dart';

class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  String verificationIds = "";

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
        setState(() {
          verificationIds = verificationId;
          log("verificationId: $verificationId");
        });
        // Navigate to OTP verification screen with verificationId
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto retrieval timeout
      },
    );
  }

  Future<void> verifyOtp(String otp, String verificationId) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
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

  final TextEditingController _phoneNumberController =
      TextEditingController(text: "+971522160460");
  final TextEditingController _otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _phoneNumberController,
            keyboardType: TextInputType.phone,
            // controller: TextEditingController()..text = "user@alqua.online",
            onSaved: (newValue) => email = newValue,
            onChanged: (value) {
              // if (value.isNotEmpty) {
              //   removeError(error: kEmailNullError);
              // } else if (emailValidatorRegExp.hasMatch(value)) {
              //   removeError(error: kInvalidEmailError);
              // }
              // return;
            },
            validator: (value) {
              return null;

              // if (value!.isEmpty) {
              //   addError(error: kEmailNullError);
              //   return "";
              // } else if (!emailValidatorRegExp.hasMatch(value)) {
              //   addError(error: kInvalidEmailError);
              //   return "";
              // }
              // return null;
            },
            decoration: const InputDecoration(
              labelText: "Phone Number",
              hintText: "Please enter phone number",
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Call.svg"),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              sendOtp(_phoneNumberController.text);
              // if (_formKey.currentState!.validate()) {
              //   _formKey.currentState!.save();
              //   // if all are valid then go to success screen
              //   KeyboardUtil.hideKeyboard(context);
              //   Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              // }
            },
            child: const Text("Send otp"),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _otpController,
            keyboardType: TextInputType.phone,
            onChanged: (value) {
              // if (value.isNotEmpty) {
              //   removeError(error: kEmailNullError);
              // } else if (emailValidatorRegExp.hasMatch(value)) {
              //   removeError(error: kInvalidEmailError);
              // }
              // return;
            },
            decoration: const InputDecoration(
              labelText: "OTP",
              hintText: "Please enter OTP",
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Call.svg"),
            ),
          ),

          // TextFormField(
          //   controller: TextEditingController()..text = "user@alqua.online",
          //   obscureText: true,
          //   onSaved: (newValue) => password = newValue,
          //   onChanged: (value) {
          //     if (value.isNotEmpty) {
          //       removeError(error: kPassNullError);
          //     } else if (value.length >= 8) {
          //       removeError(error: kShortPassError);
          //     }
          //     return;
          //   },
          //   validator: (value) {
          //     if (value!.isEmpty) {
          //       addError(error: kPassNullError);
          //       return "";
          //     } else if (value.length < 8) {
          //       addError(error: kShortPassError);
          //       return "";
          //     }
          //     return null;
          //   },
          //   decoration: const InputDecoration(
          //     labelText: "Password",
          //     hintText: "Enter your password",
          //     // If  you are using latest version of flutter then lable text and hint text shown like this
          //     // if you r using flutter less then 1.20.* then maybe this is not working properly
          //     floatingLabelBehavior: FloatingLabelBehavior.always,
          //     suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
          //   ),
          // ),
          // const SizedBox(height: 20),
          // Row(
          //   children: [
          //     Checkbox(
          //       value: remember,
          //       activeColor: kPrimaryColor,
          //       onChanged: (value) {
          //         setState(() {
          //           remember = value;
          //         });
          //       },
          //     ),
          //     const Text("Remember me"),
          //     const Spacer(),
          //     GestureDetector(
          //       onTap: () => Navigator.pushNamed(
          //           context, ForgotPasswordScreen.routeName),
          //       child: const Text(
          //         "Forgot Password",
          //         style: TextStyle(decoration: TextDecoration.underline),
          //       ),
          //     )
          //   ],
          // ),
          // FormError(errors: errors),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // if (_formKey.currentState!.validate()) {
              //   _formKey.currentState!.save();
              //   // if all are valid then go to success screen
              //   KeyboardUtil.hideKeyboard(context);
              //   Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              // }
              verifyOtp(_otpController.text, verificationIds);
            },
            child: const Text("Verify OTP"),
          ),
        ],
      ),
    );
  }
}
