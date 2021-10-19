import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text('Home'),
        
      ),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'implicit');
              },
              child: Text('Implicit Animation')),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'explicit');
              },
              child: Text('Expelicit Animation')),
        ],
      )),
    );
  }
}
