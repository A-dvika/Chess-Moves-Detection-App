// ignore_for_file: unused_import, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:demo/correct.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AssetsAudioPlayer _audioPlayer = AssetsAudioPlayer.newPlayer();

  @override
  void initState() {
    super.initState();
    _audioPlayer.open(
      Audio("assets/sounds/interface.mp3"),
      autoStart: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "What's Your Move",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Chess Moves Detection App'),
          backgroundColor:
              const Color(0xFF000000), // Set the primary color here
        ),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image:
                      AssetImage("assets/images/HD-wallpaper-chess-game.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: GestureDetector(
                onTap: () async {
                  await _audioPlayer.play();
                },
                child: const TfliteModel(title: "Chess Moves Detection App"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// main.dart
// import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:assets_audio_player/assets_audio_player.dart';
//
// void main () {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   final AssetsAudioPlayer _audioPlayer = AssetsAudioPlayer.newPlayer();
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "What's Your Move",
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: Text('Chess Moves Detection App'),
//           backgroundColor: Color(0xFF000000),
//         ),
//         body: Stack(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage("assets/images/HD-wallpaper-chess-game.jpg"),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Center(
//               child: GestureDetector(
//                 onTap: () async {
//                   await _audioPlayer.open(
//                     Audio("assets/sounds/tap.mp3"),
//                     autoStart: true,
//                   );
//                 },
//                 child: Text(
//                   'Tap anywhere to play sound!',
//                   style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//
// //
// // import 'package:flutter/material.dart';
// import 'package:demo/correct.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "What's Your Move",
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//             centerTitle: true,
//           title: Text('Chess Moves Detection App'),
//           backgroundColor: Color(0xFF000000), // Set the primary color here
//         ),
//         body: Stack(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(
//                       "assets/images/HD-wallpaper-chess-game.jpg"),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Center(
//               child: TfliteModel(title: "Chess Moves Detection App"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//     return MaterialApp(
//       title: 'Chess Moves Detection App',
//         debugShowCheckedModeBanner: false,
//         home: Scaffold(
//         appBar: AppBar(
//         title: Text('Chess Moves Detection App'),
//         backgroundColor: Color(0xFF000000),
//         ),
//
//     ),// S
//       // debugShowCheckedModeBanner: false,
//       // backgroundColor: Color(0xFF000000),
//
//         body: Stack(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage("assets/images/HD-wallpaper-chess-game.jpg"),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//
//             Center(
//               child: TfliteModel(title: "Chess Moves Detection App"),
//             ),
//           ],
//         ),
//
//     );
//   }
// }
