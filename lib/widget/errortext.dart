import 'package:flutter/material.dart';

//it for some task which require error message
class ErrorText extends StatelessWidget {
  int errorCode;
  String errorMessage;

  ErrorText({required this.errorCode, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    if (errorCode == 1) {
      return Text(
        "$errorMessage",
        style: TextStyle(fontSize: 18, color: Colors.red),
      );
    } else if (errorCode == 2) {
      return Text(
        "$errorMessage",
        style: TextStyle(fontSize: 18, color: Colors.green),
      );
    } else {
      return Text('');
    }
  }
}
