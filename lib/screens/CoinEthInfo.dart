import 'package:flutter/material.dart';
import 'package:predicoin/screens/homeBody.dart';
import 'package:predicoin/asset/buttomBar.dart';
import 'package:predicoin/widget/coinEthPriceChart.dart';
import 'package:provider/provider.dart';

import '../asset/chartFillter.dart';
import '../asset/coinStats.dart';
import '../provider/coinEth.dart';
import 'Home.dart';

class EthInfoPage extends StatefulWidget {
  EthInfoPage({Key? key}) : super(key: key);

  @override
  State<EthInfoPage> createState() => _EthInfoPageState();
}

class _EthInfoPageState extends State<EthInfoPage> {
  dynamic ethInfo = '';
  Future<dynamic> getEthInfo(BuildContext context) async {
    try {
      ethInfo =
          await Provider.of<CoinEth>(context, listen: false).fetchRequest();
    } catch (err) {
      print(err);
    }
    return ethInfo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: Color(0xff2D3035),
      body: FutureBuilder(
        future: getEthInfo(context),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white)));
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
                              child: IconButton(
                                color: Color(0xFFffd030),
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
                            ),
                            Padding(
                              padding: const EdgeInsets.all(1),
                              child: Text(
                                'ETH',
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
                              height: 300,
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(1, 30, 15, 10
                                          // top: 30,
                                          // bottom: 10,
                                          ),
                                      child: WidgetEthPriceChart(
                                          coinInfo: ethInfo,
                                          lineColor: Colors.blue),
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
                              child: CoinStats(coinInfo: ethInfo),
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
