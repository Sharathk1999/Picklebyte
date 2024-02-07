import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:yumbite/pages/home.dart';
import 'package:yumbite/pages/order.dart';
import 'package:yumbite/pages/profile.dart';
import 'package:yumbite/pages/wallet_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentTabIdx = 0;

  late List<Widget> pages;
  late Widget currentPage;
  late Home homePage;
  late ProfilePage profilePage;
  late OrderPage orderPage;
  late Wallet wallet;

  @override
  void initState() {
    super.initState();
    homePage = const Home();
    orderPage = const OrderPage();
    wallet = const Wallet();
    profilePage = const ProfilePage();
    pages = [homePage, orderPage, profilePage, wallet];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      bottomNavigationBar: CurvedNavigationBar(
        height: 55,
        backgroundColor: Colors.white,
        color: Colors.black87,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            currentTabIdx = index;
          });
        },
        items: const [
          Icon(
            Icons.house_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.shopping_bag_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.person_4_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.wallet_rounded,
            color: Colors.white,
          ),
        ],
      ),
      body: pages[currentTabIdx],
    );
  }
}
