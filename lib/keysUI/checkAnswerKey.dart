import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/foundation.dart';

import '../spacedRepetition/quiz.dart';
import 'newSoundKey.dart';
import 'reviewKey.dart';

class CheckAnswerKey extends StatefulWidget {
  final double blackKeyWidth;
  final double keyHeight;

  CheckAnswerKey({
    @required this.blackKeyWidth,
    @required this.keyHeight,
  });

  @override
  State<StatefulWidget> createState() => CheckAnswerKeyState();
}

class CheckAnswerKeyState extends State<CheckAnswerKey> {
  String imagePath = "assets/images/wku5.svg";

  bool isWrong = false;
  bool isCorrect = false;

  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: GestureDetector(
          onTapDown: (_) {
            if (NewSoundKey.currentQuestionNew == NewSoundKey.userAnswerNew &&
                NewSoundKey.userAnswerNew != null) {
              sR.callIntervalNewSound(); // calling on SR from spacedRepetition through quiz.dart SR sR = SR(); otherwise have Static issue
              print('1corect');
              //FlutterMidi.playMidiNote(midi: quizBrain.Expired());
              setState(() {
                NewSoundKey.currentQuestionNew = null;
                //print(ReviewKey.currentQuestion);
                isCorrect = true;
                isWrong = true;
              });
            } else {
              if (NewSoundKey.currentQuestionNew != NewSoundKey.userAnswerNew) {
                setState(() {
                  //print(ReviewKey.currentQuestion);
                  isWrong = true;
                });
                print('1wrong');
              } else {
                if (ReviewKey.currentQuestion == ReviewKey.userAnswer &&
                    ReviewKey.userAnswer != null) {
                  sR.callInterval(); // calling on SR from spacedRepetition through quiz.dart SR sR = SR(); otherwise have Static issue
                  print('2corect');
                  //FlutterMidi.playMidiNote(midi: quizBrain.Expired());
                  setState(() {
                    ReviewKey.currentQuestion = null;
                    //print(ReviewKey.currentQuestion);
                    isCorrect = true;
                    isWrong = true;
                  });
                } else {
                  setState(() {
                    //print(ReviewKey.currentQuestion);
                    isWrong = true;
                  });
                  print('2wrong');
                }
              }
            }
          },
          // setState(() {
          //   isPressed = true;
          // });

          onTapUp: (_) async {
            await Future.delayed(Duration(milliseconds: 1000));
            setState(() {
              isCorrect = false;
              isWrong = false;
            });
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 30),
            height: widget.keyHeight,
            width: widget.blackKeyWidth,
            color: isWrong
                ? isCorrect
                    ? Colors.green
                    : Colors.red
                : Colors.grey[800],
            child: RotatedBox(
              quarterTurns: 3,
              child: Padding(
                padding:
                    EdgeInsets.fromLTRB(0, (widget.blackKeyWidth / 3), 0, 0),
                child: Text(
                  'Check/Next',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

// bool isWrong = false;
// bool isCorrect = false;
//
// Widget checkAnswer() {
//   return Expanded(
//     child: Padding(
//       padding: const EdgeInsets.all(1),
//       child: GestureDetector(
//         onTapDown: (_) {
//           if (currentQuestion == userAnswer && userAnswer != null) {
//             sR.callInterval(); // calling on SR from spacedRepetition through quiz.dart SR sR = SR(); otherwise have Static issue
//             print('corect');
//             //FlutterMidi.playMidiNote(midi: quizBrain.Expired());
//             setState(() {
//               currentQuestion = quizBrain.Expired();
//               isCorrect = true;
//               isWrong = true;
//             });
//           } else {
//             setState(() {
//               isWrong = true;
//             });
//             print('wrong');
//           }
//         },
//         // setState(() {
//         //   isPressed = true;
//         // });
//
//         onTapUp: (_) async {
//           await Future.delayed(Duration(milliseconds: 1000));
//           setState(() {
//             isCorrect = false;
//             isWrong = false;
//           });
//         },
//         child: AnimatedContainer(
//           duration: Duration(milliseconds: 30),
//           height: widget.keyHeight,
//           width: widget.blackKeyWidth,
//           color: isWrong
//               ? isCorrect
//                   ? Colors.green
//                   : Colors.red
//               : Colors.grey[800],
//           child: RotatedBox(
//             quarterTurns: 3,
//             child: Padding(
//               padding:
//                   EdgeInsets.fromLTRB(0, (widget.blackKeyWidth / 3), 0, 0),
//               child: Text(
//                 'Check/Next',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }

// String imagePath = "assets/images/bku9.svg";
//
// Expanded keyImageChange(
//     {double blackKeyWidth, double keyHeight, int soundNumber}) {
//   return Expanded(
//     child: Container(
//       width: blackKeyWidth,
//       height: keyHeight,
//       child: GestureDetector(
//         onTapDown: (tap) {
//           parse();
//           // midiPlay(assets/MIDIsample.mid);
//           //print('assets/MIDIsample.mid');
//           setState(() {
//             imagePath = "assets/images/bkd9.svg";
//           });
//         },
//         onTapUp: (TapUpDetails tapUpDetails) {
//           setState(() {
//             imagePath = "assets/images/bku9.svg";
//           });
//         },
//         child: SvgPicture.asset(
//           '$imagePath',
//           fit: BoxFit.fill,
//           allowDrawingOutsideViewBox: true,
//           width: 20,
//         ),
//       ),
//     ),
//   );
// }

}
