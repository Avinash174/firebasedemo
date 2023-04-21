import 'dart:async';
import 'package:firebasedemo/ui/auth/login_Screen.dart';
import 'package:flutter/material.dart';

class SplashServices{
  void isLogin(BuildContext context){
    Timer.periodic( Duration(seconds: 3), (timer) {
      Navigator.push(context, MaterialPageRoute(builder: (_)=>LogInScreen()));
    });
  }
}