// ignore_for_file: library_private_types_in_public_api

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart' show Tflite;
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class TfliteModel extends StatefulWidget {
  final String title;

  const TfliteModel({Key? key, required this.title}) : super(key: key);

  @override
  _TfliteModelState createState() => _TfliteModelState();
}

class _TfliteModelState extends State<TfliteModel> {
  late File _image;
  late List<dynamic> _results = [];
  bool imageSelect = false;
  final soundPath = 'assets/sounds/select_image_sound.mp3';
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  @override
  void dispose() {
    super.dispose();
    Tflite.close();
  }

  loadModel() async {
    await Tflite.loadModel(
        model: 'assets/tflite/model.tflite',
        labels: 'assets/tflite/labels.txt');
  }

  playSound() async {
    // final player = AudioPlayer();
    await player.play('assets/sounds/button.mp3' as Source);
  }

  imageClassification(File image) async {
    var res = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 1,
        threshold: 0.6,
        imageMean: 0.0,
        imageStd: 255.0);

    setState(() {
      _results = res!;
      imageSelect = true;
    });
    playSound();
  }

  Future getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    File image = File(pickedFile!.path);
    imageClassification(image);
    player.play('assets/sounds/button.mp3' as Source);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (imageSelect)
          Container(
            height: 300.0,
            width: 300.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: FileImage(_image),
                fit: BoxFit.cover,
              ),
            ),
          )
        else
          Container(
            height: 300.0,
            width: 300.0,
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: const Center(
              child: Text(
                "No image selected",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        const SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4A4A4A),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            getImage();
            // add your onPressed logic here
          },
          child: const Text("Select Image"),
        ),

        // ElevatedButton(
        //   onPressed: () {

        //   },

        // child: Text("Select Image"),
        // style: ElevatedButton.styleFrom(
        //   primary: Color(0xFF4A4A4A),
        //   padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        //   textStyle: TextStyle(
        //     color: Colors.white,
        //     fontSize: 16,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        // ),
        const SizedBox(height: 20),
        if (_results.isNotEmpty)
          Text(
            "${_results[0]["label"]}",
            style: const TextStyle(fontSize: 20),
          )
      ],
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:tflite/tflite.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';
//
// class TfliteModel extends StatefulWidget {
//   final String title;
//   TfliteModel({Key? key, required this.title}) : super(key: key);
//
//   @override
//   _TfliteModelState createState() => _TfliteModelState();
// }
// class _TfliteModelState extends State<TfliteModel> {
//   late File _image;
//   late List<dynamic> _results = [];
//   bool imageSelect = false;
//
//   @override
//   void initState() {
//     super.initState();
//     loadModel();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     Tflite.close();
//   }
//
//
//   loadModel() async {
//     await Tflite.loadModel(
//         model: 'assets/tflite/model_unquant.tflite',
//         labels: 'assets/tflite/labels.txt');
//   }
//
//   imageClassification(File image) async {
//     var res = await Tflite.runModelOnImage(
//         path: image.path,
//         numResults: 1,
//         threshold: 0.6,
//         imageMean: 0.0,
//         imageStd: 255.0);
//
//     setState(() {
//       _results = res!;
//       imageSelect = true;
//     });
//   }
//   Future getImage() async {
//     final ImagePicker _picker = ImagePicker();
//     final XFile? pickedFile = await _picker.pickImage(
//       source: ImageSource.gallery,
//     );
//     if (pickedFile != null) {
//       File image = File(pickedFile.path);
//       imageClassification(image);
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//       Text(
//       widget.title,
//       style: TextStyle(
//         fontSize: 32,
//         fontWeight: FontWeight.bold,
//         color: Colors.black,
//       ),
//     ) ,
//     SizedBox(height: 50),
//     if (imageSelect)
//       Container(
//          height: 300.0,
//          width: 300.0,
//          decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               boxShadow: [
//                   BoxShadow(
//                      color: Colors.grey.withOpacity(0.8),
//                      blurRadius: 4,
//                      offset: Offset(0, 4),
//                   ),
//               ],
//                image: DecorationImage(
//                   image: FileImage(_image),
//                   fit: BoxFit.cover,
//                   ),
//                ),
//          )
//          else
//              Container(
//                 height: 300.0,
//                 width: 300.0,
//                 decoration: BoxDecoration(
//                    borderRadius: BorderRadius.circular(10),
//                    boxShadow: [
//                      BoxShadow(
//                         color: Colors.grey.withOpacity(0.8),
//                         blurRadius: 4,
//                         offset: Offset(0, 4),
//                         ),
//                      ],
//                      border: Border.all(color: Colors.black, width: 2),
//                    ),
//                    child: Center(
//                       child: Text(
//                          "No image selected",
//                           style: TextStyle(
//                              fontSize: 20,
//                              color: Colors.black,
//                              ),
//                             ),
//                           ),
//                       ),
//                       SizedBox(height: 50),
//                       ElevatedButton(
//                          onPressed: () {
//                             getImage();
//                             },
//                          child: Text(
//                             "Select Image",
//                              style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                                 ),
//                              ),
//                               style: ElevatedButton.styleFrom(
//                                    primary: Colors.black,
//                                    shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(10),
//                                    ),
//                                    padding
//
//
//
//




// import 'package:flutter/material.dart';
// import 'package:tflite/tflite.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';
//
// class TfliteModel extends StatefulWidget {
//   final String title;
//
//   TfliteModel({Key? key, required this.title}) : super(key: key);
//
//   @override
//   _TfliteModelState createState() => _TfliteModelState();
// }
//
// class _TfliteModelState extends State<TfliteModel> {
//   late File _image;
//   late List<dynamic> _results = [];
//   bool imageSelect = false;
//
//   @override
//   void initState() {
//     super.initState();
//     loadModel();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     Tflite.close();
//   }
//
//   loadModel() async {
//     await Tflite.loadModel(
//         model: 'assets/tflite/model_unquant.tflite',
//         labels: 'assets/tflite/labels.txt');
//   }
//
//   imageClassification(File image) async {
//     var res = await Tflite.runModelOnImage(
//         path: image.path,
//         numResults: 1,
//         threshold: 0.6,
//         imageMean: 0.0,
//         imageStd: 255.0);
//
//
//     setState(() {
//       _results = res!;
//       imageSelect = true;
//     });
//   }
//
//   Future getImage() async {
//     final ImagePicker _picker = ImagePicker();
//     final XFile? pickedFile = await _picker.pickImage(
//       source: ImageSource.gallery,
//     );
//     File image = File(pickedFile!.path);
//     imageClassification(image);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         if (imageSelect)
//           Container(
//             height: 300.0,
//             width: 300.0,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: FileImage(_image),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           )
//         else
//           Container(
//             height: 300.0,
//             width: 300.0,
//             decoration: BoxDecoration(
//               border: Border.all(),
//             ),
//             child: Center(
//               child: Text(
//                 "No image selected",
//                 style: TextStyle(fontSize: 20),
//               ),
//             ),
//           ),
//         SizedBox(height: 20),
//         ElevatedButton(
//           onPressed: () {
//             getImage();
//           },
//           child: Text("Select Image"),
//         ),
//         SizedBox(height: 20),
//         if (_results.isNotEmpty)
//           Text(
//             "${_results[0]["label"]}",
//             style: TextStyle(fontSize: 20),
//           )
//       ],
//     );
//   }
// }
