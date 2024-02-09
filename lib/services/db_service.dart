import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseServiceMethods {
  //adds user info from signUp page to db
  Future addUserInfo(Map<String, dynamic> userInfo, String id) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .set(userInfo);
  }
}
