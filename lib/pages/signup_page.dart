// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yumbite/core/colors.dart';
import 'package:yumbite/pages/bottom_nav_bar.dart';
import 'package:yumbite/pages/login_page.dart';
import 'package:yumbite/widgets/helper_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  //credentials
  String name = "", email = "", password = "";

  //controllers for credentials
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  //formKey for validating the fields
  final _formkey = GlobalKey<FormState>();

  //user registration using FirebaseAuth
  void registerUser() async {
    if (password.isNotEmpty) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green.shade300,
            content: const Text(
              "User Registered Successfully",
              style: TextStyle(fontFamily: 'Lato', fontSize: 18),
            ),
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomNavBar(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red.shade300,
              content: const Text(
                "Weak Password try again",
                style: TextStyle(fontFamily: 'Lato', fontSize: 18),
              ),
            ),
          );
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.amber.shade300,
              content: const Text(
                "Email already in use, try another",
                style: TextStyle(fontFamily: 'Lato', fontSize: 18),
              ),
            ),
          );
        }
      }
    }
  }

  //disposing controllers to avoid memory leak
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    passwordController.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            //red gradient container background
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
            //white container background
            Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: const Text(""),
            ),
            //main container foreground
            Container(
              margin: const EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
              child: Column(
                children: [
                  //brand name with shimmer effect
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
                    height: 40.0,
                  ),
                  //material widget which holds signUp credentials 
                  Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 1.62,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "Sign up",
                              style: HelperWidget.headerTextStyle(),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            //name field
                            TextFormField(
                              controller: nameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter name';
                                }
                                return null;
                              },
                              style: const TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 16,
                                  decoration: TextDecoration.none),
                              decoration: InputDecoration(
                                  isDense: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide.none),
                                  filled: true,
                                  fillColor: btnColor.withOpacity(0.2),
                                  hintText: 'Name',
                                  hintStyle: HelperWidget.semiBoldTextStyle(),
                                  prefixIcon:
                                      const Icon(Icons.person_outlined)),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            //e-mail field
                            TextFormField(
                              controller: emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter e-mail';
                                }
                                return null;
                              },
                              style: const TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 16,
                                  decoration: TextDecoration.none),
                              decoration: InputDecoration(
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
                              height: 10.0,
                            ),
                            //password field
                            TextFormField(
                              controller: passwordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter password';
                                }
                                return null;
                              },
                              style: const TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 16,
                                  decoration: TextDecoration.none),
                              obscureText: true,
                              decoration: InputDecoration(
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
                              height: 80.0,
                            ),
                            //signUp button with form validation & user-registration
                            GestureDetector(
                              onTap: () async {
                                if (_formkey.currentState!.validate()) {
                                  setState(() {
                                    name = nameController.text.trim();
                                    email = emailController.text.trim();
                                    password = passwordController.text.trim();
                                  });
                                }
                                registerUser();
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
                                      "Sign up",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
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
                  //redirect login if account already exits
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: Text(
                      "Already have an account? Login",
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
