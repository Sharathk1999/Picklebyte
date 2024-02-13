import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yumbite/core/colors.dart';
import 'package:yumbite/pages/details_page.dart';
import 'package:yumbite/services/db_service.dart';
import 'package:yumbite/widgets/helper_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //for category icons
  bool iceCream = false, burger = false, pizza = false, salad = true;

  //food items from db
  Stream? foodItemsStream;

  //on page loading
  onPageLoad()async{
    foodItemsStream = await DataBaseServiceMethods().fetchFoodItem("Salad");
    //for fast loading data in home page
    setState(() {
      
    });
  }

  @override
  void initState() {
    super.initState();
    onPageLoad();
    }

  Widget allFoodItems(){
    return StreamBuilder(stream: foodItemsStream, builder: (context, snapshot) {
      return snapshot.hasData? ListView.builder(
         padding: EdgeInsets.zero,
        itemCount: snapshot.data.docs.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
        DocumentSnapshot docSnap = snapshot.data.docs[index];
          return FoodCard(
            name: docSnap["name"],
            description: docSnap["description"],
            price: docSnap["price"],
            image: docSnap["image"],
          );
      },) : const Center(child: CircularProgressIndicator());
    },);
  }

   Widget allFoodItemsTileCard(){
    return StreamBuilder(stream: foodItemsStream, builder: (context, snapshot) {
      return snapshot.hasData ? ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: snapshot.data.docs.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
        DocumentSnapshot docSnap = snapshot.data.docs[index];
          return FoodCustomTile(
            name: docSnap["name"],
            description: docSnap["description"],
            price: docSnap["price"],
            image: docSnap["image"],
          );
      },) : const Center(child: CircularProgressIndicator());
    },);
  }



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
                    color: btnColor,
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
            Container(
              height: MediaQuery.of(context).size.height * 0.30,
           
            
              child: allFoodItems(),
            ),
            
            const SizedBox(
              height: 10,
            ),
             allFoodItemsTileCard(),
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
          onTap: ()async {
            iceCream = true;
            burger = false;
            pizza = false;
            salad = false;
            foodItemsStream = await DataBaseServiceMethods().fetchFoodItem("Ice Cream");
            setState(() {});
          },
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(50),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: iceCream ? Colors.white : btnColor.withOpacity(0.5,),),
                  borderRadius: BorderRadius.circular(50),
                  color: iceCream ? btnColor : btnColor.withOpacity(0.3)),
              child: Image.asset(
                "assets/images/ice-cream.png",
                height: 30,
                width: 30,
                color: iceCream ? Colors.white : btnColor,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        //! Burger
        GestureDetector(
          onTap: ()async {
            iceCream = false;
            burger = true;
            pizza = false;
            salad = false;
            foodItemsStream = await DataBaseServiceMethods().fetchFoodItem("Burger");
            setState(() {});
          },
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(50),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(
                       width: 1, color: burger ? Colors.white : btnColor.withOpacity(0.5,),),
                  borderRadius: BorderRadius.circular(50),
                  color: burger ? btnColor : btnColor.withOpacity(0.3,),),
              child: Image.asset(
                "assets/images/burger.png",
                height: 30,
                width: 30,
                color: burger ? Colors.white : btnColor,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        //! Pizza
        GestureDetector(
          onTap: () async{
            iceCream = false;
            burger = false;
            pizza = true;
            salad = false;
            foodItemsStream = await DataBaseServiceMethods().fetchFoodItem("Pizza");
            setState(() {});
          },
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(50),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(
                       width: 1, color: pizza ? Colors.white : btnColor.withOpacity(0.5,),),
                  borderRadius: BorderRadius.circular(50),
                  color: pizza ? btnColor : btnColor.withOpacity(0.3,),),
              child: Image.asset(
                "assets/images/pizza.png",
                height: 30,
                width: 30,
                color: pizza ? Colors.white : btnColor,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        //! Salad
        GestureDetector(
          onTap: ()async {
            iceCream = false;
            burger = false;
            pizza = false;
            salad = true;
            foodItemsStream = await DataBaseServiceMethods().fetchFoodItem("Salad");
            setState(() {});
          },
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(50),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(
                     width: 1, color: salad ? Colors.white : btnColor.withOpacity(0.5,),),
                  borderRadius: BorderRadius.circular(50),
                  color: salad ? btnColor : btnColor.withOpacity(0.3,),),
              child: Image.asset(
                "assets/images/salad.png",
                height: 30,
                width: 30,
                color: salad ? Colors.white : btnColor,
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
   final String name;
  final String price;
  final String description;
  final String image;
  const FoodCustomTile({
    super.key,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
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
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  image,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Text(
                      name,
                      style: HelperWidget.semiBoldTextStyle(),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Text(
                      description,
                      style: HelperWidget.lightTextStyle(),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Text(
                      "₹ $price",
                      style: HelperWidget.semiBoldTextStyle(),
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
  final String name;
  final String price;
  final String description;
  final String image;
  const FoodCard({
    super.key,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  DetailsScreen(name: name, description: description, price: price, image: image),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(15),
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    image,
                    height: 120,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  name,
                  style: HelperWidget.semiBoldTextStyle(),
                ),
                Text(
                  description,
                  style: HelperWidget.lightTextStyle(),
                ),
                Text(
                  "₹ $price",
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
