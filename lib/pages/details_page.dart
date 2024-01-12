import 'package:flutter/material.dart';
import 'package:picklebyte/widgets/helper_widget.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50, left: 20, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
              ),
            ),
            Image.asset(
              "assets/images/salad2.png",
              height: MediaQuery.of(context).size.height / 2.5,
              width: MediaQuery.of(context).size.width / 1.2,
              fit: BoxFit.fill,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Kerala Authentic",
                      style: HelperWidget.semiBoldTextStyle(),
                    ),
                    Text(
                      "Pickled Salad",
                      style: HelperWidget.boldTextStyle(),
                    ),
                  ],
                ),
                const Spacer(),
                //! remove
                GestureDetector(
                  onTap: () {
                    if (quantity > 1) {
                      --quantity;
                    }
                    setState(() {});
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black,
                    ),
                    child: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  quantity.toString(),
                  style: HelperWidget.semiBoldTextStyle(),
                ),
                const SizedBox(
                  width: 10,
                ),
                //! add
                GestureDetector(
                  onTap: () {
                    ++quantity;
                    setState(() {});
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black,
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Tangy, spicy, and oh-so-satisfying, homemade mongo pickle is a beloved condiment in many cultures. Made with young green mangoes, this pickle is bursting with flavor and probiotic goodness. The mangoes are pickled in a brine of spices like turmeric, chili powder, and fenugreek,",
              style: HelperWidget.lightTextStyle(),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  "Delivery Time",
                  style: HelperWidget.semiBoldTextStyle(),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Icon(
                  Icons.delivery_dining_rounded,
                  color: Colors.black54,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "25 min",
                  style: HelperWidget.semiBoldTextStyle(),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total Price",style: HelperWidget.semiBoldTextStyle(),),
                      Text("₹50",style: HelperWidget.boldTextStyle(),),
                    ],
                  ),
                  Material(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1,color: Colors.white),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black,
                      ),
                      child: const Text("Add to 🛒",style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Lato",
                        fontSize: 18,
                      ),),
                    ),
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
