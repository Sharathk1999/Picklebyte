// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:yumbite/core/colors.dart';
import 'package:yumbite/services/db_service.dart';
import 'package:yumbite/services/shared_preference.dart';
import 'package:yumbite/widgets/helper_widget.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => preferred();
}

class preferred extends State<Wallet> {
  //for storing wallet Info from shared prefs
  String? wallet;
  String? id;

  //for calculating wallet money
  int? add;

  //get wallet info from shared prefs
  getSharedPrefs() async {
    wallet = await SharedPrefHelper().getUserWalletInfo();
    id = await SharedPrefHelper().getUserId();
    setState(() {});
  }

  //toLoad shared prefs on wallet page initState
  onPageActive() async {
    await getSharedPrefs();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    onPageActive();
  }

  TextEditingController amountController = TextEditingController();

  Map<String, dynamic>? paymentIntent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Center(
                  child: Text(
                    "YumBite Wallet",
                    style: HelperWidget.headerTextStyle(),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    width: 1.0,
                    color: btnColor.withOpacity(
                      0.2,
                    ),
                  ),
                  color: btnColor.withOpacity(0.1),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/wallet.png",
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      width: 40.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your Wallet",
                          style: HelperWidget.lightTextStyle(),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          "₹ $wallet",
                          style: HelperWidget.boldTextStyle(),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "Add money",
                  style: HelperWidget.semiBoldTextStyle(),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      processPayment("100");
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0, color: btnColor),
                        borderRadius: BorderRadius.circular(5),
                        color: btnColor.withOpacity(
                          0.2,
                        ),
                      ),
                      child: Text(
                        "₹" "100",
                        style: HelperWidget.semiBoldTextStyle(),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      processPayment("500");
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0, color: btnColor),
                        borderRadius: BorderRadius.circular(5),
                        color: btnColor.withOpacity(
                          0.2,
                        ),
                      ),
                      child: Text(
                        "₹" "500",
                        style: HelperWidget.semiBoldTextStyle(),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      processPayment("1000");
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0, color: btnColor),
                        borderRadius: BorderRadius.circular(5),
                        color: btnColor.withOpacity(
                          0.2,
                        ),
                      ),
                      child: Text(
                        "₹" "1000",
                        style: HelperWidget.semiBoldTextStyle(),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      processPayment("2000");
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0, color: btnColor),
                        borderRadius: BorderRadius.circular(5),
                        color: btnColor.withOpacity(
                          0.2,
                        ),
                      ),
                      child: Text(
                        "₹" "2000",
                        style: HelperWidget.semiBoldTextStyle(),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 50.0,
              ),
              GestureDetector(
                onTap: () {
                  addWalletMoney();
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: btnColor, borderRadius: BorderRadius.circular(8)),
                  child: const Center(
                    child: Text(
                      "Add Money",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> processPayment(String amount) async {
    try {
      paymentIntent = await createPaymentIntent(amount, 'INR');
      //Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret: paymentIntent!['client_secret'],
                  style: ThemeMode.dark,
                  merchantDisplayName: 'Sharath'))
          .then((value) {});

      //displaying the payment sheet
      displayPaymentSheet(amount);
    } catch (e, s) {
      log('exception:$e$s');
    }
  }

  displayPaymentSheet(String amount) async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) async {
        //!Update Alert
        //adding total amount to wallet into shared prefs
        add = int.parse(wallet!) + int.parse(amount);
        await SharedPrefHelper().saveUserWalletInfo(add.toString());
        //wallet amount firebase update
        await DataBaseServiceMethods()
            .updateWalletAmount(id: id!, walletAmount: add.toString());

        showDialog(
            context: context,
            builder: (_) => const AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.checkmark_seal,
                            color: Colors.green,
                          ),
                          Text("Payment Successful"),
                        ],
                      ),
                    ],
                  ),
                ));
        //after payment successful update wallet amount(line:33)
        await getSharedPrefs();

        paymentIntent = null;
      }).onError((error, stackTrace) {
        log('Error is:--->$error $stackTrace');
      });
    } on StripeException catch (e) {
      log('Error is:---> $e');
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                content: Text("Cancelled "),
              ));
    } catch (e) {
      log('$e');
    }
  }

  //  create payment
  createPaymentIntent(String amount, String currency) async {
    try {
      //request body
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      //making request to stripe
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer ${dotenv.env['SECRET_KEY']}',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );

      log('Payment Intent Body->>> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      log('Error charging user: ${err.toString()}');
    }
  }

  //calculate amount
  calculateAmount(String amount) {
    final calculatedAmount = (int.parse(amount)) * 100;

    return calculatedAmount.toString();
  }

  //for adding user preferred money
  Future addWalletMoney() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: SingleChildScrollView(
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          CupertinoIcons.xmark_circle,
                          color: btnColor,
                        ),
                      ),
                      const SizedBox(
                        width: 60.0,
                      ),
                      const Center(
                        child: Text(
                          "Add Money",
                          style: TextStyle(
                            fontFamily: 'Lato',
                            color: btnColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    "Amount",
                    style: TextStyle(
                      fontFamily: 'Lato',
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38, width: 2.0),
                        borderRadius: BorderRadius.circular(10)),
                        //to get the user input image
                    child: TextField(
                      controller: amountController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your amount'),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  //pay btn to process stripe payment
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        processPayment(amountController.text.trim());
                      },
                      child: Container(
                        width: 100,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: btnColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                            child: Text(
                          "Pay",
                          style: TextStyle(
                              fontFamily: 'Lato', color: Colors.white),
                        )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
