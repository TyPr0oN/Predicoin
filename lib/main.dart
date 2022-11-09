import 'package:flutter/material.dart';
import 'package:predicoin/provider/predictFeed.dart';
import 'package:predicoin/provider/coinBtc.dart';
import 'package:predicoin/provider/predictFeedETH.dart';
import 'package:predicoin/provider/predictFeedPAXG.dart';
import 'package:predicoin/provider/predictFeedSOL.dart';
import 'package:predicoin/provider/predictFeedYFI.dart';
import 'package:predicoin/screens/Background.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PredictBtcFeed>(
            create: (ctx) => PredictBtcFeed()),
        ChangeNotifierProvider<CoinBtc>(create: (ctx) => CoinBtc()),
        ChangeNotifierProvider<PredictEthFeed>(
            create: (ctx) => PredictEthFeed()),
        ChangeNotifierProvider<PredictPaxgFeed>(
            create: (ctx) => PredictPaxgFeed()),
        ChangeNotifierProvider<PredictSolFeed>(
            create: (ctx) => PredictSolFeed()),
        ChangeNotifierProvider<PredictYfiFeed>(
            create: (ctx) => PredictYfiFeed()),
      ],
      child: MaterialApp(
        title: 'Easy Bartering',
        debugShowCheckedModeBanner: false,
        home: BackgroundScreen(),
      ),
    );
  }
}

class Palette {
  static const MaterialColor kToDark = const MaterialColor(
    0xff1D194B, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      10: Colors.white,
      50: const Color(0xff1a1744), //10%
      100: const Color(0xff17143c), //20%
      200: const Color(0xff141235), //30%
      300: const Color(0xff110f2d), //40%
      400: const Color(0xff0f0d26), //50%
      500: const Color(0xff0c0a1e), //60%
      600: const Color(0xff090716), //70%
      700: const Color(0xff06050f), //80%
      800: const Color(0xff030207), //90%
      900: const Color(0xff000000), //100%
    },
  );
}
