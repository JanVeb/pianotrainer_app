import 'package:pianotrainer_app/keysUI/newSoundKey.dart';
import 'package:pianotrainer_app/keysUI/reviewKey.dart';
import 'quiz.dart';

class SR {
  callInterval() {
    var today = new DateTime.now();
    var expire = today
        .add(new Duration(seconds: quizBrain.products.first['interval']))
        .toString();

    if (ReviewKey.currentQuestion == ReviewKey.userAnswer) {
//updates the time
      quizBrain.products
          .where((x) => x["id"] == quizBrain.expired())
          .first["time"] = expire; // setting next interval
      quizBrain.products
          .where((x) => x["id"] == quizBrain.expired())
          .first['interval'] = quizBrain.products
              .where((x) => x["id"] == quizBrain.expired())
              .first['interval'] *
          5;
    } else {
      quizBrain.products
          .where((x) => x["id"] == quizBrain.expired())
          .first["time"] = expire; // setting next interval
      quizBrain.products
          .where((x) => x["id"] == quizBrain.expired())
          .first['interval'] = 70;
    }
  }

  callIntervalNewSound() {
    //print(callIntervalNewSound());
    var today = new DateTime.now();
    var expire = today
        .add(new Duration(seconds: quizBrain.products.first['interval']))
        .toString();

    if (NewSoundKey.currentQuestionNew == NewSoundKey.userAnswerNew) {
//updates the time
      quizBrain.products
          .where((x) => x["id"] == quizBrain.newSound())
          .first["time"] = expire; // setting next interval
      quizBrain.products
          .where((x) => x["id"] == quizBrain.newSound())
          .first['interval'] = quizBrain.products
              .where((x) => x["id"] == quizBrain.newSound())
              .first['interval'] *
          5;
    } else {
      quizBrain.products
          .where((x) => x["id"] == quizBrain.newSound())
          .first["time"] = expire; // setting next interval
      quizBrain.products
          .where((x) => x["id"] == quizBrain.newSound())
          .first['interval'] = 70;
    }
  }
}

// if (currentQuestion == userAnswer) {
// //updates the time
// quizBrain.products
//     .where((x) => x["id"] == quizBrain.expired())
//     .first["time"] = today.add(new Duration(days: 50)).toString();
