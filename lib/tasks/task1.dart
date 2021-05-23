import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_assignment/models/user.dart';
import 'package:my_assignment/widget/displayuser.dart';
import 'package:my_assignment/widget/errortext.dart';

class TaskOneHome extends StatefulWidget {
  @override
  _TaskOneHomeState createState() => _TaskOneHomeState();
}

class _TaskOneHomeState extends State<TaskOneHome> {
  var url = Uri.parse(
      'https://exceptional-studios.herokuapp.com/api/users/1'); //api url
  var data;
  var name = "", userurl = "";
  int errorCode = 0;
  String errorMessage = " ";
  //method for getting data form of api
  Future getUser() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      TaskUser user = TaskUser.fromJson(data);

      userurl = user.userImageURL;
      name = user.userName;
      errorCode = 2;
      errorMessage = "Name successfully feteched from API";
    } else {
      errorCode = 1;
      errorMessage = "Failed to load";
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task1"),
      ),
      //it will display empty container is data is not fetched!!
      body: Column(
        children: <Widget>[
          data != null
              ? Container(
                  alignment: Alignment.center,
                  height: 600,
                  child: DisplayUser(
                    userName: name,
                    userImageURL: userurl,
                  ),
                )
              : Container(
                  height: 600,
                ),
          SizedBox(
            height: 50,
            width: 250,
            child: ElevatedButton(
              onPressed: () async {
                await getUser();
                setState(() {});
              },
              child: Text(
                'Load Data form API',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(color: Colors.black),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(Colors.black),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ErrorText(errorCode: errorCode, errorMessage: errorMessage),
        ],
      ),
    );
  }
}
