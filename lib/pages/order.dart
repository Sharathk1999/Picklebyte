// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yumbite/core/colors.dart';
import 'package:yumbite/services/db_service.dart';
import 'package:yumbite/services/shared_preference.dart';
import 'package:yumbite/widgets/helper_widget.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  String? id, wallet;
  //cart total
  int total = 0, newTotal = 0;

  //cart check out amount
  int checkOutAmount = 0;

  //get user id
  getUserIdFromSharedPrefs() async {
    id = await SharedPrefHelper().getUserId();
    wallet = await SharedPrefHelper().getUserWalletInfo();
    setState(() {});
  }

  //for setting the cart total price when restart
  void cartTotalPriceTimer() {
    Timer(const Duration(seconds: 1), () {
      newTotal = total;
      setState(() {});
    });
  }

  //on page load, load cartStream using user id from db
  onPageLoad() async {
    await getUserIdFromSharedPrefs();
    cartStream = await DataBaseServiceMethods().fetchCart(id!);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    cartTotalPriceTimer();
    onPageLoad();
  }

  Stream? cartStream;

  Widget foodCartTile() {
    return StreamBuilder(
        stream: cartStream,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.docs.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    DocumentSnapshot docSnap = snapshot.data.docs[index];
                    total = total + int.parse(docSnap["total_price"]);
                    return CartFoodItemTile(
                      name: docSnap["name"],
                      totalPrice: docSnap["total_price"],
                      quantity: docSnap["quantity"],
                      image: docSnap["image"],
                    );
                  })
              : const Center(child: CircularProgressIndicator());
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Center(
                child: Text(
                  "Your Cart",
                  style: HelperWidget.headerTextStyle(),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
                height: MediaQuery.of(context).size.height / 2,
                child: foodCartTile()),
            const Spacer(),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Price",
                    style: HelperWidget.boldTextStyle(),
                  ),
                  Text(
                    "₹ $newTotal",
                    style: HelperWidget.semiBoldTextStyle(),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            GestureDetector(
              onTap: () async {
                //paying checkout amount using wallet
                checkOutAmount = int.parse(wallet!) - newTotal;
                //update wallet amount in db
                await DataBaseServiceMethods().updateWalletAmount(
                    id: id!, walletAmount: checkOutAmount.toString());
                //update wallet amount in shared pref
                await SharedPrefHelper()
                    .saveUserWalletInfo(checkOutAmount.toString());
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: btnColor.withOpacity(0.8),
                    content: Text(
                      "Paid ₹ $newTotal from your wallet, Current wallet amount:₹ $checkOutAmount",
                      style: const TextStyle(fontFamily: 'Lato', fontSize: 18),
                    ),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: btnColor, borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.only(
                    left: 20.0, right: 20.0, bottom: 20.0),
                child: const Center(
                    child: Text(
                  "Check Out",
                  style: TextStyle(
                      fontFamily: 'Lato',
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CartFoodItemTile extends StatelessWidget {
  final String name;
  final String totalPrice;
  final String quantity;
  final String image;
  const CartFoodItemTile({
    Key? key,
    required this.name,
    required this.totalPrice,
    required this.quantity,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: btnColor.withOpacity(0.4),
          ),
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.network(
                  image,
                  height: 90,
                  width: 90,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    style: HelperWidget.semiBoldTextStyle(),
                  ),
                  Text(
                    "₹ $totalPrice",
                    style: HelperWidget.semiBoldTextStyle(),
                  )
                ],
              ),
              const Spacer(),
              Container(
                height: 90,
                width: 40,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: btnColor),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                  quantity,
                  style: HelperWidget.semiBoldTextStyle(),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
