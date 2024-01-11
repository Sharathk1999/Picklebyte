import 'package:flutter/material.dart';
import 'package:picklebyte/widgets/helper_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 52,left: 15,right: 10),
       
        child:  Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Hello Sharath",style: HelperWidget.boldTextStyle(),),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.black12
                  ),
                  child: const Icon(Icons.shopping_cart_rounded,color: Colors.black,),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}