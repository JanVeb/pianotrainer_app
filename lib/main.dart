import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';

import 'key_page.dart';

// The existing imports
// !! Keep your existing impots here !!

/// main is entry point of Flutter application

//
//   Generates a positive random integer uniformly distributed on the range
//   from [min], inclusive, to [max], exclusive.
//

void main() {
  // Desktop platforms aren't a valid platform.

  if (!kIsWeb) _setTargetPlatformForDesktop();
  return runApp(MyApp());
}

/// If the current platform is desktop, override the default platform to
/// a supported platform (iOS for macOS, Android for Linux and Windows).
/// Otherwise, do nothing.

void _setTargetPlatformForDesktop() {
  TargetPlatform targetPlatform;
  if (Platform.isMacOS) {
    targetPlatform = TargetPlatform.iOS;
  } else if (Platform.isLinux || Platform.isWindows) {
    targetPlatform = TargetPlatform.android;
  }
  if (targetPlatform != null) {
    debugDefaultTargetPlatformOverride = targetPlatform;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      // // DeviceOrientation.portraitUp,
      // // DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Screen(),
    );
  }
}

class Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      backgroundColor: Colors.black87,
      body: KeyPage(),
      // appBar: AppBar(
      //   backgroundColor: Colors.black,
      //   title: Center(
      //     child: Text('TTM'),
      //   ),
      // ),
    );
  }
}

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   final _flutterMidi = FlutterMidi();
//
//   @override
//   void initState() {
//     if (!kIsWeb) {
//       load(_value);
//     } else {
//       _flutterMidi.prepare(sf2: null);
//     }
//     super.initState();
//   }
//
//
//   void load(String asset) async {
//     print("Loading File...");
//     FlutterMidi.unmute();
//     ByteData _byte = await rootBundle.load(asset);
//     // 'assets/sf2/SmallTimGM6mb.sf2';
//     // 'assets/sf2/Piano1.sf2';
//     FlutterMidi.prepare(sf2: _byte, name: _value.replaceAll("assets/sf2/", ""));
//   }
//
//   String _value = "assets/sf2/SmallTimGM6mb.sf2";

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Plugin example app'),
//         ),
//         body: Center(
//             child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             DropdownButton<String>(
//               value: _value,
//               items: [
//                 DropdownMenuItem(
//                   child: Text("Soft Piano"),
//                   value: "assets/sf2/SmallTimGM6mb.sf2",
//                 ),
//                 DropdownMenuItem(
//                   child: Text("Loud Piano"),
//                   value: "assets/sf2/Piano1.sf2",
//                 ),
//               ],
//               onChanged: (String value) {
//                 setState(() {
//                   _value = value;
//                 });
//                 load(_value);
//               },
//             ),
//             RaisedButton(
//               child: Text("Play C"),
//               onPressed: () {
//                 FlutterMidi.playMidiNote(midi: 60);
//               },
//             ),
//           ],
//         )),
//       ),
//     );
//   }
// }

