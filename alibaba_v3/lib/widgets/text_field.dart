import 'package:flutter/material.dart';

class TextFields extends StatelessWidget {
  TextFields({Key? key, required this.text, required this.icon})
      : super(key: key);
  final Color greyColor = Color(0xffEEEEEE);
  String? text;
  IconData? icon;
  @override
  Widget build(BuildContext context) {
    return _getTextField(text: text!, icon: icon!, underlineColor: greyColor);
  }

  Widget _getTextField(
      {required String text,
      required IconData icon,
      required Color underlineColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          showCursor: false,
          keyboardType: TextInputType.none,
          readOnly: true,
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: greyColor),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: greyColor,
              ),
            ),
            hintText: text,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Icon(
                icon,
                size: 30,
                color: Colors.grey[400],
              ),
            ),
            hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
