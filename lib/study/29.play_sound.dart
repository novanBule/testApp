// import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';

// // if error
// // https://stackoverflow.com/questions/59893018/flutter-execution-failed-for-task-appcompiledebugkotlin

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   String data = "00:00:00";
//   AudioPlayer audioPlayer;

//   _MyAppState() {
//     audioPlayer = AudioPlayer();
//     audioPlayer.onAudioPositionChanged.listen((event) {
//       setState(() {
//         data = event.toString();
//       });
//     });
//   }

//   void playSound(String url) async {
//     await audioPlayer.play(url);
//   }

//   void pauseSound() async {
//     await audioPlayer.pause();
//   }

//   void stopSound() async {
//     await audioPlayer.stop();
//   }

//   void resumeSound() async {
//     await audioPlayer.resume();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Play Sound"),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   FloatingActionButton(
//                     onPressed: () {
//                       playSound(
//                           "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3");
//                     },
//                     child: Icon(Icons.play_arrow),
//                   ),
//                   FloatingActionButton(
//                     onPressed: () {
//                       pauseSound();
//                     },
//                     child: Icon(Icons.pause),
//                   ),
//                   FloatingActionButton(
//                     onPressed: () {
//                       stopSound();
//                     },
//                     child: Icon(Icons.stop),
//                   ),
//                   FloatingActionButton(
//                     onPressed: () {
//                       resumeSound();
//                     },
//                     child: Icon(Icons.repeat_on),
//                   ),
//                 ],
//               ),
//               Text(
//                 data,
//                 style: TextStyle(fontSize: 20),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
