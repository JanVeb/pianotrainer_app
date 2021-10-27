import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_midi/flutter_midi.dart';
import 'package:flutter/foundation.dart';
import 'package:pianotrainer_app/keysUI/88%20key.dart';

import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

import 'sheetMusic/sheetMusic.dart';
import 'spacedRepetition/quiz.dart';

var expTime = quizBrain.products.first['time'];
var quiz = '';

class KeyPage extends StatefulWidget {
  @override
  _KeyPageState createState() => _KeyPageState();
}

class _KeyPageState extends State<KeyPage> {
  dynamic _flutterMidi = FlutterMidi(); //TODO 1 check TODO 2
  // dynamic _MidiParser = MidiParser; // ???

  @override
  void initState() {
    if (!kIsWeb) {
      load(_value);
      //  load(_value1);
    } else {
      // FlutterMidi.prepare(
      //     sf2:
      //         null); //TODO 2 check what to do here with static issue Original line was:
      _flutterMidi.prepare(sf2: null);
      // _MidiParser.prepare(mid: null); // ???
      // rootBundle.load("assets/Piano1.sf2").then((sf2) {
      //   FlutterMidi.prepare(sf2: sf2, name: "Piano1.sf2");
      // });
    }
    super.initState();
  }

  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/collection.xml');
  }

  void load(String asset) async {
    print("Loading File...");
    FlutterMidi.unmute();
    ByteData _byte = await rootBundle.load(asset);
    // 'assets/sf2/SmallTimGM6mb.sf2';
    // 'assets/sf2/Piano1.sf2';
    FlutterMidi.prepare(sf2: _byte, name: _value.replaceAll("assets/sf2/", ""));
    // _MidiParser.prepare(
    //     mid: _byte, name: _value1.replaceAll("assets/", "")); // ???
  }

  String _value = "assets/sf2/SmallTimGM6mb.sf2";
  // String _value1 = "assets/MIDIsample.mid"; // ???

  @override
  Widget build(BuildContext context) {
    return Key88();
    // Container(
    //     color: Colors.white,
    //     child: SheetMusicNew(keyHeight: 200, keyWidth: 300));
  }
}
