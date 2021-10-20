import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class FadeAnimationScreen extends StatefulWidget {
  FadeAnimationScreen({Key key}) : super(key: key);

  @override
  _FadeAnimationScreenState createState() => _FadeAnimationScreenState();
}

class _FadeAnimationScreenState extends State<FadeAnimationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: Text('Animation Fade Image'),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(IconlyLight.arrow_left)),
        ),
        body: Center(
          child: Column(
            children: [
              FadeInImage(
                  placeholder: Image.asset('images/image_3.png').image,
                  image: Image.network(
                          "https://armancoders.com/wp-content/uploads/2021/08/WhatsApp-Image-2021-08-04-at-00.58.07-443x424.jpeg",)
                      .image,
                  fadeInDuration: Duration(milliseconds: 500),
                  fadeOutDuration: Duration(milliseconds: 500))
            ],
          ),
        ));
  }
}
