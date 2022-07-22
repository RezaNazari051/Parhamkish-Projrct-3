import 'package:alibaba_v3/screens/cities_list_screen.dart';
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
  DateTime date = DateTime.now();

  String? result;

  @override
  Widget build(BuildContext context) {
    return _getTextField(
      text: widget.text,
      icon: widget.icon,
    );
  }

  Widget _getTextField({
    required String text,
    required IconData icon,
  }) {
    return ListTile(
        subtitle: Visibility(
            visible: result != null ? true : false, child: Text(result ?? '')),
        title: Text(
          text,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 18,
          ),
        ),
        leading: Icon(icon),
        onTap: () async {
          result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CitiesListScreen(
                indexScreen: widget.index,
              ),
            ),
          );

          setState(() {
            result;
          });
        });
  }
}
