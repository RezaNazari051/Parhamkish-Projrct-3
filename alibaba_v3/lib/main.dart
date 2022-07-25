import 'package:alibaba_v3/provider/alibaba.dart';
import 'package:alibaba_v3/screens/flight_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(
    MultiProvider(
      providers: [
        // Provider<Alibaba>(create: (_) => Alibaba()),
        ChangeNotifierProvider(
          create: (_) => Alibaba(),
        )
      ],
      child: Application(),
    ),
  );
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark),
    );

    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('fa', ''), // English, no country code
      ],
      theme: ThemeData(
        fontFamily: 'IranSansMedium',
      ),
      debugShowCheckedModeBanner: false,
      home: FlightSelectionScreen(),
    );
  }
}
