// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter/material.dart';
//
// class BlackKey extends StatefulWidget {
//   final VoidCallback onPressed;
//   final Widget child;
//   final double width;
//   final double height;
//
//   BlackKey(
//       {@required this.onPressed,
//       @required this.child,
//       this.width = 10.0,
//       this.height = 90.0});
//
//   @override
//   State<StatefulWidget> createState() => BlackKeyState();
// }
//
// class BlackKeyState extends State<BlackKey> {
//   String imagePath = "assets/images/bku9.svg";
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTapDown: (tap) {
//         setState(() {
//           imagePath = "assets/images/bkd9.svg";
//         });
//         widget.onPressed();
//       },
//       onTapCancel: () {
//         setState(() {
//           imagePath = "assets/images/bku9.svg";
//         });
//       },
//       onTapUp: (TapUpDetails tapUpDetails) {
//         setState(() {
//           imagePath = "assets/images/bku9.svg";
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
