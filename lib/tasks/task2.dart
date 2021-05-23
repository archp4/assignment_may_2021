import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:my_assignment/models/user.dart';
import 'package:my_assignment/widget/errortext.dart';

class TaskTwoHome extends StatefulWidget {
  @override
  _TaskTwoHomeState createState() => _TaskTwoHomeState();
}

class _TaskTwoHomeState extends State<TaskTwoHome> {
  //api url
  var url = Uri.parse('https://exceptional-studios.herokuapp.com/api/users/');

  var jsonRespone; //store json from api
  int errorCode = 0;
  String errorMessage = " ";
  //method for getting data form of api
  Future getData() async {
    http.Response response = await http.get(url);
    //debugPrint(response.body);
    if (response.statusCode == 200) {
      jsonRespone = response.body;
      List<TaskUser> userlist = parseTaskUser(response.body);
      data = userlist;
      errorCode = 2;
      errorMessage = "List successfully Feteched from api";
    } else {
      errorCode = 1;
      errorMessage = "Failed To Feteched Data";
    }
  }

  List<TaskUser> parseTaskUser(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<TaskUser>((json) => TaskUser.fromJson(json)).toList();
  }

  var data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print("hello");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HttpTest'),
      ),
      //it will display empty container is data is not fetched!!
      body: Column(
        children: <Widget>[
          Container(
            height: 500,
            child: data == null ? Container() : TaskUserList(user: data),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 50,
            width: 250,
            child: ElevatedButton(
              onPressed: () async {
                await getData();
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
          Container(
            child: ErrorText(
              errorCode: errorCode,
              errorMessage: errorMessage,
            ),
          )
        ],
      ),
    );
  }
}
