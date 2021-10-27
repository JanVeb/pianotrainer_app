// building key in 88 key.dart so i can have notes presented on music sheet

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_midi/flutter_midi.dart';
import 'package:flutter/foundation.dart';

import '../spacedRepetition/quiz.dart';
import 'newSoundKey.dart';

class ReviewKey extends StatefulWidget {
  final double blackKeyWidth;
  final double keyHeight;

  static int currentQuestion; // updated when pressing play button
  static int userAnswer;

  ReviewKey({
    @required this.blackKeyWidth,
    @required this.keyHeight,
  });

  @override
  State<StatefulWidget> createState() => ReviewKeyState();
}

class ReviewKeyState extends State<ReviewKey> {
  String imagePath = "assets/images/wku5.svg";

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialButton(
        height: widget.keyHeight,
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
            });
          } else {
            FlutterMidi.playMidiNote(
                midi: ReviewKey
                    .currentQuestion); // when calling multiple times to quizBrain.expired(), result gets mixed up
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
}
