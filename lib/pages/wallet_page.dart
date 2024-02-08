import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yumbite/core/colors.dart';
import 'package:yumbite/widgets/helper_widget.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  TextEditingController amountController = TextEditingController();

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
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 1.0,color: btnColor.withOpacity(0.2,),),
                  color: btnColor.withOpacity(0.1),),
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
                          "\$ wallet",
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
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                         border: Border.all(width: 1.0,color:btnColor),
                          borderRadius: BorderRadius.circular(5),
                          color: btnColor.withOpacity(0.2,),),
                      child: Text(
                        "\$" "100",
                        style: HelperWidget.semiBoldTextStyle(),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1.0,color:btnColor),
                          borderRadius: BorderRadius.circular(5),
                           color: btnColor.withOpacity(0.2,),),
                      child: Text(
                        "\$" "500",
                        style: HelperWidget.semiBoldTextStyle(),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                         border: Border.all(width: 1.0,color:btnColor),
                          borderRadius: BorderRadius.circular(5),
                           color: btnColor.withOpacity(0.2,),),
                      child: Text(
                        "\$" "1000",
                        style: HelperWidget.semiBoldTextStyle(),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1.0,color:btnColor),
                          borderRadius: BorderRadius.circular(5),
                           color: btnColor.withOpacity(0.2,),),
                      child: Text(
                        "\$" "2000",
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
                  openEdit();
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: btnColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Center(
                    child: Text(
                      "Add Money",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontFamily: 'Poppins',
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

  Future openEdit() => showDialog(
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
                            child: const Icon(Icons.cancel)),
                        const SizedBox(
                          width: 60.0,
                        ),
                        const Center(
                          child: Text(
                            "Add Money",
                            style: TextStyle(
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
                    const Text("Amount"),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black38, width: 2.0),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        controller: amountController,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'Enter your amount'),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
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
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ));
}
