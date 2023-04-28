import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasedemo/utils/utils.dart';
import 'package:firebasedemo/widgets/round_button.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final emailTextController = TextEditingController();
  final auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forget Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter Email',
              ),
              controller: emailTextController,
            ),
            SizedBox(
              height: 40,
            ),
            RoundButton(title: 'Forget', onTap: () {
              auth.sendPasswordResetEmail(email: emailTextController.text.toString()).then((value) {
                Utils().toastMsg('Email Send Sucessfull To Recover Passwordy');

              }).onError((error, stackTrace) {
                Utils().toastMsg(error.toString());
              });
            }),
          ],
        ),
      ),
    );
  }
}
