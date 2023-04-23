import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasedemo/ui/auth/login_Screen.dart';
import 'package:firebasedemo/ui/posts/post_screen.dart';
import 'package:flutter/material.dart';

class SplashServices {
  final _auth=FirebaseAuth.instance;
  final user =_auth.currentUser;
  void isLogin(BuildContext context) {

    if(user !=null){
      Timer(
          const Duration(seconds: 3),
              () => Navigator.push(
              context, MaterialPageRoute(builder: (_) =>const PostScreen())));
    }
    else{
      Timer(
          const Duration(seconds: 3),
              () => Navigator.push(
              context, MaterialPageRoute(builder: (_) =>const LogInScreen())));
    }

  }
}
