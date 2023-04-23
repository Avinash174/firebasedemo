import 'dart:async';
import 'package:firebasedemo/ui/auth/login_Screen.dart';
import 'package:flutter/material.dart';

class SplashServices {

  void isLogin(BuildContext context) {
      Timer(
          const Duration(seconds: 3),
              () => Navigator.push(
              context, MaterialPageRoute(builder: (_) =>const LogInScreen())));
    }


  }
