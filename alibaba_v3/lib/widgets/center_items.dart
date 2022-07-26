import 'package:alibaba_v3/provider/alibaba.dart';
import 'package:alibaba_v3/screens/showListOfFlights.dart';
import 'package:alibaba_v3/widgets/listTileOpenBottomSheet.dart';
import 'package:alibaba_v3/widgets/list_tile_select_date.dart';
import 'package:alibaba_v3/widgets/round_trip_buttons.dart';
import 'package:alibaba_v3/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

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
              padding: const EdgeInsets.only(top: 10.0, right: 15, left: 15),
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
                  const SizedBox(width: 20),
                  RoundTripButtons(
                    text: 'رفت و برگشت',
                    ontap: () {
                      setState(
                        () {
                          switchButtonIndex = 2;
                          // print(switchButtonIndex.toString());
                        },
                      );
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
            const SizedBox(
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
            const SizedBox(
              height: 5,
              child: Divider(
                thickness: 0.75,
                indent: 20,
                endIndent: 20,
              ),
            ),
            ListTileSelectDateScreen(
                // text: switchButtonIndex == 1 ? 'تاریخ رفت' : 'تاریخ رفت و برگشت',
                // icon: Icons.calendar_month_outlined,
                ),
            const SizedBox(
              height: 5,
              child: const Divider(
                thickness: 0.75,
                indent: 20,
                endIndent: 20,
              ),
            ),
            // ListTileNumberOfPassengers(
            //   index: widget.selectedIndex,
            // ),
            ListTileOpenBottomSheet(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[900],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    final provider = context.read<Alibaba>();
                    if (provider.fromCity != null &&
                        provider.toCity != null &&
                        provider.dateTime != null) {
                      print('ok');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShowListOfFlightsScreen(),
                        ),
                      );
                    } else {
                      // Toast.show('لطفا تمام مقادیر را چک کنید',
                      //     duration: 2, gravity: 2);
                      Fluttertoast.showToast(
                          msg: 'لطفا مقادیر ورودی را چک کنید',
                          textColor: Colors.black,
                          fontSize: 18,
                          backgroundColor: Colors.yellow[700]);
                    }
                  },
                  child: const Text('جستجو'),
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
