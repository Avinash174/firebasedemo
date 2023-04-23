import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasedemo/ui/posts/post_screen.dart';
import 'package:firebasedemo/utils/utils.dart';
import 'package:firebasedemo/widgets/round_button.dart';
import 'package:flutter/material.dart';

class VerifyScreen extends StatefulWidget {
  final String verficationId;
  const VerifyScreen({Key? key, required this.verficationId}) : super(key: key);

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  bool loading = false;
  final auth = FirebaseAuth.instance;
  final verificatiionCodeController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: verificatiionCodeController,
              decoration: InputDecoration(
                hintText: 'Enter 6 Digit Verification Code',
              ),
            ),
            SizedBox(
              height: 50,
            ),
            RoundButton(
                title: 'Verify',
                loading: loading,
                onTap: () async{
                  setState(() {
                    loading=true;
                  });
                  final crediantial = PhoneAuthProvider.credential(
                      verificationId: widget.verficationId,
                      smsCode: verificatiionCodeController.text.toString()
                  );
                  try{
                    await auth.signInWithCredential(crediantial);
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>PostScreen()));
                  }catch(e){
                    setState(() {
                      loading=false;
                    });

                    Utils().toastMsg(e.toString());
                  }
                }),

          ],
        ),
      ),
    );
  }
}
