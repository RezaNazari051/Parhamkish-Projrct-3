import 'package:alibaba_v3/widgets/center_items.dart';
import 'package:alibaba_v3/widgets/top_items.dart';
import 'package:flutter/material.dart';

class SelectScreen extends StatefulWidget {
  SelectScreen({Key? key}) : super(key: key);

  @override
  State<SelectScreen> createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  int topItemIndex = 0;
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                print('Elevated: $topItemIndex');
              },
              child: Text('')),
          Stack(
            children: [
              Container(height: 150, color: Colors.red),
              ElevatedButton(
                  onPressed: () {
                    print('Elevated: $topItemIndex');
                  },
                  child: Text('')),
              Padding(
                padding: EdgeInsets.only(top: 110, right: 15, left: 15),
                child: Row(
                  children: [
                    TopItems(
                      ontap: () {
                        setState(() {
                          topItemIndex = 1;
                        });
                        print('test : $topItemIndex');
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
                        print('test : $topItemIndex');
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
    );
  }
}
