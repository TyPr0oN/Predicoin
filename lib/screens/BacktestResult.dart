import 'dart:io';

import 'package:flutter/material.dart';
import 'package:predicoin/screens/Home.dart';
import 'package:predicoin/screens/Backtest.dart';
import 'package:predicoin/asset/priceChart.dart';
import 'package:predicoin/Widget/acdisChart.dart';
import 'package:predicoin/Widget/lnChart.dart';
import 'package:predicoin/widget/markerChart.dart';
import 'package:provider/provider.dart';

import '../provider/backtestBtc.dart';

class BacktestResultPage extends StatefulWidget {
  const BacktestResultPage({Key? key, required this.investresult})
      : super(key: key);
  final int investresult;
  @override
  _BacktestResultPageState createState() =>
      _BacktestResultPageState(investresult: investresult);
}

class _BacktestResultPageState extends State<BacktestResultPage> {
  File? backtestBtc;
  _BacktestResultPageState({required this.investresult});
  final int investresult;

  Future<File?> getBacktestBtcPlot() async {
    try {
      backtestBtc =
          await Provider.of<BacktestBtc>(context, listen: false).fetchRequest();
    } catch (err) {
      print(err);
    }
    return backtestBtc;
  }

  String postInvestResult = '';
  Future<String> postInvest(investValue) async {
    try {
      postInvestResult = await Provider.of<BacktestBtc>(context, listen: false)
          .sendInvestBtcSma(investment_value: investValue);
      print('hellotry');
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
                                        'BTC',
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
                                        '29427.34',
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
                                    'http://10.0.2.2:8000/btc_sma_plot',
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
                                  padding: const EdgeInsets.all(1),
                                  child: Text(
                                    'Profit',
                                    style: TextStyle(
                                        fontFamily: 'Ruda',
                                        fontSize: 25,
                                        color: Color(0xFFffd030)),
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 15),
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
                                child: Padding(
                                  padding: const EdgeInsets.all(1),
                                  child: Text(
                                    postInvestResult.toString(),
                                    style: TextStyle(
                                        fontFamily: 'Ruda',
                                        fontSize: 15,
                                        color: Color(0xFFffd030)),
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 15),
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
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(1),
                                          child: Text(
                                            'Daily Return',
                                            style: TextStyle(
                                                fontFamily: 'Ruda',
                                                fontSize: 15,
                                                color: Color(0xFF8E7A2D)),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(1),
                                          child: Text(
                                            '7711.70 \%',
                                            style: TextStyle(
                                                fontFamily: 'Ruda',
                                                fontSize: 15,
                                                color: Color(0xFFffd030)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 90),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Monthly Return',
                                            style: TextStyle(
                                                fontFamily: 'Ruda',
                                                fontSize: 15,
                                                color: Color(0xFF8E7A2D)),
                                          ),
                                          Text(
                                            '6711.60 \%',
                                            style: TextStyle(
                                                fontFamily: 'Ruda',
                                                fontSize: 15,
                                                color: Color(0xFFffd030)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Text(
                                    'Risk-Adjusted Return',
                                    style: TextStyle(
                                        fontFamily: 'Ruda',
                                        fontSize: 25,
                                        color: Color(0xFFffd030)),
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(1),
                                  child: Text(
                                    'Total Return',
                                    style: TextStyle(
                                        fontFamily: 'Ruda',
                                        fontSize: 15,
                                        color: Color(0xFF8E7A2D)),
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(1),
                                  child: Text(
                                    '5511.50 \%',
                                    style: TextStyle(
                                        fontFamily: 'Ruda',
                                        fontSize: 15,
                                        color: Color(0xFFffd030)),
                                  ),
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
      title: Image.asset(
        'assets/logo/predicoin.png',
        height: 37,
      ),
    );
  }
}
