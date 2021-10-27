// building key in 88 key.dart so i can have notes presented on music sheet

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_midi/flutter_midi.dart';
import 'package:flutter/foundation.dart';
import 'package:pianotrainer_app/sheetMusic/noteSF2Map.dart';

import '../spacedRepetition/quiz.dart';
import 'buildWhiteKey.dart';
import 'reviewKey.dart';

class NewSoundKey extends StatefulWidget {
  final double blackKeyWidth;
  final double keyHeight;

  static int currentQuestionNew;
  static int userAnswerNew;

  NewSoundKey({
    @required this.blackKeyWidth,
    @required this.keyHeight,
  });

  @override
  State<StatefulWidget> createState() => NewSoundKeyState();
}

class NewSoundKeyState extends State<NewSoundKey> {
  String imagePath = "assets/images/wku5.svg";

  @override
  Widget build(BuildContext context) {
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

  // @override
  // Widget build(BuildContext context) {
  //   return Expanded(
  //     child: MaterialButton(
  //       height: widget.keyHeight,
  //       //width: blackKeyWidth,
  //       color: Colors.lightGreenAccent,
  //       textColor: Colors.white,
  //       padding: EdgeInsets.all(1.0),
  //       onPressed: () {
  //         if (newSoundKey.currentQuestion == 0) {
  //           FlutterMidi.playMidiNote(midi: newSoundKey.currentQuestion);
  //           setState(() {
  //             newSoundKey.currentQuestion = quizBrain.Expired();
  //           });
  //         } else {
  //           FlutterMidi.playMidiNote(
  //               midi: newSoundKey
  //                   .currentQuestion); // when calling multiple times to quizBrain.Expired(), result gets mixed up
  //         }
  //       },
  //       child: RotatedBox(
  //         quarterTurns: 3,
  //         child: Text(
  //           'New Sound',
  //         ),
  //       ),
  //     ),
  //   );
  // }

}
