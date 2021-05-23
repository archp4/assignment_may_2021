import 'package:flutter/material.dart';

// this class for task 1 for displaying data
class DisplayUser extends StatelessWidget {
  String userName;
  String userImageURL;
  DisplayUser({required this.userName, required this.userImageURL});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: NetworkImage(userImageURL), fit: BoxFit.fill),
          ),
        ),
        SizedBox(
          height: 20,
          width: 10,
        ),
        Text(
          userName,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
