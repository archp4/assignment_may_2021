import 'package:flutter/material.dart';

class TaskFiveHome extends StatefulWidget {
  @override
  _TaskFiveHomeState createState() => _TaskFiveHomeState();
}

//incomplete task but ui is complete
class _TaskFiveHomeState extends State<TaskFiveHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task 5'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: 400,
              height: 300,
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: Text(
                'Show A linear graph Of your Choice here',
                style: TextStyle(fontSize: 14),
              ),
            ),
            SizedBox(
              height: 120,
            ),
            SizedBox(
              height: 50,
              width: 250,
              child: ElevatedButton(
                onPressed: () => {},
                child: Text(
                  'Data From api',
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
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: 250,
              child: ElevatedButton(
                onPressed: () => {},
                child: Text(
                  'Show local data',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
