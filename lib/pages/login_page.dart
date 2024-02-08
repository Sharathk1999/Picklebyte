// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yumbite/core/colors.dart';
import 'package:yumbite/pages/bottom_nav_bar.dart';
import 'package:yumbite/pages/password_forgot_page.dart';
import 'package:yumbite/pages/signup_page.dart';
import 'package:yumbite/widgets/helper_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //credentials for user login
  String email = "", password = "";

  //key for managing the form state
  final _formKey = GlobalKey<FormState>();

  //controller for handling user mail/pass
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();

  //user login
  void loginUser() async {
    try {
      UserCredential credential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green.shade300,
            content:  const Text(
              "Welcome home user 😍🤗.",
              style: TextStyle(fontFamily: 'Lato', fontSize: 18),
            ),
          ),
        );
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BottomNavBar(),));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red.shade300,
            content: const Text(
              "User not found in the database.",
              style: TextStyle(fontFamily: 'Lato', fontSize: 18),
            ),
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red.shade300,
            content: const Text(
              "Wrong password provided for the user.",
              style: TextStyle(fontFamily: 'Lato', fontSize: 18),
            ),
          ),
        );
      }
    }
  }

  //dispose method to avoid memory leak
  @override
  void dispose() {
    super.dispose();
    userEmailController.dispose();
    userPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            //background  gradient red container
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: gradientColors,
                ),
              ),
            ),
            //2nd background white container
            Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: const Text(""),
            ),
            //foreground white container for login
            Container(
              margin: const EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
              child: Column(
                children: [
                  Center(
                    child: Shimmer.fromColors(
                      baseColor: Colors.white,
                      highlightColor: const Color.fromARGB(255, 224, 225, 231),
                      child: const Text(
                        "YumByte",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Lato",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  //login card
                  Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 1.6,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 30.0,
                            ),
                            Text(
                              "Login",
                              style: HelperWidget.headerTextStyle(),
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            //TextFormField for E-mail
                            TextFormField(
                              controller: userEmailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'please enter your email';
                                }
                                return null;
                              },
                              style: const TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 16,
                                  decoration: TextDecoration.none),
                             
                              decoration: InputDecoration(
                                errorStyle: const TextStyle(fontFamily: 'Lato'),
                                isDense: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide.none),
                                filled: true,
                                fillColor: btnColor.withOpacity(0.2),
                                hintText: 'Email',
                                hintStyle: HelperWidget.semiBoldTextStyle(),
                                prefixIcon: const Icon(
                                  CupertinoIcons.mail,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            //TextFormField for password
                            TextFormField(
                              controller: userPasswordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'please enter your password';
                                }
                                return null;
                              },
                              obscureText: true,
                              style: const TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 16,
                                  decoration: TextDecoration.none),
                              decoration: InputDecoration(
                                errorStyle: const TextStyle(fontFamily: 'Lato'),
                                isDense: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide.none),
                                filled: true,
                                fillColor: btnColor.withOpacity(0.2),
                                hintText: 'Password',
                                hintStyle: HelperWidget.semiBoldTextStyle(),
                                prefixIcon: const Icon(
                                  CupertinoIcons.padlock,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            //for forgot password func
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PasswordForgotPage(),));
                              },
                              child: Container(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    "Forgot Password?",
                                    style: HelperWidget.semiBoldTextStyle(),
                                  )),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 20,
                            ),
                            //Login btn for form validation and user login
                            GestureDetector(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    email = userEmailController.text.trim();
                                    password = userPasswordController.text.trim();
                                  });
                                }
                                loginUser();
                              },
                              child: Material(
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  width: 200,
                                  decoration: BoxDecoration(
                                      color: btnColor,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: const Center(
                                      child: Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 70.0,
                  ),
                  //for redirecting to signUp for creating account
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SignUp(),
                        ),
                      );
                    },
                    child: Text(
                      "Don't have an account? Sign up",
                      style: HelperWidget.semiBoldTextStyle(),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
