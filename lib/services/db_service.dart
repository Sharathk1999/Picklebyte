import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseServiceMethods {
  //adds user info from signUp page to db
  Future addUserInfo(Map<String, dynamic> userInfo, String id) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .set(userInfo);
  }
  //func to update wallet amount in firebase
  Future updateWalletAmount({required String id,required String walletAmount}) async {
    return await FirebaseFirestore.instance.collection("users").doc(id).update({
      "walletBalance": walletAmount,
    });
  }

  //adds food item to db
  Future addFoodItemToDB(Map<String, dynamic> userInfo, String name) async {
    return await FirebaseFirestore.instance
        .collection(name)
        .add(userInfo);
  }

  //get food items from db
  Future<Stream<QuerySnapshot>> fetchFoodItem(String name)async{
    // ignore: await_only_futures
    return await FirebaseFirestore.instance.collection(name).snapshots();
  }

   //adds food item to cart in db
  Future addFoodItemToCart(Map<String, dynamic> foodInfo, String id) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id).collection("cart")
        .add(foodInfo);
  }

   //get cart from db
  Future<Stream<QuerySnapshot>> fetchCart(String id)async{
    // ignore: await_only_futures
    return await FirebaseFirestore.instance.collection("users").doc(id).collection("cart").snapshots();
  }
}
