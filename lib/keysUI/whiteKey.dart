import 'dart:math';

import 'package:flutter/material.dart';

import 'package:pianotrainer_app/sheetMusic/noteSF2Map.dart';

import 'buildWhiteKey.dart';

class Key extends StatefulWidget {
  @override
  KeyState createState() => KeyState();
}

class KeyState extends State<Key> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(1, 0, 1, 5.0),
        child: MaterialButton(
          color: Colors.white,
          onPressed: () {
            setState(() {
              pitchActive = SoundAssign(value: Random().nextInt(54) + 35);
              print(pitchActive);
              // print('new ' + soundNumber1.toString());
            });
          },
        ),
      ),
    );
  }
}

// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter/material.dart';
//
// class WhiteKey extends StatefulWidget {
//   final VoidCallback onPressed;
//   final Widget child;
//   final double width;
//   final double height;
//
//   WhiteKey(
//       {@required this.onPressed,
//       @required this.child,
//       this.width = 10.0,
//       this.height = 90.0});
//
//   @override
//   State<StatefulWidget> createState() => WhiteKeyState();
// }
//
// class WhiteKeyState extends State<WhiteKey> {
//   String imagePath = "assets/images/wku5.svg";
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTapDown: (tap) {
//         setState(() {
//           imagePath = "assets/images/wkd4.svg";
//         });
//         widget.onPressed();
//       },
//       onTapCancel: () {
//         setState(() {
//           imagePath = "assets/images/wku5.svg";
//         });
//       },
//       onTapUp: (TapUpDetails tapUpDetails) {
//         setState(() {
//           imagePath = "assets/images/wku5.svg";
//         });
//       },
//       child: SvgPicture.asset(
//         '$imagePath',
//         fit: BoxFit.fill,
//         allowDrawingOutsideViewBox: true,
//         width: 500,
//       ),
//     );
//   }
// }
