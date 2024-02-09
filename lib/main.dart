import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:yumbite/pages/onboard_page.dart';

import 'firebase_options.dart';

void main()async {
  //to ensure flutter bindings are init
  WidgetsFlutterBinding.ensureInitialized();

  //init firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //loading env variables from .env
  await dotenv.load(fileName: ".env");

  //getting the publishableKey
  final String? publishableKey = dotenv.env['PUBLISHABLE_KEY'];

  //null check for publishableKey
  if (publishableKey != null) {
    Stripe.publishableKey = publishableKey;
    runApp(const MyApp(),);  
  }else{
    log("Error:Publishable key is not found in the .env file.");
  }
  
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'yumbite',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const OnboardPage(),
    );
  }
}

