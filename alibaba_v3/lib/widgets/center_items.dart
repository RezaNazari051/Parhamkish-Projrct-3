import 'package:alibaba_v3/widgets/list_tile.dart';
import 'package:alibaba_v3/widgets/switch_buttons_in_center_item.dart';
import 'package:alibaba_v3/widgets/text_field.dart';
import 'package:flutter/material.dart';

class CenterItems extends StatefulWidget {
  const CenterItems({Key? key, required this.selectedIndex}) : super(key: key);
  final selectedIndex;
  @override
  State<CenterItems> createState() => _CenterItemsState();
}

class _CenterItemsState extends State<CenterItems> {
  int swwitchButtonIndex = 1;
  int? selectedIndex;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 15, left: 15, bottom: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SwitchButton(),
            ),
            TextFields(text: 'مبدا', icon: Icons.location_on_outlined),
            TextFields(text: 'مقصد', icon: Icons.location_on_outlined),
            TextFields(text: 'تاریخ رفت', icon: Icons.calendar_month_outlined),
            ListTileNumberOfPassengers(
              index: widget.selectedIndex,
            )
          ],
        ),
      ),
    );
  }
}
