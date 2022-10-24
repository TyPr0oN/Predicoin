import 'package:flutter/material.dart';
import 'package:predicoin/screens/homeBody.dart';
import 'package:predicoin/screens/Backtest.dart';
import 'package:predicoin/screens/Predict.dart';

class buttomBar extends StatefulWidget {
  const buttomBar({Key? key}) : super(key: key);

  @override
  _buttomBarState createState() => _buttomBarState();
}

class _buttomBarState extends State<buttomBar> {
  int _selectedIndex = 0;
  List<Widget> pageList = <Widget>[
    HomeBodyPage(),
    BacktestPage(),
    PredictPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xff1D194B),
        selectedItemColor: Color(0xFFffd030),
        unselectedItemColor: Color(0xFFffd030),
        iconSize: 40,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.multiline_chart), label: 'BackTest'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart), label: 'Predict'),
        ],
      ),
    );
  }
}
