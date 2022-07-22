import 'package:alibaba_v3/screens/flight_selection_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'IranSansMedium'),
      debugShowCheckedModeBanner: false,
      home: Directionality(
          textDirection: TextDirection.rtl, child: FlightSelectionScreen()),
    );
  }
}
