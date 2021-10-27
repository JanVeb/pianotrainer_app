// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:sheet_music/sheet_music.dart';
//
//
// import 'newSoundKey.dart';
// import 'reviewKey.dart';
// import 'checkAnswerKey.dart';
// import 'buildWhiteKey.dart';
// import 'buildBlackKey.dart';
// import 'package:pianotrainer_app/keysUI/88%20key.dart';
//
// class Key88 extends StatefulWidget {
//   @override
//   _Key88State createState() => _Key88State();
// }
//
// String pitchActive;
//
// Widget sheetMusic1({double keyWidth, double keyHeight}) {
//   return SafeArea(
//     child: Column(
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         SheetMusic(
//           width: keyWidth,
//           height: keyHeight,
//           scale: "C Major",
//           pitch: "C4",
//           trebleClef: true,
//         ),
//         SheetMusic(
//           width: keyWidth,
//           height: keyHeight,
//           scale: "C Major",
//           pitch: "C#2",
//           trebleClef: false,
//         ),
//         // ListTile(
//         //   title: const Text('Scale'),
//         //   trailing: const Icon(Icons.search),
//         // ),
//         // ListTile(
//         //   title: const Text('Pitch'),
//         //   trailing: const Icon(Icons.search),
//         // ),
//       ],
//     ),
//   );
// }
//
// class _Key88State extends State<Key88> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: new LayoutBuilder(
//           builder: (BuildContext context, BoxConstraints constraints) {
//         //double screenWidth = MediaQuery.of(context).size.width;
//         double screenHeight = MediaQuery.of(context).size.height;
//         double whiteKeyWidth = MediaQuery.of(context).size.width /
//             21; //this is the width of white key
//         double whiteKeyHeight = screenHeight /
//             3; // height of white keys //TODO 2 check as well key height difrence in iOS and Android, seems similar issue as with TODO 1
//         double blackKeyHeight = whiteKeyHeight / 1.618;
//         double kbottomHeight = blackKeyHeight / 1.7; // height of black keys
//         double blackKeyWidthCalc = whiteKeyWidth / 1.618;
//         return Column(
//           mainAxisSize: MainAxisSize.max,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             // Expanded(
//             //     child: Stack(children: <Widget>[
//             //   Row(
//             //       crossAxisAlignment: CrossAxisAlignment.stretch,
//             //       children: <Widget>[
//             //         svgTest(),
//             //       ])
//             // ])),
//             Expanded(
//               child: Stack(children: <Widget>[
//                 Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: <
//                     Widget>[
//                   // Container(
//                   //   height: 200,
//                   //   width: 100,
//                   //   child: Image(
//                   //     height: 200,
//                   //     width: 200,
//                   //     image: AssetImage("assets/images/bku7.png"),
//                   //     fit: BoxFit.fill,
//                   //   ),
//                   //),
//                   Container(
//                     width: whiteKeyWidth * 6,
//                     child: sheetMusic1(
//                       keyWidth: whiteKeyWidth * 3.1,
//                       keyHeight: whiteKeyHeight / 2,
//                     ),
//                   ),
//                   //- 18), //TODO 1 need to add spacing for iPhone, need to check how to solve this, or made two separate layouts, one for ios another for android, or could control this through variable that has value 0 on android and positive value on iOS
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 84),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 86),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 88),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 89),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 91),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 93),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 95),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 96),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 98),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 100),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 101),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 103),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 105),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 107),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 108),
//                 ]),
//                 Positioned(
//                     left: 0.0,
//                     right: 0.0,
//                     bottom: kbottomHeight,
//                     top: 0.0,
//                     child:
//                         Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
//                       Container(width: (whiteKeyWidth * 6)),
//                       //TODO 1 - 27),
//                       Container(width: whiteKeyWidth * 0.7),
//                       BuildBlackKey(
//                           blackKeyWidth: blackKeyWidthCalc,
//                           keyHeight: blackKeyHeight,
//                           soundNumber: 85),
//                       BuildBlackKey(
//                           blackKeyWidth: blackKeyWidthCalc,
//                           keyHeight: blackKeyHeight,
//                           soundNumber: 87),
//                       Container(width: whiteKeyWidth),
//                       BuildBlackKey(
//                           blackKeyWidth: blackKeyWidthCalc,
//                           keyHeight: blackKeyHeight,
//                           soundNumber: 90),
//                       BuildBlackKey(
//                           blackKeyWidth: blackKeyWidthCalc,
//                           keyHeight: blackKeyHeight,
//                           soundNumber: 92),
//                       BuildBlackKey(
//                           blackKeyWidth: blackKeyWidthCalc,
//                           keyHeight: blackKeyHeight,
//                           soundNumber: 94),
//                       Container(width: whiteKeyWidth * 0.5),
//                       Container(width: whiteKeyWidth * 0.5),
//                       BuildBlackKey(
//                           blackKeyWidth: blackKeyWidthCalc,
//                           keyHeight: blackKeyHeight,
//                           soundNumber: 97),
//                       BuildBlackKey(
//                           blackKeyWidth: blackKeyWidthCalc,
//                           keyHeight: blackKeyHeight,
//                           soundNumber: 99),
//                       Container(width: whiteKeyWidth * 1),
//                       BuildBlackKey(
//                           blackKeyWidth: blackKeyWidthCalc,
//                           keyHeight: blackKeyHeight,
//                           soundNumber: 102),
//                       BuildBlackKey(
//                           blackKeyWidth: blackKeyWidthCalc,
//                           keyHeight: blackKeyHeight,
//                           soundNumber: 104),
//                       BuildBlackKey(
//                           blackKeyWidth: blackKeyWidthCalc,
//                           keyHeight: blackKeyHeight,
//                           soundNumber: 106),
//                       Container(width: (whiteKeyWidth * 1.3)),
//                       //TODO 1 - 5),
//                     ])),
//               ]),
//             ),
//             Expanded(
//               child: Stack(children: <Widget>[
//                 Row(children: <Widget>[
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 48),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 50),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 52),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 53),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 55),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 57),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 59),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 60),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 62),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 64),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 65),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 67),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 69),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 71),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 72),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 74),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 76),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 77),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 79),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 81),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 83),
//                 ]),
//                 Positioned(
//                     left: 0.0,
//                     right: 0.0,
//                     bottom: kbottomHeight,
//                     top: 0.0,
//                     child:
//                         Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
//                       Container(width: whiteKeyWidth * 0.7),
//                       BuildBlackKey(
//                           blackKeyWidth: blackKeyWidthCalc,
//                           keyHeight: blackKeyHeight,
//                           soundNumber: 49),
//                       BuildBlackKey(
//                           blackKeyWidth: blackKeyWidthCalc,
//                           keyHeight: blackKeyHeight,
//                           soundNumber: 51),
//                       Container(width: whiteKeyWidth),
//                       BuildBlackKey(
//                           blackKeyWidth: blackKeyWidthCalc,
//                           keyHeight: blackKeyHeight,
//                           soundNumber: 54),
//                       BuildBlackKey(
//                           blackKeyWidth: blackKeyWidthCalc,
//                           keyHeight: blackKeyHeight,
//                           soundNumber: 56),
//                       BuildBlackKey(
//                           blackKeyWidth: blackKeyWidthCalc,
//                           keyHeight: blackKeyHeight,
//                           soundNumber: 58),
//                       Container(width: whiteKeyWidth * 0.5),
//                       Container(width: whiteKeyWidth * 0.5),
//                       BuildBlackKey(
//                           blackKeyWidth: blackKeyWidthCalc,
//                           keyHeight: blackKeyHeight,
//                           soundNumber: 61),
//                       BuildBlackKey(
//                           blackKeyWidth: blackKeyWidthCalc,
//                           keyHeight: blackKeyHeight,
//                           soundNumber: 63),
//                       Container(width: whiteKeyWidth),
//                       BuildBlackKey(
//                           blackKeyWidth: blackKeyWidthCalc,
//                           keyHeight: blackKeyHeight,
//                           soundNumber: 66),
//                       BuildBlackKey(
//                           blackKeyWidth: blackKeyWidthCalc,
//                           keyHeight: blackKeyHeight,
//                           soundNumber: 68),
//                       BuildBlackKey(
//                           blackKeyWidth: blackKeyWidthCalc,
//                           keyHeight: blackKeyHeight,
//                           soundNumber: 70),
//                       Container(width: whiteKeyWidth * 0.5),
//                       Container(width: whiteKeyWidth * 0.5),
//                       BuildBlackKey(
//                           blackKeyWidth: blackKeyWidthCalc,
//                           keyHeight: blackKeyHeight,
//                           soundNumber: 73),
//                       BuildBlackKey(
//                           blackKeyWidth: blackKeyWidthCalc,
//                           keyHeight: blackKeyHeight,
//                           soundNumber: 75),
//                       Container(width: whiteKeyWidth),
//                       BuildBlackKey(
//                           blackKeyWidth: blackKeyWidthCalc,
//                           keyHeight: blackKeyHeight,
//                           soundNumber: 78),
//                       BuildBlackKey(
//                           blackKeyWidth: blackKeyWidthCalc,
//                           keyHeight: blackKeyHeight,
//                           soundNumber: 80),
//                       BuildBlackKey(
//                           blackKeyWidth: blackKeyWidthCalc,
//                           keyHeight: blackKeyHeight,
//                           soundNumber: 82),
//                       Container(width: whiteKeyWidth * 0.3),
//                     ])),
//               ]),
//             ),
//             Expanded(
//               child: Stack(children: <Widget>[
//                 Row(children: <Widget>[
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 21),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 23),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 24),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 26),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 28),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 29),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 31),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 33),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 35),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 36),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 38),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 40),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 41),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 43),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 45),
//                   BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 47),
//                   Container(
//                     width: (whiteKeyWidth * 2),
//                   ), //TODO 1 - 22),
//                   NewSoundKey(blackKeyWidth: 40, keyHeight: 40),
//                   ReviewKey(
//                       blackKeyWidth: blackKeyWidthCalc,
//                       keyHeight: whiteKeyHeight),
//                   // bu1(
//                   //   keyHeight: whiteKeyHeight,
//                   // ),
//                   CheckAnswerKey(
//                       blackKeyWidth: blackKeyWidthCalc,
//                       keyHeight: whiteKeyHeight),
//                 ]),
//                 Positioned(
//                     left: 0.0,
//                     right: 0.0,
//                     bottom: kbottomHeight,
//                     top: 0.0,
//                     child:
//                         Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
//                       Container(width: whiteKeyWidth * 0.7),
//                       BuildBlackKey(
//                           blackKeyWidth: blackKeyWidthCalc,
//                           keyHeight: blackKeyHeight,
//                           soundNumber: 22),
//                       Container(width: whiteKeyWidth * 0.5),
//                       Container(width: whiteKeyWidth * 0.5),
//                       BuildBlackKey(
//                           blackKeyWidth: blackKeyWidthCalc,
//                           keyHeight: blackKeyHeight,
//                           soundNumber: 25),
//                       BuildBlackKey(
//                           blackKeyWidth: blackKeyWidthCalc,
//                           keyHeight: blackKeyHeight,
//                           soundNumber: 27),
//                       Container(width: whiteKeyWidth),
//                       BuildBlackKey(
//                           blackKeyWidth: blackKeyWidthCalc,
//                           keyHeight: blackKeyHeight,
//                           soundNumber: 30),
//                       BuildBlackKey(
//                           blackKeyWidth: blackKeyWidthCalc,
//                           keyHeight: blackKeyHeight,
//                           soundNumber: 32),
//                       BuildBlackKey(
//                           blackKeyWidth: blackKeyWidthCalc,
//                           keyHeight: blackKeyHeight,
//                           soundNumber: 34),
//                       Container(width: whiteKeyWidth * 0.5),
//                       Container(width: whiteKeyWidth * 0.5),
//                       BuildBlackKey(
//                           blackKeyWidth: blackKeyWidthCalc,
//                           keyHeight: blackKeyHeight,
//                           soundNumber: 37),
//                       BuildBlackKey(
//                           blackKeyWidth: blackKeyWidthCalc,
//                           keyHeight: blackKeyHeight,
//                           soundNumber: 39),
//                       Container(width: whiteKeyWidth),
//                       BuildBlackKey(
//                           blackKeyWidth: blackKeyWidthCalc,
//                           keyHeight: blackKeyHeight,
//                           soundNumber: 42),
//                       BuildBlackKey(
//                           blackKeyWidth: blackKeyWidthCalc,
//                           keyHeight: blackKeyHeight,
//                           soundNumber: 44),
//                       BuildBlackKey(
//                           blackKeyWidth: blackKeyWidthCalc,
//                           keyHeight: blackKeyHeight,
//                           soundNumber: 46),
//                       Container(width: (whiteKeyWidth * 0.3)),
//                       Container(width: (whiteKeyWidth * 5)), //TODO 1 - 22),
//                     ])),
//               ]),
//             ),
//           ],
//         );
//       }),
//     );
//   }
// }
