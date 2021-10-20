import 'package:animation_training/screen/animation_alignment_widget.dart';
import 'package:animation_training/screen/animation_container_widget.dart';
import 'package:animation_training/screen/animation_cross_fade_widget.dart';
import 'package:animation_training/screen/animation_defualt_text_widget.dart';
import 'package:animation_training/screen/animation_opacity_widget.dart';
import 'package:animation_training/screen/animation_padding_widget.dart';
import 'package:animation_training/screen/animation_position_widget.dart';
import 'package:animation_training/screen/physical_modal_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:dropdown_selection/dropdown_selection.dart';

class ImplicitScreen extends StatefulWidget {
  const ImplicitScreen({Key key}) : super(key: key);

  @override
  _ImplicitScreenState createState() => _ImplicitScreenState();
}

class _ImplicitScreenState extends State<ImplicitScreen> {
  var curves = {};
  String selectedCurve = 'bounceIn';
  @override
  void initState() {
    curves = {
      'bounceIn': Curves.bounceIn,
      'bounceInOut': Curves.bounceInOut,
      'bounceOut': Curves.bounceOut,
      'decelerate': Curves.decelerate,
      'ease': Curves.ease,
      'easeIn': Curves.easeIn,
      'easeInBack': Curves.easeInBack,
      'easeInCirc': Curves.easeInCirc,
      'easeInCubic': Curves.easeInCubic,
      'easeInExpo': Curves.easeInExpo,
      'easeInOut': Curves.easeInOut,
      'easeInOutBack': Curves.easeInOutBack,
      'easeInOutCirc': Curves.easeInOutCirc,
      'easeInOutCubic': Curves.easeInOutCubic,
      'easeInOutExpo': Curves.easeInOutExpo,
      'easeInOutQuad': Curves.easeInOutQuad,
      'easeInOutQuart': Curves.easeInOutQuart,
      'easeInOutQuint': Curves.easeInOutQuint,
      'easeInOutSine': Curves.easeInOutSine,
      'easeInQuad': Curves.easeInQuad,
      'easeInQuart': Curves.easeInQuart,
      'easeInQuint': Curves.easeInQuint,
      'easeInSine': Curves.easeInSine,
      'easeInToLinear': Curves.easeInToLinear,
      'easeOut': Curves.easeOut,
      'easeOutBack': Curves.easeOutBack,
      'easeOutCirc': Curves.easeOutCirc,
      'easeOutCubic': Curves.easeOutCubic,
      'easeOutExpo': Curves.easeOutExpo,
      'easeOutQuad': Curves.easeOutQuad,
      'easeOutQuart': Curves.easeOutQuart,
      'easeOutQuint': Curves.easeOutQuint,
      'easeOutSine': Curves.easeOutSine,
      'elasticIn': Curves.elasticIn,
      'elasticInOut': Curves.elasticInOut,
      'elasticOut': Curves.elasticOut,
      'fastOutSlowIn': Curves.fastOutSlowIn,
      'linear': Curves.linear,
      'linearToEaseOut': Curves.linearToEaseOut,
      'slowMiddle': Curves.slowMiddle,
    };

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text('Inplicit Widgets'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(IconlyLight.arrow_left)),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 16,
                ),
                DropdownSelection<String>(
                  label: 'Selected Curve $selectedCurve',
                  mode: Mode.BOTTOM_SHEET,
                  items: curves.keys.toList().cast<String>(),
                  showSearchBox: true,
                  popupTitle: Center(
                      child: Text(
                    'Select Your Curve',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  )),
                  onChanged: (data) {
                    setState(() {
                      selectedCurve = data.toString();
                    });
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                AnimationContainerWidget(curve: curves[selectedCurve]),
                Divider(
                  thickness: 4,
                ),
                OpacityAnimationWidget(curve: curves[selectedCurve]),
                Divider(
                  thickness: 4,
                ),
                CrossFadeAnimationWidget(curve: curves[selectedCurve]),
                Divider(
                  thickness: 4,
                ),
                AlignmentAnimationWidget(curve: curves[selectedCurve]),
                Divider(
                  thickness: 4,
                ),
                PaddingAnimationWidget(curve: curves[selectedCurve]),
                Divider(
                  thickness: 4,
                ),
                PhysicalModalAnimation(curve: curves[selectedCurve]),
                Divider(
                  thickness: 4,
                ),
                PositionAnimationWidgwt(curve: curves[selectedCurve]),
                Divider(
                  thickness: 4,
                ),
                AnimatedTextWidget(curve: curves[selectedCurve]),
                Divider(
                  thickness: 4,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'fade');
                    },
                    child: Text('Fade Image')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
