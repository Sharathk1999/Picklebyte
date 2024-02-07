import 'package:flutter/material.dart';
import 'package:yumbite/core/colors.dart';
import 'package:yumbite/core/onboarding_data.dart';
import 'package:yumbite/pages/signup_page.dart';
import 'package:yumbite/widgets/helper_widget.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  int currentIdx = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: contents.length,
              onPageChanged: (index) {
                setState(() {
                  currentIdx = index;
                });
              },
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.all(
                    15,
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        contents[index].img,
                        height: 450,
                        width: MediaQuery.of(context).size.width / 1.5,
                        fit: BoxFit.fitWidth,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        contents[index].title,
                        style: HelperWidget.semiBoldTextStyle(),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        contents[index].description,
                        style: HelperWidget.lightTextStyle(),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                contents.length,
                (index) {
                  return dotBuilder(index, context);
                },
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (currentIdx == contents.length - 1) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignUp(),
                  ),
                );
              }
              _pageController.nextPage(
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.bounceIn);
            },
            child: Container(
              decoration: BoxDecoration(
                color: btnColor,
                borderRadius: BorderRadius.circular(
                  20,
                ),
              ),
              height: 60,
              margin: const EdgeInsets.all(40),
              width: double.infinity,
              child: Center(
                child: Text(
                  currentIdx == contents.length - 1 ? "Start" : "Next",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container dotBuilder(int index, BuildContext context) {
    return Container(
      height: 10.0,
      width: currentIdx == index ? 15 : 5,
      margin: const EdgeInsets.only(right: 5),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: btnColor,
      ),
    );
  }
}
