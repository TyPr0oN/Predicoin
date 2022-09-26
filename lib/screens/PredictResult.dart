import 'package:flutter/material.dart';
import 'package:predicoin/screens/Home.dart';
import 'package:predicoin/asset/priceChart.dart';
import 'package:predicoin/asset/financialCharts.dart';

class PredictResultPage extends StatefulWidget {
  const PredictResultPage({Key? key}) : super(key: key);

  @override
  _PredictResultPageState createState() => _PredictResultPageState();
}

class _PredictResultPageState extends State<PredictResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2D3035),
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(padding: EdgeInsets.all(1),
                      child: ElevatedButton.icon(onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                          return HomePage();
                        }),
                        );
                      },style: ButtonStyle(
                        // shape: MaterialStateProperty.all(
                        //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
                        backgroundColor: MaterialStateProperty.all(Color(0xFF2D3035)),
                      ), icon: Icon(Icons.chevron_left), label: Text(''),
                      ),
                    ),
                    Padding(padding: const EdgeInsets.all(1),
                      child: Text(
                        'Predict',
                        style: TextStyle(fontFamily: 'Ruda', fontSize: 29, color: Colors.white),
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
                          child: Padding(padding: const EdgeInsets.all(1),
                            child: Text(
                              'BTC',
                              style: TextStyle(fontFamily: 'Ruda', fontSize: 26, color: Color(0xFFffd030)),
                            ),
                          ),
                        ),
                        Container(
                          child: Padding(padding: const EdgeInsets.all(1),
                            child: Text(
                              '29427.34',
                              style: TextStyle(fontFamily: 'Ruda', fontSize: 20, color: Color(0xFFffd030)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 105.0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Padding(padding: const EdgeInsets.all(1),
                                  child: Text(
                                    '24h High',
                                    style: TextStyle(fontFamily: 'Ruda', fontSize: 16, color: Color(0xFF8E7A2D)),
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(padding: const EdgeInsets.all(1),
                                  child: Text(
                                    '30982.70',
                                    style: TextStyle(fontFamily: 'Ruda', fontSize: 16, color: Color(0xFFffd030)),
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(padding: const EdgeInsets.all(1),
                                  child: Text(
                                    '24h Low',
                                    style: TextStyle(fontFamily: 'Ruda', fontSize: 16, color: Color(0xFF8E7A2D)),
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(padding: const EdgeInsets.all(1),
                                  child: Text(
                                    '28611.70',
                                    style: TextStyle(fontFamily: 'Ruda', fontSize: 16, color: Color(0xFFffd030)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      child: Padding(padding: const EdgeInsets.all(1),
                                        child: Text(
                                          '24h Vol',
                                          style: TextStyle(fontFamily: 'Ruda', fontSize: 16, color: Color(0xFF8E7A2D)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Padding(padding: const EdgeInsets.all(1),
                                        child: Text(
                                          '\(BTC\)',
                                          style: TextStyle(fontFamily: 'Ruda', fontSize: 16, color: Color(0xFF8E7A2D)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  child: Padding(padding: const EdgeInsets.all(1),
                                    child: Text(
                                      '30982.70',
                                      style: TextStyle(fontFamily: 'Ruda', fontSize: 16, color: Color(0xFFffd030)),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      child: Padding(padding: const EdgeInsets.all(1),
                                        child: Text(
                                          '24h Vol',
                                          style: TextStyle(fontFamily: 'Ruda', fontSize: 16, color: Color(0xFF8E7A2D)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Padding(padding: const EdgeInsets.all(1),
                                        child: Text(
                                          '\(THB\)',
                                          style: TextStyle(fontFamily: 'Ruda', fontSize: 16, color: Color(0xFF8E7A2D)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  child: Padding(padding: const EdgeInsets.all(1),
                                    child: Text(
                                      '28611.70',
                                      style: TextStyle(fontFamily: 'Ruda', fontSize: 16, color: Color(0xFFffd030)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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
                          Expanded(child: Container(
                            padding: EdgeInsets.only(
                              top: 30,
                              bottom: 10,
                            ),
                            child: AssetFinancialChart(), //AssetPriceChart(lineColor: Colors.blue,),
                          ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Padding(padding: const EdgeInsets.all(1),
                        child: Text(
                          'Next 7 Days prices',
                          style: TextStyle(fontFamily: 'Ruda', fontSize: 25, color: Color(0xFFffd030)),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Padding(padding: const EdgeInsets.all(1),
                                child: Text(
                                  '1st Days',
                                  style: TextStyle(fontFamily: 'Ruda', fontSize: 20, color: Color(0xFFffd030)),
                                ),
                              ),
                            ),
                            Container(
                              child: Padding(padding: const EdgeInsets.all(1),
                                child: Text(
                                  '2nd Days',
                                  style: TextStyle(fontFamily: 'Ruda', fontSize: 20, color: Color(0xFFffd030)),
                                ),
                              ),
                            ),
                            Container(
                              child: Padding(padding: const EdgeInsets.all(1),
                                child: Text(
                                  '3rd Days',
                                  style: TextStyle(fontFamily: 'Ruda', fontSize: 20, color: Color(0xFFffd030)),
                                ),
                              ),
                            ),
                            Container(
                              child: Padding(padding: const EdgeInsets.all(1),
                                child: Text(
                                  '4th Days',
                                  style: TextStyle(fontFamily: 'Ruda', fontSize: 20, color: Color(0xFFffd030)),
                                ),
                              ),
                            ),
                            Container(
                              child: Padding(padding: const EdgeInsets.all(1),
                                child: Text(
                                  '5th Days',
                                  style: TextStyle(fontFamily: 'Ruda', fontSize: 20, color: Color(0xFFffd030)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 130.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Padding(padding: const EdgeInsets.all(1),
                                child: Text(
                                  '2000 \USD',
                                  style: TextStyle(fontFamily: 'Ruda', fontSize: 20, color: Color(0xFFffd030)),
                                ),
                              ),
                            ),
                            Container(
                              child: Padding(padding: const EdgeInsets.all(1),
                                child: Text(
                                  '1997 \USD',
                                  style: TextStyle(fontFamily: 'Ruda', fontSize: 20, color: Color(0xFFffd030)),
                                ),
                              ),
                            ),
                            Container(
                              child: Padding(padding: const EdgeInsets.all(1),
                                child: Text(
                                  '1992 \USD',
                                  style: TextStyle(fontFamily: 'Ruda', fontSize: 20, color: Color(0xFFffd030)),
                                ),
                              ),
                            ),
                            Container(
                              child: Padding(padding: const EdgeInsets.all(1),
                                child: Text(
                                  '2008 \USD',
                                  style: TextStyle(fontFamily: 'Ruda', fontSize: 20, color: Color(0xFFffd030)),
                                ),
                              ),
                            ),
                            Container(
                              child: Padding(padding: const EdgeInsets.all(1),
                                child: Text(
                                  '2022 \USD',
                                  style: TextStyle(fontFamily: 'Ruda', fontSize: 20, color: Color(0xFFffd030)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Image.asset('assets/logo/predicoin.png',height: 37,),
    );
  }
}
