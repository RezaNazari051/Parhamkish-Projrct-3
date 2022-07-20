import 'package:flutter/material.dart';

class TopItems extends StatefulWidget {
  TopItems(
      {Key? key,
      required this.borderRadius,
      required this.title,
      required this.index,
      required this.ontap})
      : super(key: key);
  BorderRadius? borderRadius;
  String? title;
  int? index;
  Function()? ontap;

  @override
  State<TopItems> createState() => _TopItemsState();
}

class _TopItemsState extends State<TopItems> {
  BorderRadius? borderRadius;
  String? title;
  int? index;
  int selecteFlyMode = 0;
  Function()? ontap;

  @override
  void initState() {
    super.initState();
    borderRadius = widget.borderRadius;
    title = widget.title;
    index = widget.index;
    ontap = widget.ontap;
  }

  Widget build(BuildContext context) {
    return getItems(index!, ontap!);
  }

  Widget getItems(int index, Function() ontap) {
    return Expanded(
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: borderRadius!),
            primary: Colors.white,
            onPrimary: Colors.black,
          ),
          onPressed: ontap,
          child: Text(title!),
        ),
      ),
    );
  }
}
