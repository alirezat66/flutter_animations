import 'dart:async';

import 'package:flutter/material.dart';

class DigitalClockWithoutAnimation extends StatefulWidget {
  DigitalClockWithoutAnimation({Key key}) : super(key: key);

  @override
  _DigitalClockWithoutAnimationState createState() =>
      _DigitalClockWithoutAnimationState();
}

class _DigitalClockWithoutAnimationState
    extends State<DigitalClockWithoutAnimation> {
  @override
  void initState() {
    _checkClock();
    super.initState();
  }
  @override
  void dispose() {
    _timeDilationTimer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('${getHours()}:${getMinute()}:${getSecond()} ',
            style: TextStyle(fontSize: 42)),
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            _timeOfDay.period == DayPeriod.am ? 'AM' : 'PM',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        )
      ],
    );
  }

  String getHours() {
    return _dateTime.hour > 9 ? '${_dateTime.hour}' : '0${_dateTime.hour}';
  }

  String getMinute() {
    return _dateTime.minute > 9
        ? '${_dateTime.minute}'
        : '0${_dateTime.minute}';
  }

  String getSecond() {
    return _dateTime.second > 9
        ? '${_dateTime.second}'
        : '0${_dateTime.second}';
  }

  TimeOfDay _timeOfDay = TimeOfDay.now();
  DateTime _dateTime = DateTime.now();
    Timer _timeDilationTimer = Timer.periodic(Duration(seconds:1), (timer) { });

  void _checkClock() {
   _timeDilationTimer =  Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _timeOfDay = TimeOfDay.now();
        _dateTime = DateTime.now();
      });
    });
  }
}
