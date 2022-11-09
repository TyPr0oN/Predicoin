import 'package:flutter/material.dart';
import 'package:predicoin/screens/CoinEthInfo.dart';
import 'package:predicoin/screens/Backtest.dart';
import 'package:predicoin/screens/Predict.dart';
import 'package:predicoin/widget/coinBtcPriceChart.dart';
import 'package:provider/provider.dart';

import '../asset/chartFillter.dart';
import '../asset/coinStats.dart';
import '../provider/coinBtc.dart';
import 'Home.dart';

class BtcInfoPage extends StatefulWidget {
  const BtcInfoPage({Key? key}) : super(key: key);

  @override
  _BtcInfoPageState createState() => _BtcInfoPageState();
}

class _BtcInfoPageState extends State<BtcInfoPage> {
  dynamic btcInfo = '';
  Future<dynamic> getBtcInfo(BuildContext context) async {
    try {
      //print('hello');
      btcInfo = await Provider.of<CoinBtc>(context, listen: false).fetchRequest();
      // print(btcInfo[0]["0"]['Close'] + 'test');
    } catch (err) {
      print(err);
    }
    return btcInfo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: Color(0xff2D3035),
      body: FutureBuilder(
        future: getBtcInfo(context),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
                child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white)));
          } else {
            return Padding(
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
                              padding: const EdgeInsets.all(1),
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return HomePage();
                                    }),
                                  );
                                },
                                style: ButtonStyle(
                                  // shape: MaterialStateProperty.all(
                                  //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
                                  backgroundColor: MaterialStateProperty.all(Color(0xFF2D3035)),
                                ),
                                icon: Icon(Icons.chevron_left),
                                label: Text(''),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(1),
                              child: Text(
                                'BTC',
                                style: TextStyle(fontFamily: 'Ruda', fontSize: 25, color: Color(0xFFffd030)),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 300,
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.only(
                                        top: 30,
                                        bottom: 10,
                                      ),
                                      // child: AssetPriceChart(
                                      //   lineColor: Colors.blue,
                                      //   coinInfo: btcInfo,
                                      // ),
                                      child: WidgetBtcPriceChart(coinInfo: btcInfo, lineColor: Colors.blue),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: ChartFilter(
                                onPressed: () {},
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: CoinStats(coinInfo: btcInfo),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
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
