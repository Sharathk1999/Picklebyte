import 'package:flutter/material.dart';
import 'package:picklebyte/widgets/helper_widget.dart';
import 'package:shimmer/shimmer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "", password = "";

  final _formkey = GlobalKey<FormState>();

  TextEditingController useremailcontroller = TextEditingController();
  TextEditingController userpasswordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                    Color.fromARGB(255, 158, 177, 198),
                    Color.fromARGB(255, 168, 174, 224),
                  ])),
            ),
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
            Container(
              margin: const EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
              child: Column(
                children: [
                  Center(
                    child: Shimmer.fromColors(
                      baseColor: Colors.white,
                      highlightColor: Color.fromARGB(255, 224, 225, 231),
                      child: const Text(
                        "PickleByte",
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
                        key: _formkey,
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
                            TextFormField(
                              controller: useremailcontroller,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                    fontFamily: "Lato",
                                    fontSize: 12,
                                    color: Colors.red[800],
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: 'Email',
                                  hintStyle: HelperWidget.semiBoldTextStyle(),
                                  prefixIcon: const Icon(Icons.email_outlined)),
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            TextFormField(
                              controller: userpasswordcontroller,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Password';
                                }
                                return null;
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                    fontFamily: "Lato",
                                    fontSize: 12,
                                    color: Colors.red[800],
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: 'Password',
                                  hintStyle: HelperWidget.semiBoldTextStyle(),
                                  prefixIcon:
                                      const Icon(Icons.password_outlined)),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            GestureDetector(
                              onTap: () {},
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
                            GestureDetector(
                              onTap: () {
                                if (_formkey.currentState!.validate()) {
                                  setState(() {
                                    email = useremailcontroller.text;
                                    password = userpasswordcontroller.text;
                                  });
                                }
                              },
                              child: Material(
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  width: 200,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 168, 174, 224),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: const Center(
                                      child: Text(
                                    "LOGIN",
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
                  GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Don't have an account? Sign up",
                        style: HelperWidget.semiBoldTextStyle(),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
