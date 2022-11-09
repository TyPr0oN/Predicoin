import 'package:flutter/material.dart';
import 'package:predicoin/screens/Home.dart';
import 'package:predicoin/asset/priceChart.dart';
import 'package:predicoin/Widget/financialCharts.dart';
import 'package:predicoin/widget/financialChartsol.dart';
import 'package:provider/provider.dart';

import '../provider/predictFeedSOL.dart';

class PredictResultPageSol extends StatefulWidget {
  const PredictResultPageSol({Key? key}) : super(key: key);

  @override
  _PredictResultPageState createState() => _PredictResultPageState();
}

class _PredictResultPageState extends State<PredictResultPageSol> {
  dynamic solPredict = '';
  Future<dynamic> getPredict(BuildContext context) async {
    try {
      solPredict = await Provider.of<PredictSolFeed>(context, listen: false)
          .fetchRequest();

      //print(solPredict[1]['name'] + 'test');
      //print(solPredict[0][0]);
      //print(solPredict[0]['16']['next_predicted_days_value']);
    } catch (err) {
      print(err);
    }
    return solPredict;
  }

  @override
  void initState() {
    // TODO: implement initState
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   context.read<PredictsolFeed>().fetchRequest();
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
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xFF2D3035)),
                                ),
                                icon: Icon(Icons.chevron_left),
                                label: Text(''),
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
                                      solPredict[1]['name'],
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
                                        top: 30,
                                        bottom: 10,
                                      ),
                                      child: WidgetFinancialChartSol(
                                          solPredict:
                                              solPredict), //AssetPriceChart(lineColor: Colors.blue,),
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
                                  'Next 7 Days prices',
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
                          padding: const EdgeInsets.only(top: 15.0),
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
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(1),
                                        child: Text(
                                          '6th Days',
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
                                          '7th Days',
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
                                          '${double.parse((solPredict[0][365]['test_predicted_close']).toString()).toStringAsFixed(2)} USD',
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
                                          '${double.parse((solPredict[0][366]['test_predicted_close']).toString()).toStringAsFixed(2)} USD',
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
                                          '${double.parse((solPredict[0][367]['test_predicted_close']).toString()).toStringAsFixed(2)} USD',
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
                                          '${double.parse((solPredict[0][368]['test_predicted_close']).toString()).toStringAsFixed(2)} USD',
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
                                          '${double.parse((solPredict[0][369]['test_predicted_close']).toString()).toStringAsFixed(2)} USD',
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
                                          '${double.parse((solPredict[0][370]['test_predicted_close']).toString()).toStringAsFixed(2)} USD',
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
                                          '${double.parse((solPredict[0][371]['test_predicted_close']).toString()).toStringAsFixed(2)} USD',
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
      title: Image.asset(
        'assets/logo/predicoin.png',
        height: 37,
      ),
    );
  }
}
