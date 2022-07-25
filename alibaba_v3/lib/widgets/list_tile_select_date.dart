import 'package:alibaba_v3/provider/alibaba.dart';
import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:provider/provider.dart';

class ListTileSelectDateScreen extends StatelessWidget {
  ListTileSelectDateScreen({Key? key}) : super(key: key);
  final DateTime dt = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final provider = context.read<Alibaba>();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: ListTile(
          subtitle: Consumer<Alibaba>(
            builder: (_, value, __) {
              return Text(value.dateTime == null
                  ? 'انتخاب تاریخ'
                  : '${value.dateTime!.year}/${value.dateTime!.month}/${value.dateTime!.day}');
            },
          ),
          title: Text(
            'تاریخ رفت',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 18,
            ),
          ),
          leading: Icon(Icons.calendar_month_outlined),
          onTap: () async {
            // DateTime? newDate = await showDatePicker(
            //   context: context,
            //   initialDate: dt,
            //   firstDate: DateTime(2022),
            //   lastDate: DateTime(2024),
            //   locale: Locale('fa', 'IR'),
            // );
            Jalali? newDate = await showPersianDatePicker(
                context: context,
                initialDate: Jalali.now(),
                firstDate: Jalali.now(),
                lastDate: Jalali(1401, 12));
            if (newDate == null) {
              return;
            } else {
              provider.setDateTime(newDate);
            }
          }),
    );
  }
}
