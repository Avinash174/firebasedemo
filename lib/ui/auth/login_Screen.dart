import 'package:firebasedemo/widgets/round_button.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Log In'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      helperText: 'Enter Email e.g abc@gmail.com',
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.alternate_email),
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Enter Email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      helperText: 'Enter Strong Password ',
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Enter Password';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 50,),
            RoundButton(
              title: 'Log In',
              onTap: () {
                if(_formKey.currentState!.validate()){

                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
