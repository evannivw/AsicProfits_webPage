import 'package:asic_miner_website/Backend/Authentication/FirebaseAuthentication.dart';
import 'package:flutter/material.dart';

class AdminLoginController {
  TextEditingController emailTEC = TextEditingController();
  TextEditingController passTEC = TextEditingController();
  void login(Function callback) async {
    if (passTEC.text.isEmpty || emailTEC.text.isEmpty) {
      return;
    }
    var result =
        await FirebaseAuthentication().emailLogin(emailTEC.text, passTEC.text);
    if (result.isLogin) {
      print("User is logged in");
      callback();
    } else {
      print(result.error);
    }
  }
}
