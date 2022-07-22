import 'package:flutter/material.dart';

class ListTileSelectDateScreen extends StatefulWidget {
  ListTileSelectDateScreen({Key? key, required this.text, required this.icon})
      : super(key: key);
  final String text;
  final IconData icon;
  @override
  State<ListTileSelectDateScreen> createState() =>
      _ListTileSelectDateScreenState();
}

class _ListTileSelectDateScreenState extends State<ListTileSelectDateScreen> {
  String? result;
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: ListTile(
          subtitle: Visibility(
              visible: result != null ? true : false,
              child: Text(result ?? '')),
          title: Text(
            widget.text,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 18,
            ),
          ),
          leading: Icon(widget.icon),
          onTap: () async {
            DateTime? newDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(DateTime.monthsPerYear),
                lastDate: DateTime(2024));

            if (newDate == null) {
              return;
            }
            setState(() {
              date = newDate;
              print('date : $date :: new : $newDate');
            });

            setState(() {
              result;
            });
            print('Text :$result');
          }),
    );
  }
}
