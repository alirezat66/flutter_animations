import 'dart:async';

import 'package:animation_training/widget/animated_text/animated_text_kit.dart';
import 'package:animation_training/widget/animated_text/src/animated_text.dart';
import 'package:flutter/material.dart';

class DigitalClockWithAnimation extends StatefulWidget {
  DigitalClockWithAnimation({Key key}) : super(key: key);

  @override
  _DigitalClockWithAnimationState createState() =>
      _DigitalClockWithAnimationState();
}

class _DigitalClockWithAnimationState extends State<DigitalClockWithAnimation> {
  List<ScaleAnimatedText> _secondList = [];
  int startIndex = 0;

  @override
  void initState() {
    _checkClock();
    DateTime dt = DateTime.now();
    startIndex = dt.second;
    createSecondList();
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: AnimatedTextKit(
        repeatForever: true,
        pause: Duration(milliseconds: 0),

        startIndex: startIndex,
        animatedTexts: _secondList,
        onTap: () {
          print("Tap Event");
        },
      ),
    );
    /* Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /* AnimatedSwitcher(
            duration: Duration(milliseconds: 100),
            child: Text(
              '$getHours()',
              style: TextStyle(fontSize: 42),
            )),
        Text(':', style: TextStyle(fontSize: 42)),
        AnimatedSwitcher(
            duration: Duration(milliseconds: 100),
            child: Text(
              '$getMinute()',
              style: TextStyle(fontSize: 42),
            )),
        Text(':', style: TextStyle(fontSize: 42)), */
        
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            _timeOfDay.period == DayPeriod.am ? 'AM' : 'PM',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        )
      ],
    ); */
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

  DateTime _dateTime = DateTime.now();
  void _checkClock() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _dateTime = DateTime.now();
      });
    });
  }

  void createSecondList() {
    for(int i = 0; i<60; i++){
      _secondList.add(ScaleAnimatedText(i>9? '$i' : '0$i',textStyle: TextStyle(fontSize: 42),duration: Duration(milliseconds: 950),scalingFactor: 0.9));
    }
  }
}
