import 'package:flutter/material.dart';
import 'package:picklebyte/pages/details_page.dart';
import 'package:picklebyte/widgets/helper_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool iceCream = false, burger = false, pizza = false, salad = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(
          top: 52,
          left: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hello Sharath",
                  style: HelperWidget.boldTextStyle(),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.black12),
                  child: const Icon(
                    Icons.shopping_cart_rounded,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Tasty Pickles",
              style: HelperWidget.headerTextStyle(),
            ),
            Text(
              "Your one-stop shop for all things pickled.",
              style: HelperWidget.lightTextStyle(),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: showItems(),
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailsScreen(),),);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: Material(
                        elevation: 4,
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.black12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "assets/images/salad2.png",
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                "Veggie Pickle",
                                style: HelperWidget.semiBoldTextStyle(),
                              ),
                              Text(
                                "Healthy and Fresh",
                                style: HelperWidget.lightTextStyle(),
                              ),
                              Text(
                                "₹ 50",
                                style: HelperWidget.semiBoldTextStyle(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Material(
                      elevation: 4,
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.black12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/images/salad2.png",
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              "Veggie Pickle",
                              style: HelperWidget.semiBoldTextStyle(),
                            ),
                            Text(
                              "Healthy and Fresh",
                              style: HelperWidget.lightTextStyle(),
                            ),
                            Text(
                              "₹ 50",
                              style: HelperWidget.semiBoldTextStyle(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Material(
                      elevation: 4,
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.black12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/images/salad2.png",
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              "Veggie Pickle",
                              style: HelperWidget.semiBoldTextStyle(),
                            ),
                            Text(
                              "Healthy and Fresh",
                              style: HelperWidget.lightTextStyle(),
                            ),
                            Text(
                              "₹ 50",
                              style: HelperWidget.semiBoldTextStyle(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.black12,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/images/salad4.png",
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Raw mango pickle from kuttanadu",
                              style: HelperWidget.semiBoldTextStyle(),
                            ),
                          ),
                          const SizedBox(
                            height: 2.5,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Native mango",
                              style: HelperWidget.lightTextStyle(),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "₹ 60",
                              style: HelperWidget.lightTextStyle(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget showItems() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //! Ice Cream
        GestureDetector(
          onTap: () {
            iceCream = true;
            burger = false;
            pizza = false;
            salad = false;
            setState(() {});
          },
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(50),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: iceCream ? Colors.white : Colors.black),
                  borderRadius: BorderRadius.circular(50),
                  color: iceCream ? Colors.black : Colors.black12),
              child: Image.asset(
                "assets/images/ice-cream.png",
                height: 30,
                width: 30,
                color: iceCream ? Colors.white : Colors.black,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        //! Burger
        GestureDetector(
          onTap: () {
            iceCream = false;
            burger = true;
            pizza = false;
            salad = false;
            setState(() {});
          },
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(50),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: burger ? Colors.white : Colors.black),
                  borderRadius: BorderRadius.circular(50),
                  color: burger ? Colors.black : Colors.black12),
              child: Image.asset(
                "assets/images/burger.png",
                height: 30,
                width: 30,
                color: burger ? Colors.white : Colors.black,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        //! Pizza
        GestureDetector(
          onTap: () {
            iceCream = false;
            burger = false;
            pizza = true;
            salad = false;
            setState(() {});
          },
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(50),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: pizza ? Colors.white : Colors.black),
                  borderRadius: BorderRadius.circular(50),
                  color: pizza ? Colors.black : Colors.black12),
              child: Image.asset(
                "assets/images/pizza.png",
                height: 30,
                width: 30,
                color: pizza ? Colors.white : Colors.black,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        //! Salad
        GestureDetector(
          onTap: () {
            iceCream = false;
            burger = false;
            pizza = false;
            salad = true;
            setState(() {});
          },
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(50),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: salad ? Colors.white : Colors.black),
                  borderRadius: BorderRadius.circular(50),
                  color: salad ? Colors.black : Colors.black12),
              child: Image.asset(
                "assets/images/salad.png",
                height: 30,
                width: 30,
                color: salad ? Colors.white : Colors.black,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

