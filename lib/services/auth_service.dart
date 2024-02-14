import 'package:firebase_auth/firebase_auth.dart';

class AuthServiceHelper {
  final FirebaseAuth auth = FirebaseAuth.instance;

 //Fetch the current user
 Future<User?> fetchCurrentUser()async{
    return  auth.currentUser;
  }

  //Sign out the current user
  Future<void> userSignOut()async{
    await FirebaseAuth.instance.signOut();
  }
  
  //Delete the current user
  Future<void> deleteUser()async{
    User? user =  FirebaseAuth.instance.currentUser;
    if (user != null) {
      await user.delete();
    }
  }
}