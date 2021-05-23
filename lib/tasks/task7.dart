import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class TaskSevenHome extends StatefulWidget {
  @override
  _TaskSevenHomeState createState() => _TaskSevenHomeState();
}

class _TaskSevenHomeState extends State<TaskSevenHome> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      new FlutterLocalNotificationsPlugin(); //object local notification plugin
  @override
  void initState() {
    // TODO: implement initState
    //init notification plugin
    super.initState();
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOS = new IOSInitializationSettings();
    var initSetttings = new InitializationSettings(android: android, iOS: iOS);
    flutterLocalNotificationsPlugin.initialize(
      initSetttings,
      onSelectNotification: (payload) async {
        debugPrint("payload:$payload");
        showDialog(
          context: context,
          builder: (_) => new AlertDialog(
            title: new Text("Notification"),
            content: new Text('$payload'),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task 7'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                await showNotification();
                print("hi");
              },
              child: Container(
                alignment: Alignment.center,
                width: 300,
                height: 300,
                color: Colors.green,
                child: Text(
                  "Send notification",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Click this button to send a basic notification",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  //poping notification
  showNotification() async {
    var android = new AndroidNotificationDetails(
        'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        priority: Priority.high, importance: Importance.max);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android: android, iOS: iOS);
    await flutterLocalNotificationsPlugin.show(0, 'Local Notification ',
        'Local Notification Genrate With Button', platform,
        payload: 'Ninja');
  }
}
