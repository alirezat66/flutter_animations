import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedClock extends StatefulWidget {
  AnimatedClock({Key? key}) : super(key: key);

  @override
  _AnimatedClockState createState() => _AnimatedClockState();
}

class _AnimatedClockState extends State<AnimatedClock>
    with TickerProviderStateMixin {
  late AnimationController _animSecondController;
  late AnimationController _animMinuteController;
  late AnimationController _animHoureController;
  double secondAngle = 0;
  double minuteAngle = 0;
  double hourAngle = 0;
  @override
  void initState() {
    DateTime dateTime = DateTime.now();
    print(dateTime.hour);
    _animSecondController = new AnimationController(
      duration: Duration(seconds: 60),
      vsync: this,
    );
    _animMinuteController = new AnimationController(
      duration: Duration(seconds: 3600),
      vsync: this,
    );
    _animHoureController = new AnimationController(
      duration: Duration(seconds: 43200),
      vsync: this,
    );
    _animSecondController.forward(from: dateTime.second / 60);
    _animMinuteController.forward(from: dateTime.minute / 60);
    int hour = 0;
    if(dateTime.hour>12){
      hour = dateTime.hour - 12;
    }
    
    var hoursFrom = hour != 0
        ? hour / 12
        : ((dateTime.minute * 60 + dateTime.second) / 43200);
    _animHoureController.forward(from: hoursFrom);

    _animSecondController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animSecondController.repeat();
      }
    });
    _animMinuteController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animMinuteController.repeat();
      }
    });
    _animHoureController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animHoureController.repeat();
      }
    });
    _animSecondController.addListener(() {
      setState(() {
        secondAngle = _animSecondController.value * 360;
      });
    });
    _animMinuteController.addListener(() {
      setState(() {
        minuteAngle = _animMinuteController.value * 360;
      });
    });
    _animHoureController.addListener(() {
      setState(() {
        hourAngle = _animHoureController.value * 360;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AspectRatio(
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
              )),
          CustomPaint(
            painter: ClockFirstCenterPart(),
          ),
          Transform.rotate(
            angle: secondAngle / 180 * pi,
            origin: Offset(0, 0),
            child: Image.asset('images/second.png'),
          ),
          Transform.rotate(
            angle: minuteAngle / 180 * pi,
            origin: Offset(0, 0),
            child: Image.asset('images/minute.png'),
          ),
          Transform.rotate(
            angle: hourAngle / 180 * pi,
            origin: Offset(0, 0),
            child: Image.asset('images/hours.png'),
          ),
          CustomPaint(
            painter: ClockSecondCenterPart(),
          ),
        ],
      ),
    );
  }
}

class ClockSecondCenterPart extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.width / 2;

    // 30 because 360/12 =30;
    // dateTime.minute * 0.5 because we go forward than clock each minute
    Offset center = Offset(centerX, centerY);
    // secondLine
    /* canvas.drawLine(
        center,
        Offset(60, 120),
        Paint()
          ..color = Colors.orangeAccent
          ..style = PaintingStyle.stroke
          ..strokeWidth = 4);
    //hour line
    canvas.drawLine(
        center,
        Offset(70, 120),
        Paint()
          ..color = Colors.black26
          ..style = PaintingStyle.stroke
          ..strokeWidth = 10);
    canvas.drawLine(
        center,
        Offset(30, 170),
        Paint()
          ..color = Colors.black26
          ..style = PaintingStyle.stroke
          ..strokeWidth = 6);
     */
    Paint dotPainter = Paint()..color = Color(0xffe7e7e7);
    canvas.drawCircle(center, 10, dotPainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class ClockFirstCenterPart extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.width / 2;

    // 30 because 360/12 =30;
    // dateTime.minute * 0.5 because we go forward than clock each minute
    Offset center = Offset(centerX, centerY);
    // secondLine
    /* canvas.drawLine(
        center,
        Offset(60, 120),
        Paint()
          ..color = Colors.orangeAccent
          ..style = PaintingStyle.stroke
          ..strokeWidth = 4);
    //hour line
    canvas.drawLine(
        center,
        Offset(70, 120),
        Paint()
          ..color = Colors.black26
          ..style = PaintingStyle.stroke
          ..strokeWidth = 10);
    canvas.drawLine(
        center,
        Offset(30, 170),
        Paint()
          ..color = Colors.black26
          ..style = PaintingStyle.stroke
          ..strokeWidth = 6);
     */
    Paint dotPainter = Paint()..color = Color(0xffe7e7e7);
    canvas.drawCircle(center, 24, dotPainter);
    canvas.drawCircle(center, 23, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class ClockSecondPart extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.width / 2;

    // 30 because 360/12 =30;
    // dateTime.minute * 0.5 because we go forward than clock each minute
    Offset center = Offset(centerX, centerY);
    canvas.drawLine(
        center,
        Offset(0, -150),
        Paint()
          ..color = Colors.orangeAccent
          ..style = PaintingStyle.stroke
          ..strokeWidth = 4);
    // secondLine
    /* 
    //hour line
    canvas.drawLine(
        center,
        Offset(70, 120),
        Paint()
          ..color = Colors.black26
          ..style = PaintingStyle.stroke
          ..strokeWidth = 10);
    canvas.drawLine(
        center,
        Offset(30, 170),
        Paint()
          ..color = Colors.black26
          ..style = PaintingStyle.stroke
          ..strokeWidth = 6);
     */
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
