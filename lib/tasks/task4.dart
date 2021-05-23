import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class TaskFourHome extends StatefulWidget {
  @override
  _TaskFourHomeState createState() => _TaskFourHomeState();
}

class _TaskFourHomeState extends State<TaskFourHome> {
  AudioPlayer _audioPlayer = AudioPlayer(); //object of audioplayer dependencies
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task 4'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //for stopping music
            GestureDetector(
              onTap: () {
                _audioPlayer.stop();
              },
              child: Container(
                width: 200,
                height: 200,
                color: Colors.red,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Tap Here To Stop Audio"),
            SizedBox(
              height: 100,
            ),
            //playing music for internet
            SizedBox(
              height: 50,
              width: 250,
              child: ElevatedButton(
                onPressed: () async {
                  int result = await _audioPlayer.play(
                      'https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3');
                  if (result == 1) {
                    // success
                  }
                },
                child: Text(
                  'Download & Play',
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
            //playing music for local
            SizedBox(
              height: 50,
              width: 250,
              child: ElevatedButton(
                onPressed: () async {
                  int result = await _audioPlayer.play(
                      'https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3');
                  if (result == 1) {
                    // success
                  }
                  // String filePath = await FilePicker.getFilePath();
                  // await _audioPlayer.play(filePath, isLocal: true);
                },
                child: Text(
                  'Play local audio',
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
