// ignore_for_file: library_private_types_in_public_api

import 'package:alqua_online/screens/sign_in/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../components/custom_surfix_icon.dart';

class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, snap, child) => Visibility(
        visible: !snap.otpSend,
        replacement: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                    text: TextSpan(
                  text: "OTP sent to ",
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: _phoneNumberController.text,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                )),
                //Change number
                TextButton(
                  onPressed: () {
                    _phoneNumberController.clear();
                    snap.setOtpSend = false;
                  },
                  child: const Text(
                    "Change",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _otpController,
              keyboardType: TextInputType.phone,
              inputFormatters: // Only numbers can be entered
                  <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              maxLength: 6,
              decoration: const InputDecoration(
                labelText: "OTP",
                hintText: "Please enter OTP",
                // If  you are using latest version of flutter then lable text and hint text shown like this
                // if you r using flutter less then 1.20.* then maybe this is not working properly
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Call.svg"),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_otpController.text.isNotEmpty &&
                    snap.verificationIds.isNotEmpty &&
                    _otpController.text.length == 6) {
                  snap.verifyOtp(_otpController.text, context);
                } else {
                  // snackbar
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please enter valid OTP"),
                    ),
                  );
                }
              },
              child: const Text("Verify OTP"),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: "Phone Number",
                hintText: "Please enter phone number",
                prefixStyle: TextStyle(color: Colors.black),
                prefixText: '+971 ',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                prefixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Call.svg"),
              ),
            ),
            const SizedBox(height: 10),
            //error message

            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (_phoneNumberController.text.isNotEmpty &&
                    _phoneNumberController.text.contains("+971") &&
                    _phoneNumberController.text.length > 12) {
                  snap.sendOtp(_phoneNumberController.text);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please enter valid phone number"),
                    ),
                  );
                }
              },
              child: const Text("Send otp"),
            ),
          ],
        ),
      ),
    );
  }
}
