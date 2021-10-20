import 'dart:async';
import 'package:flutter/material.dart';

class ClabberWidget extends StatefulWidget {
  ClabberWidget({Key key}) : super(key: key);

  @override
  _ClabberWidgetState createState() => _ClabberWidgetState();
}

class _ClabberWidgetState extends State<ClabberWidget>
    with TickerProviderStateMixin {
  int _counter = 0;
  ScoreWidgetStatus _scoreWidgetStatus = ScoreWidgetStatus.HIDDEN;
  final duration = new Duration(milliseconds: 400);
  final oneSecond = new Duration(seconds: 1);
  Timer holdTimer = new Timer(Duration(seconds: 1), () {}),
      scoreOutETA = new Timer(Duration(seconds: 1), () {});
  AnimationController scoreInAnimationController,
      scoreOutAnimationController,
      scoreSizeAnimationController;

  Animation scoreOutPositionAnimation;

  @override
  void initState() {
    super.initState();
    scoreInAnimationController = new AnimationController(
        duration: new Duration(milliseconds: 150), vsync: this);
    scoreInAnimationController.addListener(() {
      setState(() {}); // Calls render function
    });

    scoreOutAnimationController =
        new AnimationController(vsync: this, duration: duration);
    scoreOutPositionAnimation = new Tween(begin: 100.0, end: 150.0).animate(
        new CurvedAnimation(
            parent: scoreOutAnimationController, curve: Curves.easeOut));
    scoreOutPositionAnimation.addListener(() {
      setState(() {});
    });
    scoreOutAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _scoreWidgetStatus = ScoreWidgetStatus.HIDDEN;
      }
    });

    scoreSizeAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 150));
    scoreSizeAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        scoreSizeAnimationController.reverse();
      }
    });
    scoreSizeAnimationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    scoreInAnimationController.dispose();
    scoreOutAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: width,
          height: width / 2,
        ),
        getScoreButton(),
        getClapButton(),
      ],
    );
  }

  Widget getScoreButton() {
    var scorePosition = 0.0;
    var scoreOpacity = 0.0;
    var extraSize = 0.0;
    switch (_scoreWidgetStatus) {
      case ScoreWidgetStatus.HIDDEN:
        break;
      case ScoreWidgetStatus.BECOMING_VISIBLE:
      case ScoreWidgetStatus.VISIBLE:
        scorePosition = scoreInAnimationController.value * 100;
        scoreOpacity = scoreInAnimationController.value;
        extraSize = scoreSizeAnimationController.value * 3;
        break;
      case ScoreWidgetStatus.BECOMING_INVISIBLE:
        scorePosition = scoreOutPositionAnimation.value;
        scoreOpacity = 1.0 - scoreOutAnimationController.value;
    }

    var stackChildren = <Widget>[];

    stackChildren.add(new Opacity(
        opacity: scoreOpacity,
        child: new Container(
            height: 50.0 + extraSize,
            width: 50.0 + extraSize,
            decoration: new ShapeDecoration(
              shape: new CircleBorder(side: BorderSide.none),
              color: Colors.pink,
            ),
            child: new Center(
                child: new Text(
              "+" + _counter.toString(),
              style: new TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0),
            )))));

    var widget = new Positioned(
        child: new Stack(
          alignment: FractionalOffset.center,
          children: stackChildren,
        ),
        bottom: scorePosition);
    return widget;
  }

  void onTapDown(TapDownDetails tap) {
    // User pressed the button. This can be a tap or a hold.
    scoreOutETA.cancel(); // We do not want the score to vanish!

    if (_scoreWidgetStatus == ScoreWidgetStatus.BECOMING_INVISIBLE) {
      // We tapped down while the widget was flying up. Need to cancel that animation.
      scoreOutAnimationController.stop(canceled: true);
      _scoreWidgetStatus = ScoreWidgetStatus.VISIBLE;
    } else if (_scoreWidgetStatus == ScoreWidgetStatus.HIDDEN) {
      _scoreWidgetStatus = ScoreWidgetStatus.BECOMING_VISIBLE;
      scoreInAnimationController.forward(from: 0.0);
    }
    increment(null);
    holdTimer = new Timer.periodic(duration, increment); // Takes care of hold
  }

  void increment(Timer t) {
    scoreSizeAnimationController.forward(from: 0.0);
    setState(() {
      _counter++;
      print(_counter);
    });
  }

  void onTapUp(TapUpDetails tap) {
    // User removed his finger from button.
    scoreOutETA = new Timer(oneSecond, () {
      scoreOutAnimationController.forward(from: 0.0);
      _scoreWidgetStatus = ScoreWidgetStatus.BECOMING_INVISIBLE;
    });
    holdTimer.cancel();
  }

  Widget getClapButton() {
    return GestureDetector(
        onTapDown: onTapDown,
        onTapUp: onTapUp,
        child: new Container(
          height: 60.0,
          width: 60.0,
          padding: new EdgeInsets.all(10.0),
          decoration: new BoxDecoration(
              border: new Border.all(color: Colors.pink, width: 1.0),
              borderRadius: new BorderRadius.circular(50.0),
              color: Colors.white,
              boxShadow: [new BoxShadow(color: Colors.pink, blurRadius: 8.0)]),
          child: new ImageIcon(new AssetImage("images/clap.png"),
              color: Colors.pink, size: 40.0),
        ));
  }
}

enum ScoreWidgetStatus { HIDDEN, BECOMING_VISIBLE, VISIBLE, BECOMING_INVISIBLE }
