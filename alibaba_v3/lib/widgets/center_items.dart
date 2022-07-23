import 'package:alibaba_v3/widgets/List_tile_number_of_passengers.dart';
import 'package:alibaba_v3/widgets/list_tile_select_date.dart';
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
                      setState(
                        () {
                          switchButtonIndex = 1;
                          //  print(switchButtonIndex.toString());
                        },
                      );
                    },
                    index: 1,
                    selectedIndex: switchButtonIndex,
                  ),
                  SizedBox(width: 20),
                  RoundTripButtons(
                    text: 'رفت و برگشت',
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
            TextFields(
              text: 'مبدا',
              icon: Icons.location_on_outlined,
              index: 1,
            ),
            SizedBox(
              height: 5,
              child: Divider(
                thickness: 0.75,
                indent: 20,
                endIndent: 20,
              ),
            ),
            TextFields(
              text: 'مقصد',
              icon: Icons.location_on_outlined,
              index: 2,
            ),
            SizedBox(
              height: 5,
              child: Divider(
                thickness: 0.75,
                indent: 20,
                endIndent: 20,
              ),
            ),
            ListTileSelectDateScreen(
              text: switchButtonIndex == 1 ? 'تاریخ رفت' : 'تاریخ رفت و برگشت',
              icon: Icons.calendar_month_outlined,
            ),
            SizedBox(
              height: 5,
              child: Divider(
                thickness: 0.75,
                indent: 20,
                endIndent: 20,
              ),
            ),
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
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
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
