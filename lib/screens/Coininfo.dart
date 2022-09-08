import 'package:flutter/material.dart';
import 'package:predicoin/screens/coinInfoBody.dart';
import 'package:predicoin/screens/Backtest.dart';
import 'package:predicoin/screens/Predict.dart';

class CoininfoPage extends StatefulWidget {
  const CoininfoPage({Key? key}) : super(key: key);

  @override
  _CoininfoPageState createState() => _CoininfoPageState();
}

class _CoininfoPageState extends State<CoininfoPage> {
  int _selectedIndex = 0;
  List<Widget> pageList = <Widget>[
    coinInfoBodyPage(),
    BacktestPage(),
    PredictPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () {},
            color: Color(0xFFffd030), icon: Icon(Icons.search),
          ),
          IconButton(onPressed: () {},
            color: Color(0xFFffd030), icon: Icon(Icons.account_circle),
          ),
          IconButton(onPressed: () {},
            color: Color(0xFFffd030), icon: Icon(Icons.notifications),
          ),
        ],
      ),
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
          BottomNavigationBarItem(icon: Icon(Icons.home),
              label: 'home'
          ),
          BottomNavigationBarItem(icon: Icon(Icons.multiline_chart),
              label: 'BackTest'
          ),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart),
              label: 'Predict'
          ),
        ],
      ),
    );
  }
}