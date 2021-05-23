import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:my_assignment/models/user.dart';

class TaskThreeHome extends StatefulWidget {
  @override
  _TaskThreeHomeState createState() => _TaskThreeHomeState();
}

class _TaskThreeHomeState extends State<TaskThreeHome> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController mailController = new TextEditingController();
  TextEditingController idController = new TextEditingController();
  Dio dio = new Dio();

  Future postdata(String userName, String email, String collegeID) async {
    // var url = Uri.parse('https://exceptional-studios.herokuapp.com/api/users/');

    // var response = await http.post(url,
    //     headers: <String, String>{
    //       'Content-Type': 'application/json; charset=UTF-8',
    //     },
    //     body: jsonEncode(<String, dynamic>{
    //       "name": userName,
    //       "email": email,
    //       "collegeId": collegeID
    //     }));
    // if (response.statusCode == 201) {
    //   print("done");
    //   return TaskUser.fromJson(jsonDecode(response.body));
    // } else {
    //   print("fail ");
    //   print(userName + email + collegeID);
    //   print(response.statusCode);
    //   throw Exception('');
    // }
    // method to send data to api
    var url = 'https://exceptional-studios.herokuapp.com/api/users/';
    dynamic data = {
      "name": userName,
      "email": email,
      "collegeId": collegeID,
    };
    var response = await dio.post(url,
        data: jsonEncode(<String, dynamic>{
          "name": userName,
          "email": email,
          "collegeId": collegeID
        }),
        options: Options(headers: {
          'Content-Type': 'application/json',
        }));
    print(response.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task 2'),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 60,
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Full name',
                    hintText: 'Type  your name here',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                  ),
                  controller: nameController,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 60,
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Type  your email here',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                  ),
                  controller: mailController,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 60,
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'College ID',
                    hintText: 'Type  your password here',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                  ),
                  controller: idController,
                ),
              ),
              SizedBox(
                height: 300,
              ),
              SizedBox(
                height: 50,
                width: 250,
                child: ElevatedButton(
                  onPressed: () async {
                    String userName = nameController.text;
                    String email = mailController.text;
                    String collegeID = idController.text;

                    await postdata(userName, email, collegeID);
                  },
                  child: Text(
                    'Post Data to api',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.green),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
