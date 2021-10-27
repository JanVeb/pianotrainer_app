import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_midi/flutter_midi.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:pianotrainer_app/sheetMusic/noteSF2Map.dart';
import 'package:pianotrainer_app/sheetMusic/sheetMusic.dart';
import 'package:pianotrainer_app/spacedRepetition/quiz.dart';
import 'package:pianotrainer_app/key_page.dart';

import 'dart:math';
import 'dart:io';

import '../midiParse.dart';
import 'newSoundKey.dart';
import 'reviewKey.dart';
import 'checkAnswerKey.dart';
import 'buildWhiteKey.dart';
import 'buildBlackKey.dart';

class Key88 extends StatefulWidget {
  @override
  _Key88State createState() => _Key88State();
}

class _Key88State extends State<Key88> {
  //int max = 70;
  //int soundNumber1 = Random().nextInt(30) + 30;

  Widget ReviewKey1({double blackKeyWidth, double keyHeight}) {
    return Expanded(
      child: MaterialButton(
        height: keyHeight,
        //width: blackKeyWidth,
        color: Colors.green,
        textColor: Colors.white,
        padding: EdgeInsets.all(1.0),
        onPressed: () {
          if (ReviewKey.currentQuestion == null) {
            setState(() {
              NewSoundKey.currentQuestionNew = null;
              ReviewKey.currentQuestion = quizBrain.expired();
              FlutterMidi.playMidiNote(midi: ReviewKey.currentQuestion);
              pitchActive = SoundAssign(value: ReviewKey.currentQuestion);
            });
          } else {
            FlutterMidi.playMidiNote(
                midi: ReviewKey
                    .currentQuestion); // when calling multiple times to quizBrain.expired(), result gets mixed up
            setState(() {
              pitchActive = SoundAssign(value: ReviewKey.currentQuestion);
              print(pitchActive);
            });
          }
        },
        child: RotatedBox(
          quarterTurns: 3,
          child: Text(
            'Play/Replay',
          ),
        ),
      ),
    );
  }

