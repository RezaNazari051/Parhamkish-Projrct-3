import 'package:alibaba_v3/widgets/center_items.dart';
import 'package:alibaba_v3/widgets/top_items.dart';
import 'package:flutter/material.dart';

class FlightSelectionScreen extends StatefulWidget {
  FlightSelectionScreen({Key? key}) : super(key: key);

  @override
  State<FlightSelectionScreen> createState() => _FlightSelectionScreenState();
}

class _FlightSelectionScreenState extends State<FlightSelectionScreen> {
  int topItemIndex = 1;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 150,
                  color: Colors.yellow[700],
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'پرواز',
                          style: TextStyle(fontSize: 18),
                        ),
                      ]),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 110, right: 15, left: 15),
                  child: Row(
                    children: [
                      TopItems(
                        ontap: () {
                          setState(() {
                            topItemIndex = 1;
                          });
                          // print('test : $topItemIndex');
                        },
                        index: topItemIndex,
                        title: 'پرواز داخلی',
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      TopItems(
                        ontap: () {
                          setState(() {
                            topItemIndex = 2;
                          });
                          // print('test : $topItemIndex');
                        },
                        index: topItemIndex,
                        title: 'پرواز خارجی',
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20)),
                      ),
                    ],
                  ),
                )
              ],
            ),
            CenterItems(
              selectedIndex: topItemIndex,
            )
          ],
        ),
      ),
    );
  }
}
