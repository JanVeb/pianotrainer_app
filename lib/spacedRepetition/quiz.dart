import 'package:flutter/material.dart';

import 'hearingToneTrainer.dart';
import 'spacedRepetition.dart';
import 'hearingToneDeck.dart';

QuizBrain quizBrain = QuizBrain();

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

SR sR = SR();

ToneBank toneBank = ToneBank();
// calling on SR from spacedRepetition through quiz.dart SR sR = SR(); otherwise have Static issue

// Expanded checkAnswer({Color color}) {
//   return Expanded(
//     child: MaterialButton(
//       //height: 120,
//       //height: double.infinity,
//       color: color,
//       textColor: Colors.white,
//       padding: EdgeInsets.all(1.0),
//       onPressed: () {
//         //playSound(soundNumber);
//         if (quizBrain.min() == userAnswer) {
//           quizBrain.products
//               .where((x) => x["id"] == 24)
//               .first["epochTime"] = (quizBrain
//                   .products.first['epochTime'] *
//               1.1); //TODO managed to update epochTime, now need to progres further in implementing SR, instead of multiplying epochTime i should multiply intervall and then add it to epochTime
//           print(quizBrain.products.first['epochTime']);
//           print('corect');
//         } else {
//           print('wrong');
//         }
//       },
//       child: Text(
//         'Check',
//       ),
//     ),
//   );
// }
