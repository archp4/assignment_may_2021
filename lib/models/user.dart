import 'dart:convert';

import 'package:flutter/material.dart';

//Model user data for task 1 and task 2
List<TaskUser> taskUserFromJson(String str) =>
    List<TaskUser>.from(json.decode(str).map((x) => TaskUser.fromJson(x)));

String taskUserToJson(List<TaskUser> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TaskUser {
  final int userID;
  final String userName;
  final String userEmail;
  final String userCollegeID;
  final String userImageURL;

  TaskUser({
    required this.userID,
    required this.userEmail,
    required this.userName,
    required this.userCollegeID,
    required this.userImageURL,
  });

  factory TaskUser.fromJson(Map<String, dynamic> json) {
    return TaskUser(
      userID: json['id'] as int,
      userName: json['name'] as String,
      userEmail: json['email'] as String,
      userCollegeID: json['collegeId'] as String,
      userImageURL: json['image_url'] as String,
    );
  }
  Map<String, dynamic> toJson() => {
        "id": userID,
        "name": userName,
        "email": userEmail,
        "collegeId": userCollegeID,
        "image_url": userImageURL,
      };
}

class TaskUserList extends StatelessWidget {
  final List<TaskUser> user;
  TaskUserList({required this.user});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: user.length,
        itemBuilder: (BuildContext context, int index) {
          return TaskuserListTile(user: user[index]);
        });
  }
}

class TaskuserListTile extends StatelessWidget {
  TaskUser user;
  TaskuserListTile({required this.user});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      padding: EdgeInsets.symmetric(vertical: 10),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: <Widget>[
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              width: 150,
              child: Text(
                user.userName,
                style: TextStyle(fontSize: 18),
              )),
          SizedBox(
            width: 150,
          ),
          Container(
            width: 50,
            alignment: Alignment.centerRight,
            child: CircleAvatar(
              backgroundImage: NetworkImage(user.userImageURL),
            ),
          )
        ],
      ),
    );
  }
}
