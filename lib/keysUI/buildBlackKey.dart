import 'package:flutter/material.dart';
import 'package:flutter_midi/flutter_midi.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:pianotrainer_app/keysUI/88%20key.dart';
import 'package:pianotrainer_app/sheetMusic/noteSF2Map.dart';
import 'buildWhiteKey.dart';
import 'newSoundKey.dart';
import 'reviewKey.dart';

class BuildBlackKey extends StatefulWidget {
  final double keyHeight;
  final double blackKeyWidth;
  final int soundNumber;

  BuildBlackKey({
    @required this.keyHeight,
    @required this.blackKeyWidth,
    @required this.soundNumber,
  });

  @override
  State<StatefulWidget> createState() => BuildBlackKeyState();
}

class BuildBlackKeyState extends State<BuildBlackKey> {
  String imagePath = "assets/images/bku10GradientTest.svg";

  Widget blackKey(
      {VoidCallback onPressed, Widget child, double width, double height}) {
    return GestureDetector(
      onTapDown: (tap) {
        setState(() {
          pitchActive = SoundAssign(value: widget.soundNumber).toString();
          imagePath = "assets/images/bkd.svg";
        });
        onPressed();
      },
      onTapCancel: () {
        setState(() {
          imagePath = "assets/images/bku10GradientTest.svg";
        });
      },
      onTapUp: (TapUpDetails tapUpDetails) {
        setState(() {
          imagePath = "assets/images/bku10GradientTest.svg";
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
          Align(
            alignment: Alignment.center,
            child: Stack(
              //padding: EdgeInsets.all(1.0),

              children: <Widget>[
                Text(
                  SoundAssign(value: widget.soundNumber).toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.0,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        child: blackKey(
          // width: 30,
          // height: keyHeight,
          onPressed: () {
            FlutterMidi.playMidiNote(midi: widget.soundNumber);
            setState(() {
              ReviewKey.userAnswer = widget.soundNumber;
              NewSoundKey.userAnswerNew = widget.soundNumber;
            });
          },
          // child: Container(
          //   //height: double.infinity,
          //   padding: EdgeInsets.all(1.0),
          //   child: Align(
          //     alignment: Alignment.bottomCenter,
          //     child: Text(
          //       widget.soundNumber.toString(),
          //       textAlign: TextAlign.left,
          //       style: TextStyle(color: Colors.white),
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }
}

// Widget BlackKey(
//     {VoidCallback onPressed, Widget child, double width, double height}) {
//   return GestureDetector(
//     onTapDown: (tap) {
//       setState(() {
//         imagePath = "assets/images/bkd9.svg";
//       });
//       onPressed();
//     },
//     onTapCancel: () {
//       setState(() {
//         imagePath = "assets/images/bku9.svg";
//       });
//     },
//     onTapUp: (TapUpDetails tapUpDetails) {
//       setState(() {
//         imagePath = "assets/images/bku9.svg";
//       });
//     },
//     child: Stack(
//       children: [
//         SvgPicture.asset(
//           '$imagePath',
//           fit: BoxFit.fill,
//           allowDrawingOutsideViewBox: true,
//           width: 50,
//         ),
//         Stack(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topRight,
//                   end: Alignment(
//                       1, 1), // 10% of the width, so there are ten blinds.
//                   colors: [
//                     const Color.fromRGBO(0, 0, 0, 100),
//                     const Color.fromRGBO(50, 50, 50, 0),
//                   ], // red to yellow
//                 ),
//               ),
//             ),
//             // Align(
//             //   alignment: Alignment.bottomCenter,
//             //   child: Stack(
//             //     //padding: EdgeInsets.all(1.0),
//             //
//             //     children: <Widget>[
//             //       Text(
//             //         '$BuildBlackKey.keyName',
//             //         style: TextStyle(
//             //           color: Colors.black,
//             //           fontSize: 10.0,
//             //         ),
//             //       ),
//             //     ],
//             //   ),
//             // ),
//           ],
//         ),
//         Stack(
//           children: [
//             Image(
//               width: 200,
//               // height: 100,
//               image: AssetImage("assets/images/bku7.png"),
//               fit: BoxFit.fill,
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }
