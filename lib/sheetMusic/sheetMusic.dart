import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

double pitchActive1 = 100;
double pitchActive2 = 90;
double pitchActive3 = 80;
double pitchActive4 = 70;
double pitchActive5 = 60;
double pitchActive6 = 50;
double pitchActive7 = 40;
double pitchActive8 = 30;
double pitchActive9 = 20;

class SheetMusicNew extends StatefulWidget {
  final double keyHeight;
  final double keyWidth;

  SheetMusicNew(
      {@required this.keyHeight,
      @required this.keyWidth,
      Widget child,
      Canvas canvas,
      Size size});

  @override
  State<StatefulWidget> createState() => SheetMusicNewState();
}

class SheetMusicNewState extends State<SheetMusicNew> {
  String imagePath = "assets/images/MusicSheet1.svg";

  @override
  Widget build(BuildContext context, {Canvas canvas, Size size}) {
    return new LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return new ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            width: null,
            height: null,
            child: Stack(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/MusicSheetWB2.svg',
                      height: widget.keyHeight,
                      width: widget.keyWidth,
                      fit: BoxFit.fitWidth,
                      // allowDrawingOutsideViewBox: true,
                    ),
                    // SvgPicture.asset(
                    //   'assets/images/MusicSheet2.svg',
                    //   height: widget.keyHeight,
                    //   width: keyWidth,
                    //   fit: BoxFit.fitWidth,
                    //   // allowDrawingOutsideViewBox: true,
                    // ),
                    // SvgPicture.asset(
                    //   'assets/images/MusicSheet2.svg',
                    //   height: widget.keyHeight,
                    //   width: keyWidth,
                    //   fit: BoxFit.fitWidth,
                    //   // allowDrawingOutsideViewBox: true,
                    // ),
                    // SvgPicture.asset(
                    //   'assets/images/MusicSheet2.svg',
                    //   height: widget.keyHeight,
                    //   width: keyWidth,
                    //   fit: BoxFit.fitWidth,
                    //   // allowDrawingOutsideViewBox: true,
                    // ),
                  ],
                ),
              ),
              Positioned(
                left: 30.0,
                right: 0.0,
                bottom: 0,
                top: pitchActive1,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          SvgPicture.asset(
                            'assets/images/note1.svg',
                            height: widget.keyHeight - 120,
                            // fit: BoxFit.fitWidth,
                            // allowDrawingOutsideViewBox: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 50.0,
                right: 0.0,
                bottom: 0,
                top: pitchActive2,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          SvgPicture.asset(
                            'assets/images/note1.svg',
                            height: widget.keyHeight - 120,
                            // fit: BoxFit.fitWidth,
                            // allowDrawingOutsideViewBox: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 70.0,
                right: 0.0,
                bottom: 0,
                top: pitchActive3,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          SvgPicture.asset(
                            'assets/images/note1.svg',
                            height: widget.keyHeight - 120,
                            // fit: BoxFit.fitWidth,
                            // allowDrawingOutsideViewBox: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 90.0,
                right: 0.0,
                bottom: 0,
                top: pitchActive4,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          SvgPicture.asset(
                            'assets/images/note1.svg',
                            height: widget.keyHeight - 120,
                            // fit: BoxFit.fitWidth,
                            // allowDrawingOutsideViewBox: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 110.0,
                right: 0.0,
                bottom: 0,
                top: pitchActive5,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          SvgPicture.asset(
                            'assets/images/note1.svg',
                            height: widget.keyHeight - 120,
                            // fit: BoxFit.fitWidth,
                            // allowDrawingOutsideViewBox: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 130.0,
                right: 0.0,
                bottom: 0,
                top: pitchActive6,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          SvgPicture.asset(
                            'assets/images/note1.svg',
                            height: widget.keyHeight - 120,
                            // fit: BoxFit.fitWidth,
                            // allowDrawingOutsideViewBox: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 150.0,
                right: 0.0,
                bottom: 0,
                top: pitchActive7,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          SvgPicture.asset(
                            'assets/images/note1.svg',
                            height: widget.keyHeight - 120,
                            // fit: BoxFit.fitWidth,
                            // allowDrawingOutsideViewBox: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 170.0,
                right: 0.0,
                bottom: 0,
                top: pitchActive8,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          SvgPicture.asset(
                            'assets/images/note1.svg',
                            height: widget.keyHeight - 120,
                            // fit: BoxFit.fitWidth,
                            // allowDrawingOutsideViewBox: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 190.0,
                right: 0.0,
                bottom: 0,
                top: pitchActive9,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          SvgPicture.asset(
                            'assets/images/note1.svg',
                            height: widget.keyHeight - 120,
                            // fit: BoxFit.fitWidth,
                            // allowDrawingOutsideViewBox: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      );
    });
  }
}
