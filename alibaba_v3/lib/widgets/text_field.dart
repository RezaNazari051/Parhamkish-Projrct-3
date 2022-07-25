import 'package:alibaba_v3/provider/alibaba.dart';
import 'package:alibaba_v3/screens/cities_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextFields extends StatefulWidget {
  TextFields(
      {Key? key, required this.text, required this.icon, required this.index})
      : super(key: key);
  final String text;
  final IconData icon;
  final int index;

  @override
  State<TextFields> createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  DateTime date = DateTime.now();
  int? index;
  String? result;

  @override
  Widget build(BuildContext context) {
    // final provider = context.read<Alibaba>();

    // return _getTextField(
    //   text: widget.text,
    //   icon: widget.icon,
    // );
    return ListTile(
        // subtitle: Visibility(
        //     visible: result != null ? true : false, child: Text(result ?? '')),

        subtitle: Consumer<Alibaba>(
          builder: (context, value, __) {
            return Text(
                widget.index == 1 ? value.fromCity ?? '' : value.toCity ?? '');
          },
        ),
        title: Text(
          widget.text,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 18,
          ),
        ),
        leading: Icon(widget.icon),
        onTap: () async {
          context.read<Alibaba>().setIndex(widget.index);
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CitiesListScreen(),
            ),
          );

          // setState(() {
          //   result;
          // });
        });
  }

  // Widget _getTextField({
  //   required String text,
  //   required IconData icon,
  // }) {
  //   return ListTile(
  //       // subtitle: Visibility(
  //       //     visible: result != null ? true : false, child: Text(result ?? '')),

  //       subtitle: Consumer<Alibaba>(
  //         builder: (context, value, __) {
  //           return Text(
  //               widget.index == 1 ? value.fromCity ?? '' : value.toCity ?? '');
  //         },
  //       ),
  //       title: Text(
  //         text,
  //         style: TextStyle(
  //           color: Colors.grey[600],
  //           fontSize: 18,
  //         ),
  //       ),
  //       leading: Icon(icon),
  //       onTap: () async {

  //        await Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => CitiesListScreen(),
  //           ),
  //         );

  //         // setState(() {
  //         //   result;
  //         // });
  //       });
  // }
}
