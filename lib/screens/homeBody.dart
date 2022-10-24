import 'package:flutter/material.dart';
import 'package:predicoin/main.dart';
import 'package:predicoin/screens/Coininfo.dart';

import 'package:predicoin/asset/coinFillter.dart';
import 'package:provider/provider.dart';

import '../provider/coinBtc.dart';

class HomeBodyPage extends StatefulWidget {
  const HomeBodyPage({Key? key}) : super(key: key);

  @override
  _HomeBodyPageState createState() => _HomeBodyPageState();
}

class _HomeBodyPageState extends State<HomeBodyPage> {
  dynamic btcInfo = '';
  Future<dynamic> getBtcInfo(BuildContext context) async {
    try {
      //print('hello');
      btcInfo =
          await Provider.of<CoinBtc>(context, listen: false).fetchRequest();
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
      backgroundColor: Color(0xff2D3035),
      body: FutureBuilder(
          future: getBtcInfo(context),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                  child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white)));
            } else {
              return Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
                child: SingleChildScrollView(
                  physics: ScrollPhysics(),
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
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: CoinFillter(
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: [
                      //     Text(
                      //       "Price",
                      //       style: TextStyle(color: Colors.white),
                      //     ),
                      //     Padding(
                      //       padding: const EdgeInsets.only(left: 80.0),
                      //       child: Text(
                      //         "Volume",
                      //         style: TextStyle(color: Colors.white),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      Row(
                        children: [
                          Column(
                            //coin list on homepage
                            //shrinkWrap: true,
                            //physics: NeverScrollableScrollPhysics(),

                            children: <Widget>[
                              Container(
                                height: 23,
                              ),
                              Container(
                                  height: 50,
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) {
                                          return CoininfoPage();
                                        }),
                                      );
                                    },
                                    child: Text('BTC',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white)),
                                  )),
                              Container(
                                  height: 50,
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) {
                                          return CoininfoPage();
                                        }),
                                      );
                                    },
                                    child: Text('ETH',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white)),
                                  )),
                              Container(
                                  height: 50,
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) {
                                          return CoininfoPage();
                                        }),
                                      );
                                    },
                                    child: Text('APT',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white)),
                                  )),
                            ],
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
                                  height: 50,
                                  child: Text(
                                    "Price",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Container(
                                    height: 50,
                                    child: Text(
                                        '${double.parse((btcInfo[0]['${btcInfo[0].length - 1}']['Close']).toString()).toStringAsFixed(2)}',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white))),
                                Container(
                                    height: 50,
                                    child: Text('1,332.52',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white))),
                                Container(
                                    height: 50,
                                    child: Text('9.2772',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white))),
                              ],
                            ),
                          ),
                          Container(
                            width: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  height: 50,
                                  child: Text(
                                    "24h Change",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Container(
                                    height: 50,
                                    child: Text(
                                        '${(double.parse((btcInfo[0]['${btcInfo[0].length - 1}']['24hchange']).toString()) * 100).toStringAsFixed(2)} %',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white))),
                                Container(
                                    height: 50,
                                    child: Text('+1.45%',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white))),
                                Container(
                                    height: 50,
                                    child: Text('+6.13%',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white))),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }
}