  Widget NewSoundKey1({double blackKeyWidth, double keyHeight}) {
    return Expanded(
      child: MaterialButton(
        //height: 10,
        //width: blackKeyWidth,
        color: Colors.lightGreenAccent,
        textColor: Colors.white,
        padding: EdgeInsets.all(1.0),
        onPressed: () {
          // SoundAssign;
          //print(SoundAssign(value: 23));
          if (NewSoundKey.currentQuestionNew == null) {
            setState(() {
              ReviewKey.currentQuestion = null;
              NewSoundKey.currentQuestionNew = quizBrain.newSound();
              pitchActive = SoundAssign(value: NewSoundKey.currentQuestionNew);

              FlutterMidi.playMidiNote(midi: NewSoundKey.currentQuestionNew);
            });
            print(pitchActive);
          } else {
            FlutterMidi.playMidiNote(
                midi: NewSoundKey
                    .currentQuestionNew); // when calling multiple times to quizBrain.Expired(), result gets mixed up
            setState(() {
              pitchActive = SoundAssign(value: NewSoundKey.currentQuestionNew);
            });
            print(pitchActive);
          }
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: RadialGradient(
                      center: Alignment(0, -0.2),
                      colors: [
                        Colors.blue[200],
                        Colors.blue[400],
                        Colors.blue[500],
                        Colors.blue[600],
                        Colors.blue[700],
                        Colors.blue[800]
                      ],
                      radius: 1),
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38,
                        offset: Offset(5, 5),
                        spreadRadius: 1,
                        blurRadius: 10)
                  ]),
            ),
            RotatedBox(
              quarterTurns: 3,
              child: Text(
                'New Sound',
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget test({double blackKeyWidth, double keyHeight}) {
  //   return Expanded(
  //     child: GestureDetector(
  //       onLongPress: () {
  //         FlutterMidi.playMidiNote(midi: 106);
  //       },
  //       onTapCancel: () {
  //         setState(() {});
  //       },
  //       onTapUp: (TapUpDetails tapUpDetails) {
  //         setState(() {});
  //       },
  //     ),
  //   );
  // }

  Widget test({double blackKeyWidth, double keyHeight}) {
    Random random = new Random();
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: MaterialButton(
          height: keyHeight,
          //width: blackKeyWidth,
          color: Colors.white,
          onPressed: () {
            parse();
            setState(() {
              pitchActive1 = random.nextInt(90) + 10.toDouble();
              pitchActive2 = random.nextInt(90) + 10.toDouble();
              pitchActive3 = random.nextInt(90) + 10.toDouble();
              pitchActive4 = random.nextInt(90) + 10.toDouble();
              pitchActive5 = random.nextInt(90) + 10.toDouble();
              pitchActive6 = random.nextInt(90) + 10.toDouble();
              pitchActive7 = random.nextInt(90) + 10.toDouble();
              pitchActive8 = random.nextInt(90) + 10.toDouble();
              pitchActive9 = random.nextInt(90) + 10.toDouble();
              // print('new ' + soundNumber1.toString());
            });
          },
        ),
      ),
    );
  }

  String dropdownValue = '60';

  Widget Menu() {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.menu),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['48', '60', '72', '88']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        //double screenWidth = MediaQuery.of(context).size.width;
        double screenHeight = MediaQuery.of(context).size.height;
        double whiteKeyWidth = MediaQuery.of(context).size.width /
            21; //this is the width of white key
        double whiteKeyHeight = screenHeight /
            3; // height of white keys //TODO 2 check as well key height difrence in iOS and Android, seems similar issue as with TODO 1
        double blackKeyHeight = whiteKeyHeight / 1.618;
        double kbottomHeight = blackKeyHeight / 1.7; // height of black keys
        double blackKeyWidthCalc = whiteKeyWidth / 1.618;
        return Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Expanded(
            //     child: Stack(children: <Widget>[
            //   Row(
            //       crossAxisAlignment: CrossAxisAlignment.stretch,
            //       children: <Widget>[
            //       ])
            // ])),
            Expanded(
              child: Stack(children: <Widget>[
                Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: <
                    Widget>[
                  Container(
                    color: Colors.white,
                    width: whiteKeyWidth * 6,
                    child: SheetMusicNew(
                      keyWidth: whiteKeyWidth * 5,
                      keyHeight: whiteKeyHeight / 1.09,
                      child: Menu(),
                    ),
                  ),
                  //- 18), //TODO 1 need to add spacing for iPhone, need to check how to solve this, or made two separate layouts, one for ios another for android, or could control this through variable that has value 0 on android and positive value on iOS
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 84),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 86),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 88),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 89),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 91),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 93),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 95),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 96),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 98),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 100),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 101),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 103),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 105),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 107),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 108),
                ]),
                Positioned(
                    left: 0.0,
                    right: 0.0,
                    bottom: kbottomHeight,
                    top: 0.0,
                    child:
                        Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
                      Container(width: (whiteKeyWidth * 6)),
                      //TODO 1 - 27),
                      Container(width: whiteKeyWidth * 0.5),
                      BuildBlackKey(
                          blackKeyWidth: blackKeyWidthCalc,
                          keyHeight: blackKeyHeight,
                          soundNumber: 85),
                      BuildBlackKey(
                          blackKeyWidth: blackKeyWidthCalc,
                          keyHeight: blackKeyHeight,
                          soundNumber: 87),
                      Container(width: whiteKeyWidth),
                      BuildBlackKey(
                          blackKeyWidth: blackKeyWidthCalc,
                          keyHeight: blackKeyHeight,
                          soundNumber: 90),
                      BuildBlackKey(
                          blackKeyWidth: blackKeyWidthCalc,
                          keyHeight: blackKeyHeight,
                          soundNumber: 92),
                      BuildBlackKey(
                          blackKeyWidth: blackKeyWidthCalc,
                          keyHeight: blackKeyHeight,
                          soundNumber: 94),
                      Container(width: whiteKeyWidth * 0.5),
                      Container(width: whiteKeyWidth * 0.5),
                      BuildBlackKey(
                          blackKeyWidth: blackKeyWidthCalc,
                          keyHeight: blackKeyHeight,
                          soundNumber: 97),
                      BuildBlackKey(
                          blackKeyWidth: blackKeyWidthCalc,
                          keyHeight: blackKeyHeight,
                          soundNumber: 99),
                      Container(width: whiteKeyWidth * 1),
                      BuildBlackKey(
                          blackKeyWidth: blackKeyWidthCalc,
                          keyHeight: blackKeyHeight,
                          soundNumber: 102),
                      BuildBlackKey(
                          blackKeyWidth: blackKeyWidthCalc,
                          keyHeight: blackKeyHeight,
                          soundNumber: 104),
                      BuildBlackKey(
                          blackKeyWidth: blackKeyWidthCalc,
                          keyHeight: blackKeyHeight,
                          soundNumber: 106),
                      Container(width: (whiteKeyWidth * 1.5)),
                      //TODO 1 - 5),
                    ])),
              ]),
            ),
            Expanded(
              child: Stack(children: <Widget>[
                Row(children: <Widget>[
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 48),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 50),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 52),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 53),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 55),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 57),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 59),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 60),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 62),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 64),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 65),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 67),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 69),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 71),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 72),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 74),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 76),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 77),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 79),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 81),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 83),
                ]),
                Positioned(
                    left: 0.0,
                    right: 0.0,
                    bottom: kbottomHeight,
                    top: 0.0,
                    child:
                        Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
                      Container(width: whiteKeyWidth * 0.5),
                      BuildBlackKey(
                          blackKeyWidth: blackKeyWidthCalc,
                          keyHeight: blackKeyHeight,
                          soundNumber: 49),
                      BuildBlackKey(
                          blackKeyWidth: blackKeyWidthCalc,
                          keyHeight: blackKeyHeight,
                          soundNumber: 51),
                      Container(width: whiteKeyWidth),
                      BuildBlackKey(
                          blackKeyWidth: blackKeyWidthCalc,
                          keyHeight: blackKeyHeight,
                          soundNumber: 54),
                      BuildBlackKey(
                          blackKeyWidth: blackKeyWidthCalc,
                          keyHeight: blackKeyHeight,
                          soundNumber: 56),
                      BuildBlackKey(
                          blackKeyWidth: blackKeyWidthCalc,
                          keyHeight: blackKeyHeight,
                          soundNumber: 58),
                      Container(width: whiteKeyWidth * 0.5),
                      Container(width: whiteKeyWidth * 0.5),
                      BuildBlackKey(
                          blackKeyWidth: blackKeyWidthCalc,
                          keyHeight: blackKeyHeight,
                          soundNumber: 61),
                      BuildBlackKey(
                          blackKeyWidth: blackKeyWidthCalc,
                          keyHeight: blackKeyHeight,
                          soundNumber: 63),
                      Container(width: whiteKeyWidth),
                      BuildBlackKey(
                          blackKeyWidth: blackKeyWidthCalc,
                          keyHeight: blackKeyHeight,
                          soundNumber: 66),
                      BuildBlackKey(
                          blackKeyWidth: blackKeyWidthCalc,
                          keyHeight: blackKeyHeight,
                          soundNumber: 68),
                      BuildBlackKey(
                          blackKeyWidth: blackKeyWidthCalc,
                          keyHeight: blackKeyHeight,
                          soundNumber: 70),
                      Container(width: whiteKeyWidth * 0.5),
                      Container(width: whiteKeyWidth * 0.5),
                      BuildBlackKey(
                          blackKeyWidth: blackKeyWidthCalc,
                          keyHeight: blackKeyHeight,
                          soundNumber: 73),
                      BuildBlackKey(
                          blackKeyWidth: blackKeyWidthCalc,
                          keyHeight: blackKeyHeight,
                          soundNumber: 75),
                      Container(width: whiteKeyWidth),
                      BuildBlackKey(
                          blackKeyWidth: blackKeyWidthCalc,
                          keyHeight: blackKeyHeight,
                          soundNumber: 78),
                      BuildBlackKey(
                          blackKeyWidth: blackKeyWidthCalc,
                          keyHeight: blackKeyHeight,
                          soundNumber: 80),
                      BuildBlackKey(
                          blackKeyWidth: blackKeyWidthCalc,
                          keyHeight: blackKeyHeight,
                          soundNumber: 82),
                      Container(width: whiteKeyWidth * 0.5),
                    ])),
              ]),
            ),
            Expanded(
              child: Stack(children: <Widget>[
                Row(children: <Widget>[
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 21),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 23),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 24),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 26),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 28),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 29),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 31),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 33),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 35),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 36),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 38),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 40),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 41),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 43),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 45),
                  BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 47),
                  Container(
                    width: (whiteKeyWidth * 1),
                  ), //TODO 1 - 22),
                  NewSoundKey1(
                      blackKeyWidth: blackKeyWidthCalc,
                      keyHeight: whiteKeyHeight),
                  ReviewKey1(
                      blackKeyWidth: blackKeyWidthCalc,
                      keyHeight: whiteKeyHeight),
                  // bu1(
                  //   keyHeight: whiteKeyHeight,
                  // ),
                  CheckAnswerKey(
                      blackKeyWidth: blackKeyWidthCalc,
                      keyHeight: whiteKeyHeight),
                  test(
                      blackKeyWidth: blackKeyWidthCalc,
                      keyHeight: whiteKeyHeight),
                ]),
                Positioned(
                    left: 0.0,
                    right: 0.0,
                    bottom: kbottomHeight,
                    top: 0.0,
                    child:
                        Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
                      Container(width: whiteKeyWidth * 0.5),
                      BuildBlackKey(
                          blackKeyWidth: blackKeyWidthCalc,
                          keyHeight: blackKeyHeight,
                          soundNumber: 22),
                      Container(width: whiteKeyWidth * 0.5),
                      Container(width: whiteKeyWidth * 0.5),
                      BuildBlackKey(
                          blackKeyWidth: blackKeyWidthCalc,
                          keyHeight: blackKeyHeight,
                          soundNumber: 25),
                      BuildBlackKey(
                          blackKeyWidth: blackKeyWidthCalc,
                          keyHeight: blackKeyHeight,
                          soundNumber: 27),
                      Container(width: whiteKeyWidth),
                      BuildBlackKey(
                          blackKeyWidth: blackKeyWidthCalc,
                          keyHeight: blackKeyHeight,
                          soundNumber: 30),
                      BuildBlackKey(
                          blackKeyWidth: blackKeyWidthCalc,
                          keyHeight: blackKeyHeight,
                          soundNumber: 32),
                      BuildBlackKey(
                          blackKeyWidth: blackKeyWidthCalc,
                          keyHeight: blackKeyHeight,
                          soundNumber: 34),
                      Container(width: whiteKeyWidth * 0.5),
                      Container(width: whiteKeyWidth * 0.5),
                      BuildBlackKey(
                          blackKeyWidth: blackKeyWidthCalc,
                          keyHeight: blackKeyHeight,
                          soundNumber: 37),
                      BuildBlackKey(
                          blackKeyWidth: blackKeyWidthCalc,
                          keyHeight: blackKeyHeight,
                          soundNumber: 39),
                      Container(width: whiteKeyWidth),
                      BuildBlackKey(
                          blackKeyWidth: blackKeyWidthCalc,
                          keyHeight: blackKeyHeight,
                          soundNumber: 42),
                      BuildBlackKey(
                          blackKeyWidth: blackKeyWidthCalc,
                          keyHeight: blackKeyHeight,
                          soundNumber: 44),
                      BuildBlackKey(
                          blackKeyWidth: blackKeyWidthCalc,
                          keyHeight: blackKeyHeight,
                          soundNumber: 46),
                      Container(width: (whiteKeyWidth * 0.5)),
                      Container(width: (whiteKeyWidth * 5)), //TODO 1 - 22),
                    ])),
              ]),
            ),
          ],
        );
      }),
    );
  }
}

