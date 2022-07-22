import 'package:alibaba_v3/screens/cities_list.dart';
import 'package:flutter/material.dart';

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
  final Color greyColor = Color(0xffEEEEEE);
  String? result;

  @override
  Widget build(BuildContext context) {
    return _getTextField(
        text: widget.text, icon: widget.icon, underlineColor: greyColor);
  }

  Widget _getTextField(
      {required String text,
      required IconData icon,
      required Color underlineColor}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: ListTile(
              subtitle: Visibility(
                  visible: result != null ? true : false,
                  child: Text(result ?? '')),
              title: Text(
                text,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 18,
                ),
              ),
              leading: Icon(icon),
              onTap: () async {
                print(widget.index);
                result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CitiesListScreen(
                            indexScreen: widget.index,
                          )),
                );
                setState(() {
                  result;
                });
                print('Text :$result');
              }),
        ),
        SizedBox(
          height: 5,
          child: Divider(
            thickness: 0.75,
            indent: 20,
            endIndent: 20,
          ),
        ),
      ],
    );
  }
}
