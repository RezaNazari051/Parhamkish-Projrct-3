import 'package:alibaba_v3/provider/alibaba.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowListOfFlightsScreen extends StatelessWidget {
  const ShowListOfFlightsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.centerRight,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: IconButton(
                              onPressed: () {}, icon: Icon(Icons.arrow_back))),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Consumer<Alibaba>(
                            builder: (_, value, __) {
                              return Text(
                                'پرواز ${value.fromCity} به > ${value.toCity}',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              );
                            },
                          ),
                          Consumer<Alibaba>(
                            builder: (context, value, child) {
                              return Text(
                                '${value.dateTime!.year}/${value.dateTime!.month}/${value.dateTime!.day} ${value.adultCount + value.kidCount + value.babyCount} مسافر',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w100),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
