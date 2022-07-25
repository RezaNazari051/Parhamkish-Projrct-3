import 'package:alibaba_v3/provider/alibaba.dart';
import 'package:alibaba_v3/widgets/center_items.dart';
import 'package:alibaba_v3/widgets/top_items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final setProvider = context.read<Alibaba>();

    return Scaffold(
      backgroundColor: Colors.grey[200],
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
                        Center(
                          child: const Text(
                            'پرواز',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ]),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 110, right: 15, left: 15),
                  child: Row(
                    children: [
                      TopItems(
                        ontap: () {
                          setProvider.setTypeOfFlightClas(false);
                          // print('test : $topItemIndex');
                        },
                        index: topItemIndex,
                        title: 'پرواز داخلی',
                        borderRadius: BorderRadius.only(
                          topRight: const Radius.circular(20),
                          bottomRight: const Radius.circular(20),
                        ),
                      ),
                      TopItems(
                        ontap: () {
                          setProvider.setTypeOfFlightClas(true);

                          // print('test : $topItemIndex');
                        },
                        index: topItemIndex,
                        title: 'پرواز خارجی',
                        borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(20),
                            bottomLeft: const Radius.circular(20)),
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
