import 'package:flutter/material.dart';

import 'package:predicoin/screens/Background.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Palette.kToDark,
      ),
      home: BackgroundScreen(),
    );
  }
}
class Palette {
  static const MaterialColor kToDark = const MaterialColor(
    0xff1D194B, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xff1a1744 ),//10%
      100: const Color(0xff17143c),//20%
      200: const Color(0xff141235),//30%
      300: const Color(0xff110f2d),//40%
      400: const Color(0xff0f0d26),//50%
      500: const Color(0xff0c0a1e),//60%
      600: const Color(0xff090716),//70%
      700: const Color(0xff06050f),//80%
      800: const Color(0xff030207),//90%
      900: const Color(0xff000000),//100%
    },
  );
}


