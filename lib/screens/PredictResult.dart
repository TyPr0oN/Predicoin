import 'package:flutter/material.dart';
import 'package:predicoin/screens/Home.dart';
import 'package:predicoin/asset/priceChart.dart';
import 'package:predicoin/Widget/financialCharts.dart';
import 'package:provider/provider.dart';

import '../provider/predictFeed.dart';

class PredictResultPage extends StatefulWidget {
  const PredictResultPage({Key? key}) : super(key: key);

  @override
  _PredictResultPageState createState() => _PredictResultPageState();
}

class _PredictResultPageState extends State<PredictResultPage> {
  dynamic btcPredict = '';
  Future<dynamic> getPredict(BuildContext context) async {
    try {
      btcPredict = await Provider.of<PredictBtcFeed>(context, listen: false)
          .fetchRequest();

      //print(btcPredict[1]['name'] + 'test');
      //print(btcPredict[0][0]);
      //print(btcPredict[0]['16']['next_predicted_days_value']);
    } catch (err) {
      print(err);
    }
    return btcPredict;
  }

  @override
  void initState() {
    // TODO: implement initState
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   context.read<PredictBtcFeed>().fetchRequest();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff2D3035),
        appBar: buildAppBar(context),
        body: FutureBuilder(
          future: getPredict(context),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                  child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white)));
            } else {
              return SingleChildScrollView(
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(1),
                              child: IconButton(
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
                            ),
                            Padding(
                              padding: const EdgeInsets.all(1),
                              child: Text(
                                'Predict',
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
                                      btcPredict[1]['name'],
                                      style: TextStyle(
                                          fontFamily: 'Ruda',
                                          fontSize: 38,
                                          color: Color(0xFFffd030)),
                                    ),
                                  ),
                                ),
                              ],
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
                                        top: 15,
                                        bottom: 10,
                                      ),
                                      child: WidgetFinancialChart(
                                          btcPredict:
                                              btcPredict), //AssetPriceChart(lineColor: Colors.blue,),
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
                              child: Padding(
                                padding: const EdgeInsets.all(1),
                                child: Text(
                                  'Next 5 Days prices',
                                  style: TextStyle(
                                      fontFamily: 'Ruda',
                                      fontSize: 25,
                                      color: Color(0xFFffd030)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(1),
                                        child: Text(
                                          '1st Days',
                                          style: TextStyle(
                                              fontFamily: 'Ruda',
                                              fontSize: 20,
                                              color: Color(0xFFffd030)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(1),
                                        child: Text(
                                          '2nd Days',
                                          style: TextStyle(
                                              fontFamily: 'Ruda',
                                              fontSize: 20,
                                              color: Color(0xFFffd030)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(1),
                                        child: Text(
                                          '3rd Days',
                                          style: TextStyle(
                                              fontFamily: 'Ruda',
                                              fontSize: 20,
                                              color: Color(0xFFffd030)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(1),
                                        child: Text(
                                          '4th Days',
                                          style: TextStyle(
                                              fontFamily: 'Ruda',
                                              fontSize: 20,
                                              color: Color(0xFFffd030)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(1),
                                        child: Text(
                                          '5th Days',
                                          style: TextStyle(
                                              fontFamily: 'Ruda',
                                              fontSize: 20,
                                              color: Color(0xFFffd030)),
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
                                      child: Padding(
                                        padding: const EdgeInsets.all(1),
                                        child: Text(
                                          '${double.parse((btcPredict[0][365]['test_predicted_close']).toString()).toStringAsFixed(2)} USD',
                                          style: TextStyle(
                                              fontFamily: 'Ruda',
                                              fontSize: 20,
                                              color: Color(0xFFffd030)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(1),
                                        child: Text(
                                          '${double.parse((btcPredict[0][366]['test_predicted_close']).toString()).toStringAsFixed(2)} USD',
                                          style: TextStyle(
                                              fontFamily: 'Ruda',
                                              fontSize: 20,
                                              color: Color(0xFFffd030)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(1),
                                        child: Text(
                                          '${double.parse((btcPredict[0][367]['test_predicted_close']).toString()).toStringAsFixed(2)} USD',
                                          style: TextStyle(
                                              fontFamily: 'Ruda',
                                              fontSize: 20,
                                              color: Color(0xFFffd030)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(1),
                                        child: Text(
                                          '${double.parse((btcPredict[0][368]['test_predicted_close']).toString()).toStringAsFixed(2)} USD',
                                          style: TextStyle(
                                              fontFamily: 'Ruda',
                                              fontSize: 20,
                                              color: Color(0xFFffd030)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(1),
                                        child: Text(
                                          '${double.parse((btcPredict[0][369]['test_predicted_close']).toString()).toStringAsFixed(2)} USD',
                                          style: TextStyle(
                                              fontFamily: 'Ruda',
                                              fontSize: 20,
                                              color: Color(0xFFffd030)),
                                        ),
                                      ),
                                    ),
                                  ],
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
                                padding: const EdgeInsets.only(top: 10.0),
                                //padding: const EdgeInsets.all(1),
                                child: Text(
                                  'R-Square',
                                  style: TextStyle(
                                      fontFamily: 'Ruda',
                                      fontSize: 25,
                                      color: Color(0xFFffd030)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Padding(
                                //padding: const EdgeInsets.only(top: 10.0),
                                padding: const EdgeInsets.all(1),
                                child: Text(
                                  '${double.parse((btcPredict[3]['R-Square'] * 100).toString()).toStringAsFixed(2)} %',
                                  style: TextStyle(
                                      fontFamily: 'Ruda',
                                      fontSize: 18,
                                      color: Color(0xFFffd030)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                //padding: const EdgeInsets.all(1),
                                child: Text(
                                  'RMSE',
                                  style: TextStyle(
                                      fontFamily: 'Ruda',
                                      fontSize: 25,
                                      color: Color(0xFFffd030)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Padding(
                                //padding: const EdgeInsets.only(top: 10.0),
                                padding: const EdgeInsets.all(1),
                                child: Text(
                                  '${double.parse((btcPredict[2]['RMSE']).toString()).toStringAsFixed(2)} ',
                                  style: TextStyle(
                                      fontFamily: 'Ruda',
                                      fontSize: 18,
                                      color: Color(0xFFffd030)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                //padding: const EdgeInsets.all(1),
                                child: Text(
                                  'MAPE',
                                  style: TextStyle(
                                      fontFamily: 'Ruda',
                                      fontSize: 25,
                                      color: Color(0xFFffd030)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Padding(
                                //padding: const EdgeInsets.only(top: 10.0),
                                padding: const EdgeInsets.all(1),
                                child: Text(
                                  '${double.parse((btcPredict[4]['MAPE'] * 100).toString()).toStringAsFixed(2)} %',
                                  style: TextStyle(
                                      fontFamily: 'Ruda',
                                      fontSize: 18,
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
              );
            }
          },
        ));
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
