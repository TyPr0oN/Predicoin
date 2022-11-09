import 'package:flutter/material.dart';
import 'package:predicoin/widget/coinYfiPriceChart.dart';
import 'package:provider/provider.dart';

import '../asset/chartFillter.dart';
import '../asset/coinStats.dart';
import '../provider/coinYfi.dart';
import 'Home.dart';

class YfiInfoPage extends StatefulWidget {
  const YfiInfoPage({Key? key}) : super(key: key);

  @override
  State<YfiInfoPage> createState() => _YfiInfoPageState();
}

class _YfiInfoPageState extends State<YfiInfoPage> {
  dynamic yfiInfo = '';
  Future<dynamic> getYfiInfo(BuildContext context) async {
    try {
      yfiInfo = await Provider.of<CoinYfi>(context, listen: false).fetchRequest();
    } catch (err) {
      print(err);
    }
    return yfiInfo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: Color(0xff2D3035),
      body: FutureBuilder(
        future: getYfiInfo(context),
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
                                  backgroundColor: MaterialStateProperty.all(Color(0xFF2D3035)),
                                ),
                                icon: Icon(Icons.chevron_left),
                                label: Text(''),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(1),
                              child: Text(
                                'YFI',
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
                                      child: WidgetYfiPriceChart(coinInfo: yfiInfo, lineColor: Colors.blue),
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
                              child: CoinStats(coinInfo: yfiInfo),
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
