import 'dart:io';

import 'package:flutter/material.dart';
import 'package:predicoin/provider/coinSol.dart';
import 'package:predicoin/screens/Home.dart';
import 'package:predicoin/screens/Backtest.dart';
import 'package:predicoin/asset/priceChart.dart';
import 'package:predicoin/Widget/acdisChart.dart';
import 'package:predicoin/Widget/lnChart.dart';
import 'package:predicoin/widget/markerChart.dart';
import 'package:provider/provider.dart';

import '../provider/backtestSol.dart';

class BacktestResultSolMacdPage extends StatefulWidget {
  const BacktestResultSolMacdPage({Key? key, required this.investresultMacd})
      : super(key: key);
  final int investresultMacd;
  @override
  _BacktestResultPageState createState() =>
      _BacktestResultPageState(investresult: investresultMacd);
}

class _BacktestResultPageState extends State<BacktestResultSolMacdPage> {
  File? backtestSol;
  _BacktestResultPageState({required this.investresult});
  final int investresult;

  Future<File?> getBacktestSolPlot() async {
    try {
      backtestSol =
          await Provider.of<BacktestSol>(context, listen: false).fetchRequest();
    } catch (err) {
      print(err);
    }
    return backtestSol;
  }

  dynamic solinfo = '';
  String postInvestResult = '';
  Future<String> postInvest(investValue) async {
    try {
      postInvestResult = await Provider.of<BacktestSol>(context, listen: false)
          .sendInvestSolMacd(investment_value: investValue);
      solinfo =
          await Provider.of<CoinSol>(context, listen: false).fetchRequest();
      print('hellotry from macd sol');
      print(postInvestResult);
    } catch (err) {
      print(err);
    }
    return ('success');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: postInvest(investresult),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              backgroundColor: Color(0xff2D3035),
              appBar: buildAppBar(context),
              body: Padding(
                padding: const EdgeInsets.only(),
                child: SingleChildScrollView(
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                color: Colors.white,
                                iconSize: 35,
                                icon: const Icon(Icons.chevron_left),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return HomePage();
                                    }),
                                  );
                                },
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(2, 10, 2, 10),
                                child: Text(
                                  'Backtest Laboratory',
                                  style: TextStyle(
                                      fontFamily: 'Ruda',
                                      fontSize: 29,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(1),
                                      child: Text(
                                        'SOL',
                                        style: TextStyle(
                                            fontFamily: 'Ruda',
                                            fontSize: 26,
                                            color: Color(0xFFffd030)),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 40,
                                    child: Padding(
                                      padding: const EdgeInsets.all(1),
                                      child: Text(
                                        '${(double.parse((solinfo[0]['${solinfo[0].length - 1}']['Close']).toString()) * 100).toStringAsFixed(2)}' +
                                            " USD ",
                                        style: TextStyle(
                                            fontFamily: 'Ruda',
                                            fontSize: 20,
                                            color: Color(0xFFffd030)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            height: 225,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: [
                                InteractiveViewer(
                                  panEnabled: false,
                                  //boundaryMargin: EdgeInsets.all(),
                                  minScale: 2,
                                  maxScale: 4,
                                  //constrained: false,
                                  child: new Image.network(
                                    'http://10.0.2.2:8000/sol_macd_plot',
                                    // width: 400,
                                    // height: 400,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(1),
                                  child: Text(
                                    'Performance Measure',
                                    style: TextStyle(
                                        fontFamily: 'Ruda',
                                        fontSize: 25,
                                        color: Color(0xFFffd030)),
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 15, 0, 0),
                                  child: Text(
                                    'Return',
                                    style: TextStyle(
                                        fontFamily: 'Ruda',
                                        fontSize: 25,
                                        color: Color(0xFFffd030)),
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  child: Text(
                                    'Profit',
                                    style: TextStyle(
                                        fontFamily: 'Ruda',
                                        fontSize: 15,
                                        color: Color(0xFF8E7A2D)),
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(1),
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: Text(
                                  "Profit gained from the strategy by investing " +
                                      investresult.toString() +
                                      " : " +
                                      postInvestResult.toString() +
                                      " USD ",
                                  style: TextStyle(
                                      fontFamily: 'Ruda',
                                      fontSize: 15,
                                      color: Color(0xFFffd030)),
                                  maxLines: 3,
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 9, 0, 0),
                                  child: Text(
                                    'Max Drawdown',
                                    style: TextStyle(
                                        fontFamily: 'Ruda',
                                        fontSize: 15,
                                        color: Color(0xFF8E7A2D)),
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(1),
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: Text(
                                  "Maximum Drawdown : " +
                                      '${double.parse((solinfo[0]['${solinfo[0].length - 1}']['Max_dd']).toString()).toStringAsFixed(2)}' +
                                      " % ",
                                  style: TextStyle(
                                      fontFamily: 'Ruda',
                                      fontSize: 15,
                                      color: Color(0xFFffd030)),
                                  maxLines: 3,
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Color(0xff1D194B),
      title: Image.asset(
        'assets/logo/predicoin.png',
        height: 37,
      ),
    );
  }
}
