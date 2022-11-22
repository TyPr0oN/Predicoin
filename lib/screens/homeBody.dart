import 'package:flutter/material.dart';
import 'package:predicoin/main.dart';
import 'package:predicoin/screens/CoinBtcInfo.dart';
import 'package:predicoin/screens/CoinEthInfo.dart';
import 'package:predicoin/screens/CoinSolInfo.dart';
import 'package:predicoin/screens/CoinYfiInfo.dart';
import 'package:predicoin/screens/CoinPaxgInfo.dart';

import 'package:predicoin/asset/coinFillter.dart';
import 'package:provider/provider.dart';

import '../provider/coinBtc.dart';
import '../provider/coinEth.dart';
import '../provider/coinSol.dart';
import '../provider/coinYfi.dart';
import '../provider/coinPaxg.dart';

class HomeBodyPage extends StatefulWidget {
  const HomeBodyPage({Key? key}) : super(key: key);

  @override
  _HomeBodyPageState createState() => _HomeBodyPageState();
}

class _HomeBodyPageState extends State<HomeBodyPage> {
  dynamic btcInfo = '';
  dynamic ethInfo = '';
  dynamic solInfo = '';
  dynamic yfiInfo = '';
  dynamic paxgInfo = '';
  Future<dynamic> getBtcInfo(BuildContext context) async {
    try {
      //print('hello');
      btcInfo =
          await Provider.of<CoinBtc>(context, listen: false).fetchRequest();
      ethInfo =
          await Provider.of<CoinEth>(context, listen: false).fetchRequest();
      solInfo =
          await Provider.of<CoinSol>(context, listen: false).fetchRequest();
      yfiInfo =
          await Provider.of<CoinYfi>(context, listen: false).fetchRequest();
      paxgInfo =
          await Provider.of<CoinPaxg>(context, listen: false).fetchRequest();
    } catch (err) {
      print(err);
    }
    return btcInfo;
  }

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff161A1F),
      body: FutureBuilder(
          future: getBtcInfo(context),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                  child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white)));
            } else {
              return Padding(
                padding: const EdgeInsets.only(left: 14.0, right: 14, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        "Crypto Coin",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      children: [
                        //coin list on homepage
                        //shrinkWrap: true,
                        //physics: NeverScrollableScrollPhysics(),
                        Container(
                          height: 10,
                          width: 70,
                        ),
                        Container(
                          width: 100,
                          margin: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.11),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                height: 35,
                                child: Text(
                                  "Price",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                height: 35,
                                child: Text(
                                  "24h Change",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) {
                                        return BtcInfoPage();
                                      }),
                                    );
                                  },
                                  child: Card(
                                    color: Color(0xff2D3035),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    elevation: 3,
                                    child: Row(
                                      children: [
                                        Container(
                                            height: 50,
                                            child: TextButton(
                                              onPressed: () {
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                    return BtcInfoPage();
                                                  }),
                                                );
                                              },
                                              child: Text('BTC',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white)),
                                            )),
                                        Container(
                                          width: 106,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.11),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                  child: Text(
                                                      '${double.parse((btcInfo[0]['${btcInfo[0].length - 1}']['Close']).toString()).toStringAsFixed(2)}',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color:
                                                              Colors.white))),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 100,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8),
                                                child: Container(
                                                    child: Text(
                                                        '${(double.parse((btcInfo[0]['${btcInfo[0].length - 1}']['24hchange']).toString()) * 100).toStringAsFixed(2)} %',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color:
                                                                Colors.white))),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) {
                                        return EthInfoPage();
                                      }),
                                    );
                                  },
                                  child: Card(
                                    color: Color(0xff2D3035),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    elevation: 3,
                                    child: Row(
                                      children: [
                                        Container(
                                            height: 50,
                                            child: TextButton(
                                              onPressed: () {
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                    return EthInfoPage();
                                                  }),
                                                );
                                              },
                                              child: Text('ETH',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white)),
                                            )),
                                        Container(
                                          width: 106,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.11),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                  child: Text(
                                                      '${double.parse((ethInfo[0]['${ethInfo[0].length - 1}']['Close']).toString()).toStringAsFixed(2)}',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color:
                                                              Colors.white))),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 100,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8),
                                                child: Container(
                                                    width: 63,
                                                    child: Text(
                                                        '${(double.parse((ethInfo[0]['${ethInfo[0].length - 1}']['24hchange']).toString()) * 100).toStringAsFixed(2)} %',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color:
                                                                Colors.white))),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) {
                                        return SolInfoPage();
                                      }),
                                    );
                                  },
                                  child: Card(
                                    color: Color(0xff2D3035),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    elevation: 3,
                                    child: Row(
                                      children: [
                                        Container(
                                            height: 50,
                                            child: TextButton(
                                              onPressed: () {
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                    return SolInfoPage();
                                                  }),
                                                );
                                              },
                                              child: Text('SOL',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white)),
                                            )),
                                        Container(
                                          width: 106,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.11),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                  child: Text(
                                                      '${double.parse((solInfo[0]['${solInfo[0].length - 1}']['Close']).toString()).toStringAsFixed(2)}',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color:
                                                              Colors.white))),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 100,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8),
                                                child: Container(
                                                    child: Text(
                                                        '${(double.parse((solInfo[0]['${solInfo[0].length - 1}']['24hchange']).toString()) * 100).toStringAsFixed(2)} %',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color:
                                                                Colors.white))),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) {
                                        return YfiInfoPage();
                                      }),
                                    );
                                  },
                                  child: Card(
                                    color: Color(0xff2D3035),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    elevation: 3,
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Container(
                                                height: 50,
                                                child: TextButton(
                                                  onPressed: () {
                                                    Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) {
                                                        return YfiInfoPage();
                                                      }),
                                                    );
                                                  },
                                                  child: Text('YFI',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.white)),
                                                )),
                                          ],
                                        ),
                                        Container(
                                          width: 106,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.11),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                  child: Text(
                                                      '${double.parse((yfiInfo[0]['${yfiInfo[0].length - 1}']['Close']).toString()).toStringAsFixed(2)}',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color:
                                                              Colors.white))),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 100,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8),
                                                child: Container(
                                                    child: Text(
                                                        '${(double.parse((yfiInfo[0]['${yfiInfo[0].length - 1}']['24hchange']).toString()) * 100).toStringAsFixed(2)} %',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color:
                                                                Colors.white))),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) {
                                        return PaxgInfoPage();
                                      }),
                                    );
                                  },
                                  child: Card(
                                    color: Color(0xff2D3035),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    elevation: 3,
                                    child: Row(
                                      children: [
                                        Container(
                                            height: 50,
                                            child: TextButton(
                                              onPressed: () {
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                    return PaxgInfoPage();
                                                  }),
                                                );
                                              },
                                              child: Text('PAXG',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white)),
                                            )),
                                        Container(
                                          width: 106,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.11),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                  child: Text(
                                                      '${double.parse((paxgInfo[0]['${paxgInfo[0].length - 1}']['Close']).toString()).toStringAsFixed(2)}',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color:
                                                              Colors.white))),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 100,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8),
                                                child: Container(
                                                    child: Text(
                                                        '${(double.parse((paxgInfo[0]['${paxgInfo[0].length - 1}']['24hchange']).toString()) * 100).toStringAsFixed(2)} %',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color:
                                                                Colors.white))),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          }),
    );
  }
}
