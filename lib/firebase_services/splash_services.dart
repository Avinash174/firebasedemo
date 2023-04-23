import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasedemo/ui/auth/login_Screen.dart';
import 'package:flutter/material.dart';

class SplashServices {
  final _auth = FirebaseAuth.instance;
  final user = auth.currentUser;
  void isLogin(BuildContext context) {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => const LogInScreen())));
  }
}
