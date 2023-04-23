import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasedemo/ui/auth/verify_code.dart';
import 'package:firebasedemo/utils/utils.dart';
import 'package:firebasedemo/widgets/round_button.dart';
import 'package:flutter/material.dart';

class LogInWithPhoneNumber extends StatefulWidget {
  const LogInWithPhoneNumber({Key? key}) : super(key: key);

  @override
  State<LogInWithPhoneNumber> createState() => _LogInWithPhoneNumberState();
}

class _LogInWithPhoneNumberState extends State<LogInWithPhoneNumber> {
  bool loading=false;
  final auth=FirebaseAuth.instance;
  final phonenumberController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              controller: phonenumberController,
              decoration: InputDecoration(
                hintText: 'Enter Mobile Number With Country Code',
              ),
            ),
            SizedBox(
              height: 50,
            ),
            RoundButton(title: 'Log In',loading: loading, onTap: () {
              auth.verifyPhoneNumber(
                  phoneNumber: phonenumberController.text,
                  verificationCompleted: (_){

                  },
                  verificationFailed:(e){
                    Utils().toastMsg(e.toString());
                  } ,
                  codeSent: (String verificationId,int? token){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>VerifyScreen(verficationId: verificationId,)));

                  },
                  codeAutoRetrievalTimeout:(e){
                    Utils().toastMsg(e.toString());
                  }
              );
            }),

          ],
        ),
      ),
    );
  }
}
