import 'package:flutter/material.dart';
import 'package:yumbite/core/colors.dart';
import 'package:yumbite/pages/details_page.dart';
import 'package:yumbite/widgets/helper_widget.dart';

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
          left: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //hello with username
                Text(
                  "Hello Sharath",
                  style: HelperWidget.boldTextStyle(),
                ),
                //cart icon to visit cart
                Container(
                  margin: const EdgeInsets.only(right: 10,top: 5),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1,color: btnColor.withOpacity(0.5,)),
                      borderRadius: BorderRadius.circular(50),
                      color: btnColor.withOpacity(0.3,),),
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
            //welcome heading
            Text(
              "Tasty Foods",
              style: HelperWidget.headerTextStyle(),
            ),
            Text(
              "Your one-stop shop for all things Yummy.",
              style: HelperWidget.lightTextStyle(),
            ),
            const SizedBox(
              height: 10,
            ),
            //displaying category 
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: showItems(),
            ),
            const SizedBox(
              height: 15,
            ),
            //ready to order foods
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(4, (index) {
                  return const FoodCard();
                }),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return const FoodCustomTile();
                },
              ),
            ),
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
                      width: 1, color: iceCream ? btnColor : btnColor.withOpacity(0.5,),),
                  borderRadius: BorderRadius.circular(50),
                  color: iceCream ? Colors.black : btnColor.withOpacity(0.3)),
              child: Image.asset(
                "assets/images/ice-cream.png",
                height: 30,
                width: 30,
                color: iceCream ? btnColor : Colors.black,
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
                       width: 1, color: burger ? btnColor : btnColor.withOpacity(0.5,),),
                  borderRadius: BorderRadius.circular(50),
                  color: burger ? Colors.black : btnColor.withOpacity(0.3,),),
              child: Image.asset(
                "assets/images/burger.png",
                height: 30,
                width: 30,
                color: burger ? btnColor : Colors.black,
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
                       width: 1, color: pizza ? btnColor : btnColor.withOpacity(0.5,),),
                  borderRadius: BorderRadius.circular(50),
                  color: pizza ? Colors.black : btnColor.withOpacity(0.3,),),
              child: Image.asset(
                "assets/images/pizza.png",
                height: 30,
                width: 30,
                color: pizza ? btnColor : Colors.black,
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
                     width: 1, color: salad ? btnColor : btnColor.withOpacity(0.5,),),
                  borderRadius: BorderRadius.circular(50),
                  color: salad ? Colors.black : btnColor.withOpacity(0.3,),),
              child: Image.asset(
                "assets/images/salad.png",
                height: 30,
                width: 30,
                color: salad ? btnColor : Colors.black,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class FoodCustomTile extends StatelessWidget {
  const FoodCustomTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10,bottom: 15),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(
              width: 0.5,
              color: btnColor,
            ),
            borderRadius: BorderRadius.circular(12),
            color: btnColor.withOpacity(0.2),
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
    );
  }
}

class FoodCard extends StatelessWidget {
  const FoodCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DetailsScreen(),
          ),
        );
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
                  width: 0.5,
                  color: btnColor,
                ),
                borderRadius: BorderRadius.circular(12),
                color: btnColor.withOpacity(0.2)),
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
    );
  }
}
