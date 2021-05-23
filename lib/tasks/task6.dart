import 'package:flutter/material.dart';
import 'package:my_assignment/helper/database.dart';

class TaskSixHome extends StatefulWidget {
  @override
  _TaskSixHomeState createState() => _TaskSixHomeState();
}

//incomplete task but ui is complete and methods are implemented
class _TaskSixHomeState extends State<TaskSixHome> {
  DatabaseConnection db = new DatabaseConnection();

  TextEditingController textEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task 6'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "Data Fetched from loacl db",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SingleChildScrollView(
                child: Container(
                  height: 440,
                  child: Text(''),
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      width: 300,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Type a Note here',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                        ),
                        controller: textEditingController,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 60,
                      width: 300,
                      child: ElevatedButton(
                        child: Text('Sava Data'),
                        onPressed: () async {
                          await db.getDataFromDB();
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green)),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
