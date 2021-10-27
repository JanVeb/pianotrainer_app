import 'package:flutter/material.dart';
import 'package:flutter_midi/flutter_midi.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sheet_music/sheet_music.dart';
import 'dart:math';

import 'newSoundKey.dart';
import 'reviewKey.dart';
import 'package:pianotrainer_app/sheetMusic/noteSF2Map.dart';
import 'package:pianotrainer_app/keysUI/88%20key.dart';

// int userAnswer = 0; // updated from main.dart
String pitchActive = 'C4';

class BuildWhiteKey extends StatefulWidget {
  final double keyHeight;
  final int soundNumber;

  int get keyName => this.soundNumber;

  BuildWhiteKey({
    @required this.keyHeight,
    @required this.soundNumber,
    Null Function() onPressed,
  });

  @override
  State<StatefulWidget> createState() => BuildWhiteKeyState();
}

// class ToneNames extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => ToneNamesState();
// }
//
// class ToneNamesState extends State<BuildWhiteKey> {
//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.bottomCenter,
//       child: Stack(
//         //padding: EdgeInsets.all(1.0),
//
//         children: <Widget>[
//           Text(
//             '$BuildWhiteKey.keyName',
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 10.0,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class BuildWhiteKeyState extends State<BuildWhiteKey> {
  String imagePath = "assets/images/testLG2.svg";

  // int text = keyName;
  // final int soundNumber;
  // BuildWhiteKey(this.soundNumber);
  // final int soundNumber = widget.soundNumber;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(1, 0, 1, 5.0),
        child: whiteKey(
          height: widget.keyHeight,
          onPressed: () {
            FlutterMidi.playMidiNote(midi: widget.soundNumber);
            setState(() {
              ReviewKey.userAnswer = widget.soundNumber;
              NewSoundKey.userAnswerNew = widget.soundNumber;
            });
          },
          // child: Stack(
          //   //padding: EdgeInsets.all(1.0),
          //   alignment: Alignment.bottomCenter,
          //   children: <Widget>[
          //     Text(
          //       SoundAssign().toString(),
          //       style: TextStyle(
          //         color: Colors.red,
          //         fontSize: 30.0,
          //       ),
          //       textAlign: TextAlign.left,
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }

  Widget whiteKey(
      {VoidCallback onPressed, Widget child, double width, double height}) {
    return GestureDetector(
      onTapDown: (tap) {
        setState(() {
          imagePath = "assets/images/wkd4.svg";
        });
        onPressed();
      },
      onTapCancel: () {
        setState(() {
          imagePath = "assets/images/testLG2.svg";
        });
      },
      onTapUp: (TapUpDetails tapUpDetails) {
        setState(() {
          imagePath = "assets/images/testLG2.svg";
        });
      },
      child: Stack(
        children: [
          SvgPicture.asset(
            '$imagePath',
            fit: BoxFit.fill,
            allowDrawingOutsideViewBox: true,
            width: 50,
          ),
          // Container(
          //   decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //       begin: Alignment.topRight,
          //       end: Alignment(
          //           2, 0), // 10% of the width, so there are ten blinds.
          //       colors: [
          //         const Color.fromRGBO(150, 150, 150, 80),
          //         const Color.fromRGBO(255, 255, 255, 0.0),
          //       ], // red to yellow
          //     ),
          //   ),
          // ),
          // Container(
          //     decoration: BoxDecoration(
          //   gradient: SweepGradient(
          //     center: FractionalOffset.center,
          //     startAngle: 0.0,
          //     endAngle: math.pi * 2,
          //     colors: const <Color>[
          //       const Color.fromRGBO(242, 242, 242, 0),
          //       const Color.fromRGBO(236, 236, 236, 0),
          //       const Color.fromRGBO(230, 230, 230, 0),
          //       const Color.fromRGBO(204, 204, 204, 0),
          //       const Color.fromRGBO(179, 179, 179, 0),
          //     ],
          //     stops: const <double>[0.0, 0.25, 0.5, 0.75, 1.0],
          //   ),
          // )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Stack(
              //padding: EdgeInsets.all(1.0),

              children: <Widget>[
                Text(
                  SoundAssign(value: widget.soundNumber).toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