// @override
// Widget build(BuildContext context) {
//   return SafeArea(
// child: new LayoutBuilder(
// builder: (BuildContext context, BoxConstraints constraints) {
// //double screenWidth = MediaQuery.of(context).size.width;
// double screenHeight = MediaQuery.of(context).size.height;
// double whiteKeyWidth = MediaQuery.of(context).size.width /
// 21; //this is the width of white key
// double whiteKeyHeight = screenHeight /
// 3; // height of white keys //TODO 2 check as well key height difrence in iOS and Android, seems similar issue as with TODO 1
// double blackKeyHeight = whiteKeyHeight / 1.618;
// double kbottomHeight = blackKeyHeight / 1.618; // height of black keys
// double blackKeyWidthCalc = whiteKeyWidth / 1.618;
// return Column(
// mainAxisSize: MainAxisSize.max,
// crossAxisAlignment: CrossAxisAlignment.stretch,
// children: [
// // Expanded(
// //     child: Stack(children: <Widget>[
// //   Row(
// //       crossAxisAlignment: CrossAxisAlignment.stretch,
// //       children: <Widget>[
// //         svgTest(),
// //       ])
// // ])),
// Expanded(
// child: Stack(children: <Widget>[
// Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: <
// Widget>[
// menu(),
// Container(
// width: (whiteKeyWidth *
// 3)), //- 18), //TODO 1 need to add spacing for iPhone, need to check how to solve this, or made two separate layouts, one for ios another for android, or could control this through variable that has value 0 on android and positive value on iOS
// sheetMusic(
// keyHeight: whiteKeyHeight / 2,
// whiteKeyWidth: whiteKeyWidth),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 84),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 86),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 88),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 89),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 91),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 93),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 95),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 96),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 98),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 100),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 101),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 103),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 105),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 107),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 108),
// ]),
// Positioned(
// left: 0.0,
// right: 0.0,
// bottom: kbottomHeight,
// top: 0.0,
// child:
// Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
// Container(width: (whiteKeyWidth * 6)), //TODO 1 - 27),
// Container(width: whiteKeyWidth * 0.5),
// BuildBlackKey(
// blackKeyWidth: blackKeyWidthCalc,
// keyHeight: blackKeyHeight,
// soundNumber: 85),
// BuildBlackKey(
// blackKeyWidth: blackKeyWidthCalc,
// keyHeight: blackKeyHeight,
// soundNumber: 87),
// Container(width: whiteKeyWidth),
// BuildBlackKey(
// blackKeyWidth: blackKeyWidthCalc,
// keyHeight: blackKeyHeight,
// soundNumber: 90),
// BuildBlackKey(
// blackKeyWidth: blackKeyWidthCalc,
// keyHeight: blackKeyHeight,
// soundNumber: 92),
// BuildBlackKey(
// blackKeyWidth: blackKeyWidthCalc,
// keyHeight: blackKeyHeight,
// soundNumber: 94),
// Container(width: whiteKeyWidth * 0.5),
// Container(width: whiteKeyWidth * 0.5),
// BuildBlackKey(
// blackKeyWidth: blackKeyWidthCalc,
// keyHeight: blackKeyHeight,
// soundNumber: 97),
// BuildBlackKey(
// blackKeyWidth: blackKeyWidthCalc,
// keyHeight: blackKeyHeight,
// soundNumber: 99),
// Container(width: whiteKeyWidth * 1),
// BuildBlackKey(
// blackKeyWidth: blackKeyWidthCalc,
// keyHeight: blackKeyHeight,
// soundNumber: 102),
// BuildBlackKey(
// blackKeyWidth: blackKeyWidthCalc,
// keyHeight: blackKeyHeight,
// soundNumber: 104),
// BuildBlackKey(
// blackKeyWidth: blackKeyWidthCalc,
// keyHeight: blackKeyHeight,
// soundNumber: 106),
// Container(width: (whiteKeyWidth * 1.5)), //TODO 1 - 5),
// ])),
// ]),
// ),
// Expanded(
// child: Stack(children: <Widget>[
// Row(children: <Widget>[
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 48),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 50),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 52),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 53),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 55),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 57),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 59),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 60),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 62),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 64),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 65),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 67),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 69),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 71),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 72),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 74),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 76),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 77),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 79),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 81),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 83),
// ]),
// Positioned(
// left: 0.0,
// right: 0.0,
// bottom: kbottomHeight,
// top: 0.0,
// child:
// Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
// Container(width: whiteKeyWidth * 0.5),
// BuildBlackKey(
// blackKeyWidth: blackKeyWidthCalc,
// keyHeight: blackKeyHeight,
// soundNumber: 49),
// BuildBlackKey(
// blackKeyWidth: blackKeyWidthCalc,
// keyHeight: blackKeyHeight,
// soundNumber: 51),
// Container(width: whiteKeyWidth),
// BuildBlackKey(
// blackKeyWidth: blackKeyWidthCalc,
// keyHeight: blackKeyHeight,
// soundNumber: 54),
// BuildBlackKey(
// blackKeyWidth: blackKeyWidthCalc,
// keyHeight: blackKeyHeight,
// soundNumber: 56),
// BuildBlackKey(
// blackKeyWidth: blackKeyWidthCalc,
// keyHeight: blackKeyHeight,
// soundNumber: 58),
// Container(width: whiteKeyWidth * 0.5),
// Container(width: whiteKeyWidth * 0.5),
// BuildBlackKey(
// blackKeyWidth: blackKeyWidthCalc,
// keyHeight: blackKeyHeight,
// soundNumber: 61),
// BuildBlackKey(
// blackKeyWidth: blackKeyWidthCalc,
// keyHeight: blackKeyHeight,
// soundNumber: 63),
// Container(width: whiteKeyWidth),
// BuildBlackKey(
// blackKeyWidth: blackKeyWidthCalc,
// keyHeight: blackKeyHeight,
// soundNumber: 66),
// BuildBlackKey(
// blackKeyWidth: blackKeyWidthCalc,
// keyHeight: blackKeyHeight,
// soundNumber: 68),
// BuildBlackKey(
// blackKeyWidth: blackKeyWidthCalc,
// keyHeight: blackKeyHeight,
// soundNumber: 70),
// Container(width: whiteKeyWidth * 0.5),
// Container(width: whiteKeyWidth * 0.5),
// BuildBlackKey(
// blackKeyWidth: blackKeyWidthCalc,
// keyHeight: blackKeyHeight,
// soundNumber: 73),
// BuildBlackKey(
// blackKeyWidth: blackKeyWidthCalc,
// keyHeight: blackKeyHeight,
// soundNumber: 75),
// Container(width: whiteKeyWidth),
// BuildBlackKey(
// blackKeyWidth: blackKeyWidthCalc,
// keyHeight: blackKeyHeight,
// soundNumber: 78),
// BuildBlackKey(
// blackKeyWidth: blackKeyWidthCalc,
// keyHeight: blackKeyHeight,
// soundNumber: 80),
// BuildBlackKey(
// blackKeyWidth: blackKeyWidthCalc,
// keyHeight: blackKeyHeight,
// soundNumber: 82),
// Container(width: whiteKeyWidth * 0.5),
// ])),
// ]),
// ),
// Expanded(
// child: Stack(children: <Widget>[
// Row(children: <Widget>[
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 21),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 23),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 24),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 26),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 28),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 29),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 31),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 33),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 35),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 36),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 38),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 40),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 41),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 43),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 45),
// BuildWhiteKey(keyHeight: whiteKeyHeight, soundNumber: 47),
// Container(width: (whiteKeyWidth * 3)), //TODO 1 - 22),
// reviewKey(
// blackKeyWidth: blackKeyWidthCalc,
// keyHeight: whiteKeyHeight),
// // bu1(
// //   keyHeight: whiteKeyHeight,
// // ),
// CheckAnswerKey(
// blackKeyWidth: blackKeyWidthCalc,
// keyHeight: whiteKeyHeight),
// ]),
// Positioned(
// left: 0.0,
// right: 0.0,
// bottom: kbottomHeight,
// top: 0.0,
// child:
// Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
// Container(width: whiteKeyWidth * 0.5),
// BuildBlackKey(
// blackKeyWidth: blackKeyWidthCalc,
// keyHeight: blackKeyHeight,
// soundNumber: 22),
// Container(width: whiteKeyWidth * 0.5),
// Container(width: whiteKeyWidth * 0.5),
// BuildBlackKey(
// blackKeyWidth: blackKeyWidthCalc,
// keyHeight: blackKeyHeight,
// soundNumber: 25),
// BuildBlackKey(
// blackKeyWidth: blackKeyWidthCalc,
// keyHeight: blackKeyHeight,
// soundNumber: 27),
// Container(width: whiteKeyWidth),
// BuildBlackKey(
// blackKeyWidth: blackKeyWidthCalc,
// keyHeight: blackKeyHeight,
// soundNumber: 30),
// BuildBlackKey(
// blackKeyWidth: blackKeyWidthCalc,
// keyHeight: blackKeyHeight,
// soundNumber: 32),
// BuildBlackKey(
// blackKeyWidth: blackKeyWidthCalc,
// keyHeight: blackKeyHeight,
// soundNumber: 34),
// Container(width: whiteKeyWidth * 0.5),
// Container(width: whiteKeyWidth * 0.5),
// BuildBlackKey(
// blackKeyWidth: blackKeyWidthCalc,
// keyHeight: blackKeyHeight,
// soundNumber: 37),
// BuildBlackKey(
// blackKeyWidth: blackKeyWidthCalc,
// keyHeight: blackKeyHeight,
// soundNumber: 39),
// Container(width: whiteKeyWidth),
// BuildBlackKey(
// blackKeyWidth: blackKeyWidthCalc,
// keyHeight: blackKeyHeight,
// soundNumber: 42),
// BuildBlackKey(
// blackKeyWidth: blackKeyWidthCalc,
// keyHeight: blackKeyHeight,
// soundNumber: 44),
// BuildBlackKey(
// blackKeyWidth: blackKeyWidthCalc,
// keyHeight: blackKeyHeight,
// soundNumber: 46),
// Container(width: whiteKeyWidth * 0.5),
// Container(width: (whiteKeyWidth * 5)), //TODO 1 - 22),
// ])),
// ]),
// ),
// ],
// );
// }),
// );
