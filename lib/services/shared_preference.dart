import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  
  //keys for shared prefs
  static String userId= "USERID";
  static String userName= "USERNAME";
  static String userEmail= "USEREMAIL";
  static String userWalletInfo= "USERWALLET";
  static String userProfile= "USERPROFILE";

  /* Saving user info to shared prefs */
  Future<bool> saveUserId(String id)async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(userId, id);
  }

  Future<bool> saveUserName(String name)async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(userName, name);
  }

  Future<bool> saveUserEmail(String email)async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(userEmail, email);
  }

  Future<bool> saveUserWalletInfo(String walletInfo)async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(userWalletInfo, walletInfo);
  }

   Future<bool> saveUserProfileInfo(String userProfileInfo)async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(userProfile, userProfileInfo);
  }

  /* Retrieving user info from shared prefs */
  Future<String?> getUserId()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(userId);
  }
  Future<String?> getUserName()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(userName);
  }
  Future<String?> getUserEmail()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(userEmail);
  }
  Future<String?> getUserWalletInfo()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(userWalletInfo);
  }

   Future<String?> getUserProfileInfo()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(userProfile);
  }

}