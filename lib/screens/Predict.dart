import 'package:flutter/material.dart';
import 'package:predicoin/provider/predictFeed.dart';
import 'package:predicoin/provider/predictFeedETH.dart';
import 'package:predicoin/screens/Home.dart';
import 'package:predicoin/screens/PredictResult.dart';
import 'package:dio/dio.dart';
import 'package:predicoin/screens/predictResultEth.dart';
import 'package:predicoin/screens/predictResultPaxg.dart';
import 'package:predicoin/screens/predictResultSol.dart';
import 'package:predicoin/screens/predictResultYfi.dart';
import 'package:provider/provider.dart';

import '../provider/predictFeedPAXG.dart';
import '../provider/predictFeedSOL.dart';
import '../provider/predictFeedYFI.dart';

class PredictPage extends StatefulWidget {
  const PredictPage({Key? key}) : super(key: key);

  @override
  _PredictPageState createState() => _PredictPageState();
}

class _PredictPageState extends State<PredictPage> {
  Future<void> fetchAllRequest() async {
    try {
      await Provider.of<PredictBtcFeed>(context, listen: false).fetchRequest();
    } on DioError catch (e) {
      print('error');
      print(e);
      print(e.response);
    }
  }

  Future<void> fetchEthRequest() async {
    try {
      await Provider.of<PredictEthFeed>(context, listen: false).fetchRequest();
    } on DioError catch (e) {
      print('error');
      print(e);
      print(e.response);
    }
  }

  Future<void> fetchPaxgRequest() async {
    try {
      await Provider.of<PredictPaxgFeed>(context, listen: false).fetchRequest();
    } on DioError catch (e) {
      print('error');
      print(e);
      print(e.response);
    }
  }

  Future<void> fetchSolRequest() async {
    try {
      await Provider.of<PredictSolFeed>(context, listen: false).fetchRequest();
    } on DioError catch (e) {
      print('error');
      print(e);
      print(e.response);
    }
  }

  Future<void> fetchYfiRequest() async {
    try {
      await Provider.of<PredictYfiFeed>(context, listen: false).fetchRequest();
    } on DioError catch (e) {
      print('error');
      print(e);
      print(e.response);
    }
  }

  String? _assetval;
  List listAssetItem = ["BTC", "ETH", "PAXG", "SOL", "YFI"];
  String listedValue = '';
  Widget _buildAssetField() {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(15)),
              child: DropdownButton(
                hint: Text(""),
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 36,
                isExpanded: true,
                underline: SizedBox(),
                style: TextStyle(color: Colors.black, fontSize: 22),
                value: _assetval,
                onChanged: (newValue) {
                  setState(() {
                    _assetval = newValue as String?;
                  });
                },
                items: listAssetItem.map((valueItem) {
                  return DropdownMenuItem(
                    onTap: () => listedValue = valueItem,
                    value: valueItem,
                    child: Text(valueItem),
                  );
                }).toList(),
              ),
            ),
          ),
        ));
  }

  String? _metricval2;
  List listMetricItem2 = [
    "Line",
  ];
  Widget _buildMetricField2() {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(15)),
              child: DropdownButton(
                hint: Text(""),
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 36,
                isExpanded: true,
                underline: SizedBox(),
                style: TextStyle(color: Colors.black, fontSize: 22),
                value: _metricval2,
                onChanged: (newValue) {
                  setState(() {
                    _metricval2 = newValue as String?;
                  });
                },
                items: listMetricItem2.map((valueItem) {
                  return DropdownMenuItem(
                    value: valueItem,
                    child: Text(valueItem),
                  );
                }).toList(),
              ),
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2D3035),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
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
                                  fontSize: 25,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20, left: 10),
                          child: Text(
                            'Asset',
                            style: TextStyle(
                                fontFamily: 'Ruda',
                                fontSize: 25,
                                color: Color(0xFFffd030)),
                          ),
                        ),
                      ),
                      _buildAssetField(),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20, left: 10),
                          child: Text(
                            'METRIC',
                            style: TextStyle(
                                fontFamily: 'Ruda',
                                fontSize: 25,
                                color: Color(0xFFffd030)),
                          ),
                        ),
                      ),
                      _buildMetricField2()
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(
                    height: 50, //40
                    width: MediaQuery.of(context).size.width, //90
                  ),
                  child: TextButton(
                    child: Text(
                      "Create",
                      style: TextStyle(color: Color(0xff2D3035), fontSize: 24),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFFFE042),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () async {
                      switch (listedValue) {
                        case 'BTC':
                          fetchAllRequest();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return PredictResultPage();
                            }),
                          );
                          break;
                        case 'ETH':
                          fetchEthRequest();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return PredictResultPageEth();
                            }),
                          );
                          break;
                        case 'PAXG':
                          fetchEthRequest();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return PredictResultPagePaxg();
                            }),
                          );
                          break;
                        case 'SOL':
                          fetchEthRequest();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return PredictResultPageSol();
                            }),
                          );
                          break;
                        case 'YFI':
                          fetchEthRequest();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return PredictResultPageYfi();
                            }),
                          );
                          break;
                        default:
                      }
                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(builder: (context) {
                      //     return PredictResultPage();
                      //   }),
                      // );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