// @override
// Widget build(BuildContext context) {
//   return MaterialApp(
//     home: Scaffold(
//       backgroundColor: Colors.white30,
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Expanded(
//               child: Row(
//                 children: <Widget>[
//                   quizKey(color: Colors.green),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: Row(
//                 children: <Widget>[
//                   buildKey(color: Colors.white, soundNumber: 24),
//                   buildKey(color: Colors.black, soundNumber: 24),
//                   buildKey(color: Colors.white, soundNumber: 36),
//                   buildKey(color: Colors.black, soundNumber: 24),
//                   buildKey(color: Colors.white, soundNumber: 48),
//                   buildKey(color: Colors.white, soundNumber: 60),
//                   buildKey(color: Colors.black, soundNumber: 24),
//                   buildKey(color: Colors.white, soundNumber: 72),
//                   buildKey(color: Colors.black, soundNumber: 24),
//                   buildKey(color: Colors.white, soundNumber: 84),
//                   buildKey(color: Colors.black, soundNumber: 24),
//                   buildKey(color: Colors.white, soundNumber: 96),
//                 ],
//               ),
//             ),
//             Positioned(
//               child: Row(
//                 children: <Widget>[
//                   buildKey(color: Colors.white, soundNumber: 24),
//                   buildKey(color: Colors.black, soundNumber: 24),
//                   buildKey(color: Colors.white, soundNumber: 36),
//                   buildKey(color: Colors.black, soundNumber: 24),
//                   buildKey(color: Colors.white, soundNumber: 48),
//                   buildKey(color: Colors.white, soundNumber: 60),
//                   buildKey(color: Colors.black, soundNumber: 24),
//                   buildKey(color: Colors.white, soundNumber: 72),
//                   buildKey(color: Colors.black, soundNumber: 24),
//                   buildKey(color: Colors.white, soundNumber: 84),
//                   buildKey(color: Colors.black, soundNumber: 24),
//                   buildKey(color: Colors.white, soundNumber: 96),
//                 ],
//               ),
//             ),

// Expanded(
//   child: Row(
//     children: <Widget>[
//       buildKey(color: Colors.white, soundNumber: 24),
//       buildKey(color: Colors.black, soundNumber: 24),
//       buildKey(color: Colors.white, soundNumber: 36),
//       buildKey(color: Colors.black, soundNumber: 24),
//       buildKey(color: Colors.white, soundNumber: 48),
//       buildKey(color: Colors.white, soundNumber: 60),
//       buildKey(color: Colors.black, soundNumber: 24),
//       buildKey(color: Colors.white, soundNumber: 72),
//       buildKey(color: Colors.black, soundNumber: 24),
//       buildKey(color: Colors.white, soundNumber: 84),
//       buildKey(color: Colors.black, soundNumber: 24),
//       buildKey(color: Colors.white, soundNumber: 96),
//     ],
//   ),
// ),
// Expanded(
//   child: Row(
//     children: <Widget>[
//       buildKey(color: Colors.white, soundNumber: 60),
//       buildKey(color: Colors.black, soundNumber: 61),
//       buildKey(color: Colors.white, soundNumber: 62),
//       buildKey(color: Colors.black, soundNumber: 63),
//       buildKey(color: Colors.white, soundNumber: 64),
//       buildKey(color: Colors.white, soundNumber: 65),
//       buildKey(color: Colors.black, soundNumber: 66),
//       buildKey(color: Colors.white, soundNumber: 67),
//       buildKey(color: Colors.black, soundNumber: 68),
//       buildKey(color: Colors.white, soundNumber: 69),
//       buildKey(color: Colors.black, soundNumber: 70),
//       buildKey(color: Colors.white, soundNumber: 71),
//     ],
//   ),
// ),
// Expanded(
//   child: Row(
//     children: <Widget>[
//       buildKey(color: Colors.white, soundNumber: 48),
//       buildKey(color: Colors.black, soundNumber: 49),
//       buildKey(color: Colors.white, soundNumber: 50),
//       buildKey(color: Colors.black, soundNumber: 51),
//       buildKey(color: Colors.white, soundNumber: 52),
//       buildKey(color: Colors.white, soundNumber: 53),
//       buildKey(color: Colors.black, soundNumber: 54),
//       buildKey(color: Colors.white, soundNumber: 55),
//       buildKey(color: Colors.black, soundNumber: 56),
//       buildKey(color: Colors.white, soundNumber: 57),
//       buildKey(color: Colors.black, soundNumber: 58),
//       buildKey(color: Colors.white, soundNumber: 59),
//     ],
//   ),
// ),
// Expanded(
//   child: Row(
//     children: <Widget>[
//       buildKey(color: Colors.white, soundNumber: 36),
//       buildKey(color: Colors.black, soundNumber: 37),
//       buildKey(color: Colors.white, soundNumber: 38),
//       buildKey(color: Colors.black, soundNumber: 29),
//       buildKey(color: Colors.white, soundNumber: 40),
//       buildKey(color: Colors.white, soundNumber: 41),
//       buildKey(color: Colors.black, soundNumber: 42),
//       buildKey(color: Colors.white, soundNumber: 43),
//       buildKey(color: Colors.black, soundNumber: 44),
//       buildKey(color: Colors.white, soundNumber: 45),
//       buildKey(color: Colors.black, soundNumber: 46),
//       buildKey(color: Colors.white, soundNumber: 47),
//     ],
//   ),
// ),
// Expanded(
//   child: Row(
//     children: <Widget>[
//       buildKey(color: Colors.white, soundNumber: 24),
//       buildKey(color: Colors.black, soundNumber: 25),
//       buildKey(color: Colors.white, soundNumber: 26),
//       buildKey(color: Colors.black, soundNumber: 27),
//       buildKey(color: Colors.white, soundNumber: 28),
//       buildKey(color: Colors.white, soundNumber: 29),
//       buildKey(color: Colors.black, soundNumber: 30),
//       buildKey(color: Colors.white, soundNumber: 31),
//       buildKey(color: Colors.black, soundNumber: 32),
//       buildKey(color: Colors.white, soundNumber: 33),
//       buildKey(color: Colors.black, soundNumber: 34),
//       buildKey(color: Colors.white, soundNumber: 35),
//     ],
//   ),
// ),
//           ],
//         ),
//       ),
//     ),
//   );
// }

//
// bool buildShowLabels(String pitchName, int soundNumber) {
//   if (soundNumber) {
//     if (labelsOnlyOctaves) {
//       if (pitchName.replaceAll(RegExp("[0-9]"), "") == "C") return true;
//       return false;
//     }
//     return true;
//   }
//   return false;
// }
