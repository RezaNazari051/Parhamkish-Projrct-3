import 'package:alibaba_v3/provider/alibaba.dart';
import 'package:alibaba_v3/widgets/addAndRemoveBotton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListTileOpenBottomSheet extends StatelessWidget {
  const ListTileOpenBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final setCountProvider = context.read<Alibaba>();
    // final getCountProvider = context.watch<Alibaba>();
    // print('test');

    return ListTile(
      title: Text('نوع و تعداد مسافران'),
      subtitle: Wrap(
        children: [
          Consumer<Alibaba>(
            builder: (_, value, __) {
              return Text('بزرگسال :${value.adultCount}');
            },
          ),
          Consumer<Alibaba>(
            builder: (_, value, __) {
              return Visibility(
                  visible: value.kidCount == 0 ? false : true,
                  child: Text('کودک :${value.kidCount}'));
            },
          ),
          Consumer<Alibaba>(
            builder: (_, value, __) {
              return Visibility(
                  visible: value.babyCount == 0 ? false : true,
                  child: Text('نوزاد :${value.babyCount}'));
            },
          ),
        ],
      ),
      onTap: () {
        openBottomSheet(context, setCountProvider);
      },
    );
  }

  PersistentBottomSheetController<dynamic> openBottomSheet(
      BuildContext context, Alibaba setCountProvider) {
    return showBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'نوع و تعدار مسافران',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Divider(
              indent: 20,
              endIndent: 20,
              color: Colors.grey[300],
            ),
            // Consumer<Alibaba>(builder: builder)
            Consumer<Alibaba>(
              builder: (_, value, __) {
                return AddAndRomeveButton(
                  index: 1,
                  addFun: () {
                    setCountProvider.setAdultCount(value.adultCount + 1);
                    // print('test2');
                  },
                  removeFun: () {
                    setCountProvider.setAdultCount(value.adultCount - 1);
                  },
                );
              },
            ),
            Consumer<Alibaba>(
              builder: (__, value, _) {
                return AddAndRomeveButton(
                  index: 2,
                  addFun: () {
                    setCountProvider.setKidCount(value.kidCount + 1);
                  },
                  removeFun: () {
                    setCountProvider.setKidCount(value.kidCount - 1);
                  },
                );
              },
            ),
            Consumer<Alibaba>(
              builder: (_, value, __) {
                return AddAndRomeveButton(
                  index: 3,
                  addFun: () {
                    setCountProvider.setBabyCount(value.babyCount + 1);
                  },
                  removeFun: () {
                    setCountProvider.setBabyCount(value.babyCount - 1);
                  },
                );
              },
            ),
            Consumer<Alibaba>(
              builder: (_, val, __) {
                return Visibility(
                  visible: val.typeOfFlightClass,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Consumer<Alibaba>(
                          builder: (_, radio1, __) {
                            return RadioListTile<int>(
                              title: Text('اکونومی کلاس'),
                              groupValue: radio1.selectedvalue,
                              value: radio1.selectedvalue,
                              onChanged: (value) {
                                setCountProvider.setSelectedvalue(1);
                              },
                            );
                          },
                        ),
                        Consumer<Alibaba>(
                          builder: (_, radio2, __) {
                            return RadioListTile<int>(
                              title: Text('فرست کلاس'),
                              groupValue: radio2.selectedvalue,
                              value: radio2.selectedvalue,
                              onChanged: (value) {
                                setCountProvider.setSelectedvalue(2);
                              },
                            );
                          },
                        ),
                        Consumer<Alibaba>(
                          builder: (_, radio3, __) {
                            return RadioListTile<int>(
                              title: Text('بیزنس کلاس'),
                              groupValue: radio3.selectedvalue,
                              value: radio3.selectedvalue,
                              onChanged: (value) {
                                radio3.setSelectedvalue(3);
                              },
                            );
                          },
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('تایید'),
              ),
            )
          ],
        );
      },
    );
  }
}
