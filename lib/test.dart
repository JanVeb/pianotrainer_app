// var screenHeight = MediaQuery.of(context).size.height;
// var whiteKeyWidth =
//     MediaQuery.of(context).size.width / 7; //this is the width of white key

// @override
// Widget build(BuildContext context) {
//   return SafeArea(
//     child: Column(
//       mainAxisSize: MainAxisSize.max,
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Row(
//           children: <Widget>[
//             quizKey(),
//             Text(
//               '$expTime',
//               style: TextStyle(color: Colors.white),
//             ),
//             checkAnswer(color: Colors.red),
//           ],
//         ),
//         Expanded(
//           child: Stack(children: <Widget>[
//             Row(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: <Widget>[
//                   buildWhiteKey(color: Colors.white, soundNumber: 96),
//                   buildWhiteKey(color: Colors.white, soundNumber: 98),
//                   buildWhiteKey(color: Colors.white, soundNumber: 100),
//                   buildWhiteKey(color: Colors.white, soundNumber: 101),
//                   buildWhiteKey(color: Colors.white, soundNumber: 103),
//                   buildWhiteKey(color: Colors.white, soundNumber: 105),
//                   buildWhiteKey(color: Colors.white, soundNumber: 107),
//                 ]),
//             Positioned(
//                 left: 0.0,
//                 right: 0.0,
//                 bottom: kbottomHeight,
//                 top: 0.0,
//                 child: Row(children: <Widget>[
//                   Container(width: kkeyWidth),
//                   buildBlackKey(color: Colors.black, soundNumber: 97),
//                   Container(width: kkeyWidth * 0.5),
//                   buildBlackKey(color: Colors.black, soundNumber: 99),
//                   Container(width: kkeyWidth * 2),
//                   buildBlackKey(color: Colors.black, soundNumber: 102),
//                   Container(width: kkeyWidth * 0.5),
//                   buildBlackKey(color: Colors.black, soundNumber: 104),
//                   Container(width: kkeyWidth * 0.5),
//                   buildBlackKey(color: Colors.black, soundNumber: 106),
//                   Container(width: kkeyWidth),
//                 ])),
//           ]),
//         ),
//         Expanded(
//           child: Stack(children: <Widget>[
//             Row(children: <Widget>[
//               buildWhiteKey(color: Colors.white, soundNumber: 84),
//               buildWhiteKey(color: Colors.white, soundNumber: 86),
//               buildWhiteKey(color: Colors.white, soundNumber: 88),
//               buildWhiteKey(color: Colors.white, soundNumber: 89),
//               buildWhiteKey(color: Colors.white, soundNumber: 91),
//               buildWhiteKey(color: Colors.white, soundNumber: 93),
//               buildWhiteKey(color: Colors.white, soundNumber: 95),
//             ]),
//             Positioned(
//                 left: 0.0,
//                 right: 0.0,
//                 bottom: kbottomHeight,
//                 top: 0.0,
//                 child: Row(children: <Widget>[
//                   Container(width: kkeyWidth),
//                   buildBlackKey(color: Colors.black, soundNumber: 85),
//                   Container(width: kkeyWidth * 0.5),
//                   buildBlackKey(color: Colors.black, soundNumber: 87),
//                   Container(width: kkeyWidth * 2),
//                   buildBlackKey(color: Colors.black, soundNumber: 90),
//                   Container(width: kkeyWidth * 0.5),
//                   buildBlackKey(color: Colors.black, soundNumber: 92),
//                   Container(width: kkeyWidth * 0.5),
//                   buildBlackKey(color: Colors.black, soundNumber: 94),
//                   Container(width: kkeyWidth),
//                 ])),
//           ]),
//         ),
//         Expanded(
//           child: Stack(children: <Widget>[
//             Row(children: <Widget>[
//               buildWhiteKey(color: Colors.white, soundNumber: 72),
//               buildWhiteKey(color: Colors.white, soundNumber: 74),
//               buildWhiteKey(color: Colors.white, soundNumber: 76),
//               buildWhiteKey(color: Colors.white, soundNumber: 77),
//               buildWhiteKey(color: Colors.white, soundNumber: 79),
//               buildWhiteKey(color: Colors.white, soundNumber: 81),
//               buildWhiteKey(color: Colors.white, soundNumber: 83),
//             ]),
//             Positioned(
//                 left: 0.0,
//                 right: 0.0,
//                 bottom: kbottomHeight,
//                 top: 0.0,
//                 child: Row(children: <Widget>[
//                   Container(width: kkeyWidth),
//                   buildBlackKey(color: Colors.black, soundNumber: 73),
//                   Container(width: kkeyWidth * 0.5),
//                   buildBlackKey(color: Colors.black, soundNumber: 75),
//                   Container(width: kkeyWidth * 2),
//                   buildBlackKey(color: Colors.black, soundNumber: 78),
//                   Container(width: kkeyWidth * 0.5),
//                   buildBlackKey(color: Colors.black, soundNumber: 80),
//                   Container(width: kkeyWidth * 0.5),
//                   buildBlackKey(color: Colors.black, soundNumber: 82),
//                   Container(width: kkeyWidth),
//                 ])),
//           ]),
//         ),
//         Expanded(
//           child: Stack(children: <Widget>[
//             Row(children: <Widget>[
//               buildWhiteKey(color: Colors.white, soundNumber: 60),
//               buildWhiteKey(color: Colors.white, soundNumber: 62),
//               buildWhiteKey(color: Colors.white, soundNumber: 64),
//               buildWhiteKey(color: Colors.white, soundNumber: 65),
//               buildWhiteKey(color: Colors.white, soundNumber: 67),
//               buildWhiteKey(color: Colors.white, soundNumber: 69),
//               buildWhiteKey(color: Colors.white, soundNumber: 71),
//             ]),
//             Positioned(
//                 left: 0.0,
//                 right: 0.0,
//                 bottom: kbottomHeight,
//                 top: 0.0,
//                 child: Row(children: <Widget>[
//                   Container(width: kkeyWidth),
//                   buildBlackKey(color: Colors.black, soundNumber: 61),
//                   Container(width: kkeyWidth * 0.5),
//                   buildBlackKey(color: Colors.black, soundNumber: 63),
//                   Container(width: kkeyWidth * 2),
//                   buildBlackKey(color: Colors.black, soundNumber: 66),
//                   Container(width: kkeyWidth * 0.5),
//                   buildBlackKey(color: Colors.black, soundNumber: 68),
//                   Container(width: kkeyWidth * 0.5),
//                   buildBlackKey(color: Colors.black, soundNumber: 70),
//                   Container(width: kkeyWidth),
//                 ])),
//           ]),
//         ),
//         Expanded(
//           child: Stack(children: <Widget>[
//             Row(children: <Widget>[
//               buildWhiteKey(color: Colors.white, soundNumber: 48),
//               buildWhiteKey(color: Colors.white, soundNumber: 50),
//               buildWhiteKey(color: Colors.white, soundNumber: 52),
//               buildWhiteKey(color: Colors.white, soundNumber: 53),
//               buildWhiteKey(color: Colors.white, soundNumber: 55),
//               buildWhiteKey(color: Colors.white, soundNumber: 57),
//               buildWhiteKey(color: Colors.white, soundNumber: 59),
//             ]),
//             Positioned(
//                 left: 0.0,
//                 right: 0.0,
//                 bottom: kbottomHeight,
//                 top: 0.0,
//                 child: Row(children: <Widget>[
//                   Container(width: kkeyWidth),
//                   buildBlackKey(color: Colors.black, soundNumber: 49),
//                   Container(width: kkeyWidth * 0.5),
//                   buildBlackKey(color: Colors.black, soundNumber: 51),
//                   Container(width: kkeyWidth * 2),
//                   buildBlackKey(color: Colors.black, soundNumber: 54),
//                   Container(width: kkeyWidth * 0.5),
//                   buildBlackKey(color: Colors.black, soundNumber: 56),
//                   Container(width: kkeyWidth * 0.5),
//                   buildBlackKey(color: Colors.black, soundNumber: 58),
//                   Container(width: kkeyWidth),
//                 ])),
//           ]),
//         ),
//         Expanded(
//           child: Stack(children: <Widget>[
//             Row(children: <Widget>[
//               buildWhiteKey(color: Colors.white, soundNumber: 36),
//               buildWhiteKey(color: Colors.white, soundNumber: 38),
//               buildWhiteKey(color: Colors.white, soundNumber: 40),
//               buildWhiteKey(color: Colors.white, soundNumber: 41),
//               buildWhiteKey(color: Colors.white, soundNumber: 43),
//               buildWhiteKey(color: Colors.white, soundNumber: 45),
//               buildWhiteKey(color: Colors.white, soundNumber: 47),
//             ]),
//             Positioned(
//                 left: 0.0,
//                 right: 0.0,
//                 bottom: kbottomHeight,
//                 top: 0.0,
//                 child: Row(children: <Widget>[
//                   Container(width: kkeyWidth),
//                   buildBlackKey(color: Colors.black, soundNumber: 37),
//                   Container(width: kkeyWidth * 0.5),
//                   buildBlackKey(color: Colors.black, soundNumber: 39),
//                   Container(width: kkeyWidth * 2),
//                   buildBlackKey(color: Colors.black, soundNumber: 42),
//                   Container(width: kkeyWidth * 0.5),
//                   buildBlackKey(color: Colors.black, soundNumber: 44),
//                   Container(width: kkeyWidth * 0.5),
//                   buildBlackKey(color: Colors.black, soundNumber: 46),
//                   Container(width: kkeyWidth),
//                 ])),
//           ]),
//         ),
//         Expanded(
//           child: Stack(children: <Widget>[
//             Row(children: <Widget>[
//               buildWhiteKey(color: Colors.white, soundNumber: 24),
//               buildWhiteKey(color: Colors.white, soundNumber: 26),
//               buildWhiteKey(color: Colors.white, soundNumber: 28),
//               buildWhiteKey(color: Colors.white, soundNumber: 29),
//               buildWhiteKey(color: Colors.white, soundNumber: 31),
//               buildWhiteKey(color: Colors.white, soundNumber: 33),
//               buildWhiteKey(color: Colors.white, soundNumber: 35),
//             ]),
//             Positioned(
//                 left: 0.0,
//                 right: 0.0,
//                 bottom: kbottomHeight,
//                 top: 0.0,
//                 child: Row(children: <Widget>[
//                   Container(width: kkeyWidth),
//                   buildBlackKey(color: Colors.black, soundNumber: 25),
//                   Container(width: kkeyWidth * 0.5),
//                   buildBlackKey(color: Colors.black, soundNumber: 27),
//                   Container(width: kkeyWidth * 2),
//                   buildBlackKey(color: Colors.black, soundNumber: 30),
//                   Container(width: kkeyWidth * 0.5),
//                   buildBlackKey(color: Colors.black, soundNumber: 32),
//                   Container(width: kkeyWidth * 0.5),
//                   buildBlackKey(color: Colors.black, soundNumber: 34),
//                   Container(width: kkeyWidth),
//                 ])),
//           ]),
//         ),
//       ],
//     ),
//   );
// }
// }
