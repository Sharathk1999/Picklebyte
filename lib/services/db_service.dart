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
}
