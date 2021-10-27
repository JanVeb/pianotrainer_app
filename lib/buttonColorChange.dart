//Not in use, change color of a button

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State {
  bool _winner = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('widget.title'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Press the button:',
            ),
            GestureDetector(
              onTapDown: (_) {
                setState(() {});
                _winner ? _winner = false : _winner = true;
              },
              child: ColorButton(
                isWinner: _winner,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ColorButton extends StatefulWidget {
  const ColorButton({
    Key key,
    @required this.isWinner,
  }) : super(key: key);

  final bool isWinner;

  @override
  _ColorButtonState createState() => _ColorButtonState();
}

class _ColorButtonState extends State<ColorButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          isPressed = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: 60.0,
        width: MediaQuery.of(context).size.width * 0.9,
        color: isPressed
            ? widget.isWinner
                ? Colors.green
                : Colors.red
            : Colors.grey[800],
      ),
    );
  }
}
