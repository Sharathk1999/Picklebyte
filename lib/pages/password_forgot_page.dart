// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yumbite/core/colors.dart';
import 'package:yumbite/pages/signup_page.dart';

class PasswordForgotPage extends StatefulWidget {
  const PasswordForgotPage({super.key});

  @override
  State<PasswordForgotPage> createState() => _PasswordForgotPageState();
}

class _PasswordForgotPageState extends State<PasswordForgotPage> {
  //user email to sent resent link
  String email = "";

  //email controller
  TextEditingController emailController = TextEditingController();

  //formKey to validate
  final _formKey = GlobalKey<FormState>();

  //password reset method
  void passwordReset() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.white,
          content: const Text(
            "Your password reset link send to the email.",
            style: TextStyle(
                fontFamily: 'Lato', fontSize: 18, color: Colors.black),
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.white,
            content: const Text(
              "No user found for the email.",
              style: TextStyle(
                  fontFamily: 'Lato', fontSize: 18, color: Colors.black),
            ),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: btnColor.withOpacity(0.8),
      body: SizedBox(
        child: Column(
          children: [
            const SizedBox(
              height: 80.0,
            ),
            //heading
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 15),
              child: const Text(
                "Password Recovery",
                style: TextStyle(
                    letterSpacing: 1,
                    fontFamily: 'Lato',
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            //getting the email to send password reset link
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter your email';
                        }
                        return null;
                      },
                      style: const TextStyle(color: btnColor),
                      decoration: InputDecoration(
                          errorStyle: TextStyle(
                            fontFamily: 'Lato',
                            color: Colors.white,
                          ),
                          focusColor: btnColor,
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Your email",
                          hintStyle: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 18.0,
                              color: btnColor),
                          prefixIcon: Icon(
                            CupertinoIcons.person_crop_circle,
                            color: btnColor,
                            size: 30.0,
                          ),
                          isDense: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  //send btn with firebase pass reset
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          email = emailController.text.trim();
                        });
                      }
                      passwordReset();
                    },
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "send email",
                            style: TextStyle(
                                color: btnColor,
                                fontSize: 18.0,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  //redirecting to signUp page
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 18.0,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SignUp(),
                            ),
                          );
                        },
                        child: const Text(
                          "Create",
                          style: TextStyle(
                            fontFamily: 'Lato',
                            color: Colors.black87,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
