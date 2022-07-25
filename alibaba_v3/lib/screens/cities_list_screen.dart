import 'package:alibaba_v3/provider/alibaba.dart';
import 'package:alibaba_v3/screens/flight_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CitiesListScreen extends StatelessWidget {
  const CitiesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController? _myConroller = TextEditingController();
    //String? selectedText;
    final provider = context.read<Alibaba>();
    int indexScreen = provider.index ?? 1;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: Consumer<Alibaba>(
          builder: (context, value, child) {
            return Text(
              value.index == 1 ? 'انتخاب مبدا' : 'انتخاب مقصد',
              style: const TextStyle(color: Colors.black),
            );
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TextField(
                  controller: _myConroller,
                  onChanged: (value) {
                    provider.addToSeachList(provider.citiesList
                        .where(
                            (element) => element.toLowerCase().contains(value))
                        .toList());
                  },
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    hintText: 'جستجوی شهر',
                    hintTextDirection: TextDirection.rtl,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    filled: true,
                    fillColor: Colors.blueGrey[50],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Align(
                alignment: Alignment.centerRight,
                child: Column(
                  children: [
                    const Text(
                      'شهر های پُر پرواز',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Consumer<Alibaba>(
                builder: (_, value, __) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: _myConroller.text.isNotEmpty
                        ? value.searchList.length
                        : value.citiesList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            onTap: () {
                              // selectedText = citiesList[index];
                              // print(indexScreen);
                              // provider.setIndex(widget.indexScreen);

                              // if (widget.indexScreen == 1) {

                              // }
                              if (indexScreen == 1) {
                                provider.setFromCity(value.citiesList[index]);
                                provider.setIndex(indexScreen++);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((context) {
                                      return CitiesListScreen();
                                    }),
                                  ),
                                );
                                provider.setIndex(indexScreen++);
                              } else if (indexScreen == 2) {
                                provider.setToCity(value.citiesList[index]);
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: ((context) =>
                                          FlightSelectionScreen()),
                                    ),
                                    (route) => false);
                              }

                              // else if (widget.indexScreen == 1) {
                              //   provider.setToCity(citiesList[index]);
                              //   selectedText = citiesList[index];
                              // }

                              // final provider =  Provider.of(context, listen: true);
                            },
                            leading: Icon(Icons.location_on_outlined),
                            title: Text(
                                _myConroller.text.isNotEmpty
                                    ? value.searchList[index]
                                    : value.citiesList[index],
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey[600])),
                          ),
                          Divider()
                        ],
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

// @override
// Widget build(BuildContext context) {
  

  
// }
