import 'package:alibaba_v3/widgets/list_tile.dart';
import 'package:alibaba_v3/widgets/round_trip_buttons.dart';
import 'package:alibaba_v3/widgets/text_field.dart';
import 'package:flutter/material.dart';

class CenterItems extends StatefulWidget {
  const CenterItems({Key? key, required this.selectedIndex}) : super(key: key);
  final selectedIndex;
  @override
  State<CenterItems> createState() => _CenterItemsState();
}

class _CenterItemsState extends State<CenterItems> {
  int? selectedIndex = 2;
  //int switchButtonIndex = 1;
  int switchButtonIndex = 1;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              //switch buttons
              // child: SwitchButton(
              //   selectedIndex: switchButtonIndex,
              // ),
              child: Row(
                children: [
                  RoundTripButtons(
                    text: 'رفت',
                    ontap: () {
                      setState(() {
                        switchButtonIndex = 1;
                        //  print(switchButtonIndex.toString());
                      });
                    },
                    index: 1,
                    selectedIndex: switchButtonIndex,
                  ),
                  RoundTripButtons(
                    text: 'برگشت',
                    ontap: () {
                      setState(() {
                        switchButtonIndex = 2;
                        // print(switchButtonIndex.toString());
                      });
                    },
                    index: 2,
                    selectedIndex: switchButtonIndex,
                  ),
                ],
              ),
            ),
            TextFields(text: 'مبدا', icon: Icons.location_on_outlined),
            TextFields(text: 'مقصد', icon: Icons.location_on_outlined),
            TextFields(
                text:
                    switchButtonIndex == 1 ? 'تاریخ رفت' : 'تاریخ رفت و برگشت',
                icon: Icons.calendar_month_outlined),
            ListTileNumberOfPassengers(
              index: widget.selectedIndex,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[900],
                  ),
                  onPressed: () {},
                  child: Text('جستجو'),
                ),
              ),
            ),
            SizedBox(height: 15)
          ],
        ),
      ),
    );
  }
}
