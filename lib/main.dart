import 'package:flutter/material.dart';
import 'package:widgetslider/CardStackPage.dart';
import 'package:widgetslider/SliderAnimation.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SliderAnimationPage(),
    );
  }
}
