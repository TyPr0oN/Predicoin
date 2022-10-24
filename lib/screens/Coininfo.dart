import 'package:flutter/material.dart';
import 'package:predicoin/screens/coinInfoBody.dart';
import 'package:predicoin/screens/Backtest.dart';
import 'package:predicoin/screens/Predict.dart';
import 'package:provider/provider.dart';

import '../asset/chartFillter.dart';
import '../asset/coinStats.dart';
import '../asset/priceChart.dart';
import '../provider/coinBtc.dart';
import 'Home.dart';

class CoininfoPage extends StatefulWidget {
  const CoininfoPage({Key? key}) : super(key: key);

  @override
  _CoininfoPageState createState() => _CoininfoPageState();
}

class _CoininfoPageState extends State<CoininfoPage> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: Color(0xff2D3035),
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
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xFF2D3035)),
                          ),
                          icon: Icon(Icons.chevron_left),
                          label: Text(''),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1),
                        child: Text(
                          'BTC',
                          style: TextStyle(
                              fontFamily: 'Ruda',
                              fontSize: 25,
                              color: Color(0xFFffd030)),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(
                                  top: 30,
                                  bottom: 10,
                                ),
                                child: AssetPriceChart(
                                  lineColor: Colors.blue,
                                ),
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
                        child: CoinStats(),
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
