import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:yumbite/services/db_service.dart';
import 'package:yumbite/services/shared_preference.dart';
import 'package:yumbite/widgets/helper_widget.dart';

class DetailsScreen extends StatefulWidget {
  final String name;
  final String description;
  final String price;
  final String image;
  const DetailsScreen({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  //food item quantity
  int quantity = 1;
  //total amount
  int total = 0;

  //user id from shared pref
  String? id;

  getUserIdFromSharedPref() async {
    id = await SharedPrefHelper().getUserId();
    setState(() {});
  }

  onPageLoad() async {
    await getUserIdFromSharedPref();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    onPageLoad();
    total = int.parse(widget.price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
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
            const SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                widget.image,  
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   "Kerala Authentic",
                    //   style: HelperWidget.semiBoldTextStyle(),
                    // ),
                    Text(
                      widget.name,
                      style: HelperWidget.boldTextStyle(),
                    ),
                  ],
                ),
                const Spacer(),
                //! remove
                GestureDetector(
                  onTap: () {
                    //reducing the food quantity
                    if (quantity > 1) {
                      --quantity;
                      total -= int.parse(widget.price);
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
                    //increasing the food quantity
                    ++quantity;
                    total += int.parse(widget.price);
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
              widget.description,
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
                      Text(
                        "Total Price",
                        style: HelperWidget.semiBoldTextStyle(),
                      ),
                      Text(
                        "₹ $total",
                        style: HelperWidget.boldTextStyle(),
                      ),
                    ],
                  ),
                  GestureDetector(
                     onTap: () async {
                      log("added to cart");
                    //upload food item to cart
                    Map<String, dynamic> addToCart = {
                      "name": widget.name,
                      "image": widget.image,
                      "quantity": quantity.toString(),
                      "total_price": total.toString(),
                    };
                  
                    await DataBaseServiceMethods()
                        .addFoodItemToCart(addToCart, id!);
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.green.shade500,
                        content:  Text(
                          "${widget.name} added to cart...🛒",
                          style: const TextStyle(fontFamily: 'Lato', fontSize: 18),
                        ),
                      ),
                    );
                  },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.white),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black,
                      ),
                      child: const Text(
                        "Add to 🛒",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Lato",
                          fontSize: 18,
                        ),
                      ),
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
