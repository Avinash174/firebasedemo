import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {

  final String title;

  const RoundButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(title),
      ),
    );
  }
}
