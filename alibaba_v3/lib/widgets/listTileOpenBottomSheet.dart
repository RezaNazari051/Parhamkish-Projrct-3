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
      leading: Icon(Icons.chair_outlined),
      title: Consumer<Alibaba>(
        builder: (context, value, child) {
          return Text(
            value.typeOfFlightClass == false
                ? 'نوع و تعداد مسافران'
                : 'نوع مسافران و کلاس پروازی',
            style: TextStyle(fontSize: 15, color: Colors.grey[700]),
          );
        },
      ),
      subtitle: Wrap(
        children: [
          Consumer<Alibaba>(
            builder: (_, value, __) {
              return Text(
                'بزرگسال :${value.adultCount}',
                style: TextStyle(fontSize: 18, color: Colors.grey[800]),
              );
            },
          ),
          Consumer<Alibaba>(
            builder: (_, value, __) {
              return Visibility(
                visible: value.kidCount == 0 ? false : true,
                child: Text(
                  'کودک :${value.kidCount}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[800],
                  ),
                ),
              );
            },
          ),
          Consumer<Alibaba>(
            builder: (_, value, __) {
              return Visibility(
                visible: value.babyCount == 0 ? false : true,
                child: Text(
                  'نوزاد :${value.babyCount}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[800],
                  ),
                ),
              );
            },
          ),
        ],
      ),
      onTap: () {
        showBottomSheet(context, setCountProvider);
      },
    );
  }

  Future<dynamic> showBottomSheet(
      BuildContext context, Alibaba setCountProvider) {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(
          topRight: const Radius.circular(20),
          topLeft: const Radius.circular(20),
        ),
      ),
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Consumer<Alibaba>(
                    builder: (context, value, child) {
                      return Text(
                        value.typeOfFlightClass == false
                            ? 'نوع و تعداد مسافران'
                            : 'نوع مسافران و کلاس پروازی',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      );
                    },
                  )),
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
                      if (tf(context)) {
                        setCountProvider.setAdultCount(value.adultCount + 1);
                      }
                      // if (qualifyForFlight(context)) {
                      // }
                      // print('test2');
                    },
                    removeFun: () {
                      if (value.adultCount > 1)
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
                      if (tf(context)) {
                        setCountProvider.setKidCount(value.kidCount + 1);
                      }
                      // if (qualifyForFlight(context)) {
                      // }
                    },
                    removeFun: () {
                      if (value.kidCount > 0)
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
                      if (tf(context)) {
                        setCountProvider.setBabyCount(value.babyCount + 1);
                      }
                      // if (qualifyForFlight(context)) {
                      // }
                    },
                    removeFun: () {
                      if (value.babyCount > 0)
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
                                groupValue: radio1.test,
                                value: 1,
                                onChanged: (newValue) {
                                  radio1.testList(newValue!);
                                },
                              );
                            },
                          ),
                          Consumer<Alibaba>(
                            builder: (_, radio2, __) {
                              return RadioListTile<int>(
                                title: Text('فرست کلاس'),
                                groupValue: radio2.test,
                                value: 2,
                                onChanged: (newValue) {
                                  radio2.testList(newValue!);
                                },
                              );
                            },
                          ),
                          Consumer<Alibaba>(
                            builder: (_, radio3, __) {
                              return RadioListTile<int>(
                                title: Text('بیزنس کلاس'),
                                groupValue: radio3.test,
                                value: 3,
                                onChanged: (newValue) {
                                  radio3.testList(newValue!);
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
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[900],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    // print(setCountProvider.qualifyForFlight());
                  },
                  child: const Text('تایید'),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  bool qualifyForFlight(BuildContext context) {
    final provider = context.read<Alibaba>();
    return provider.qualifyFlight(
        provider.adultCount, provider.kidCount, provider.babyCount);
  }

  bool tf(BuildContext context) {
    final pro = context.read<Alibaba>();
    if (qualifyForFlight(context) &&
        (pro.adultCount * 3 >= (pro.kidCount + pro.babyCount)) &&
        pro.adultCount > pro.babyCount) {
      return true;
    } else
      return false;
  }
}
