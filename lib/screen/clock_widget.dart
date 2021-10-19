import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Clock extends StatefulWidget {
  Clock({Key? key}) : super(key: key);

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  DateTime dateTime = DateTime.now();
  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timeDilationTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 0),
                      blurRadius: 64,
                      color: Colors.black.withOpacity(0.14)),
                ]),
            child: Transform.rotate(
                angle: -pi / 2,
                child: CustomPaint(painter: ClockPainter(dateTime))),
          )),
    );
  }

  var _timeDilationTimer = Timer.periodic(Duration(seconds: 1), (timer) {});
  void _startTimer() {
    _timeDilationTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        dateTime = DateTime.now();
      });
    });
  }
}

class ClockPainter extends CustomPainter {
  final DateTime dateTime;

  ClockPainter(this.dateTime);
  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.width / 2;

    double secondX =
        centerX + size.width * 0.4 * cos((dateTime.second * 6) * pi / 180);
    double secondY =
        centerY + size.width * 0.4 * sin((dateTime.second * 6) * pi / 180);
    // size.width * 0.4 is the size of our seconds line;
    // we * 6 seconds because the 360/ 60 = 6

    double minuteX =
        centerX + size.width * 0.35 * cos((dateTime.minute * 6) * pi / 180);
    double minuteY =
        centerY + size.width * 0.35 * sin((dateTime.minute * 6) * pi / 180);
    double hoursX = centerX +
        size.width *
            0.3 *
            cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    double hoursY = centerY +
        size.width *
            0.3 *
            sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    // 30 because 360/12 =30;
    // dateTime.minute * 0.5 because we go forward than clock each minute
    Offset center = Offset(centerX, centerY);
    Paint dotPainter = Paint()..color = Color(0xffe7e7e7);
    canvas.drawCircle(center, 24, dotPainter);
    canvas.drawCircle(center, 23, Paint()..color = Colors.white);
    // secondLine
    canvas.drawLine(
        center,
        Offset(secondX, secondY),
        Paint()
          ..color = Colors.orangeAccent
          ..style = PaintingStyle.stroke
          ..strokeWidth = 4);
    //hour line
    canvas.drawLine(
        center,
        Offset(hoursX, hoursY),
        Paint()
          ..color = Colors.black26
          ..style = PaintingStyle.stroke
          ..strokeWidth = 10);
    canvas.drawLine(
        center,
        Offset(minuteX, minuteY),
        Paint()
          ..color = Colors.black26
          ..style = PaintingStyle.stroke
          ..strokeWidth = 6);

    canvas.drawCircle(center, 10, dotPainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
