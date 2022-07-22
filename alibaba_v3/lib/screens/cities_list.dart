import 'package:flutter/material.dart';

class CitiesListScreen extends StatefulWidget {
  CitiesListScreen({Key? key, required this.indexScreen}) : super(key: key);
  int indexScreen;
  @override
  State<CitiesListScreen> createState() => _CitiesListScreenState();
}

class _CitiesListScreenState extends State<CitiesListScreen> {
  @override
  Widget build(BuildContext context) {
    String? selectedText;
    int indexScreen;

    List<String> citiesList = [
      'تهران',
      'مشهد',
      'اهواز',
      'شیراز',
      'تبریز',
      'بندر عباس',
      'کیش',
      'اصفهان',
      'یزد',
      'کرمان',
      'آبادان',
      'اراک',
      'اردبیل',
      'ارومیه',
      'امیدیه',
      'ایرانشهر'
    ];
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: Text(
          widget.indexScreen == 1 ? 'انتخاب مبدا' : 'انتخاب مقصد',
          style: TextStyle(color: Colors.black),
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
                    Text(
                      'شهر های پُِر پرواز',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: citiesList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          onTap: () {
                            selectedText = citiesList[index];
                            setState(() {});
                            Navigator.of(context).pop(selectedText);
                          },
                          leading: Icon(Icons.location_on_outlined),
                          title: Text(citiesList[index],
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[600])),
                        ),
                        Divider()
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
