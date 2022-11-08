import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:predicoin/screens/homeBody.dart';
import 'package:predicoin/asset/buttomBar.dart';
import 'package:predicoin/screens/Home.dart';

import 'package:predicoin/asset/priceChart.dart';
import 'package:predicoin/asset/chartFillter.dart';
import 'package:predicoin/asset/coinStats.dart';

class coinInfoBodyPage extends StatelessWidget {
  const coinInfoBodyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        // child: CoinStats(coinInfo: null,

                        // ),
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
}
