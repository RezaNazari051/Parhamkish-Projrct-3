import 'package:alibaba_v3/provider/alibaba.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestButton extends StatefulWidget {
  TestButton({Key? key, required this.index}) : super(key: key);
  int? index;
  @override
  State<TestButton> createState() => _TestButtonState();
}

class _TestButtonState extends State<TestButton> {
  int? index;
  @override
  Widget build(BuildContext context) {
    final provider = context.read<Alibaba>();
    int adult = provider.adultCount ?? 1;
    int kid = provider.kidCount ?? 0;
    int baby = provider.babyCount ?? 0;
    // print('adult :$adult');
    // print('kid :$kid');
    // print('baby :$baby');

    return Container(
      height: 200,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          addAndRomoveButton(onPressed: () {
            print('first : ${provider.adultCount}');
            provider.setAdultCount(adult++);
            print('last :${provider.adultCount}');

            print(provider.adultCount.toString());
          }),
        ],
      ),
    );
  }

  Widget addAndRomoveButton({required Function() onPressed}) {
    return Row(
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
            ),
            onPressed: onPressed,
            child: Icon(Icons.add))
      ],
    );
  }
}
