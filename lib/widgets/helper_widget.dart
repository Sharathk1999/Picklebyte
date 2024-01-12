import 'package:flutter/material.dart';

class HelperWidget {
  static TextStyle boldTextStyle() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 22,
      fontWeight: FontWeight.w600,
      fontFamily: "Lato",
    );
  }

  static TextStyle headerTextStyle() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 24.5,
      fontWeight: FontWeight.w600,
      fontFamily: "Lato",
    );
  }
  static TextStyle lightTextStyle() {
    return const TextStyle(
      color: Colors.black45,
      fontSize: 14.5,
      fontWeight: FontWeight.w400,
      fontFamily: "Lato",
    );
  }
  static TextStyle smallTextStyle() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 14.5,
      fontWeight: FontWeight.w500,
      fontFamily: "Lato",
    );
  }

  static TextStyle semiBoldTextStyle() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontFamily: "Lato",
    );
  }
}
