import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:predicoin/screens/Home.dart';
import 'package:predicoin/screens/BacktestResult.dart';
import 'package:provider/provider.dart';

import '../provider/backtestBtc.dart';

class BacktestPage extends StatefulWidget {
  const BacktestPage({Key? key}) : super(key: key);

  @override
  _BacktestPageState createState() => _BacktestPageState();
}

class _BacktestPageState extends State<BacktestPage> {
  Future<void> fetchAllRequest() async {
    try {
      await Provider.of<BacktestBtc>(context, listen: false).fetchRequest();
    } catch (err) {
      print(err);
    }
  }

  late int investment_value = 0;
  @override
  String? _assetval;
  List listAssetItem = ["BTC", "ETH", "ADA"];
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
    "CANDLESTICK",
    "GRAPH",
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

  String? _strategiesval;
  List listStrategiesItem = [
    "Buy and Hold",
    "Dollar Cost Average",
    "Maximum Drawdown",
    "Bollinger Band",
    "Moving Average Convergence Divergence",
    "Simple Moving Average",
  ];
  Widget _buildStrategiesField() {
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
                value: _strategiesval,
                onChanged: (newValue) {
                  setState(() {
                    _strategiesval = newValue as String?;
                  });
                  if (newValue == "Buy and Hold") {
                    setState(() {
                      FUND = true;
                      dollarCost = false;
                    });
                  } else if (newValue == "Dollar Cost Average") {
                    setState(() {
                      FUND = false;
                      dollarCost = true;
                    });
                  } else {
                    setState(() {
                      FUND = true;
                      dollarCost = false;
                    });
                  }
                  ;
                },
                items: listStrategiesItem.map((valueItem) {
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

  String? _strategiesval2;
  List listStrategiesItem2 = [
    "BUY AND HOLD",
    "DOLLAR COST",
  ];
  Widget _buildStrategiesField2() {
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
                value: _strategiesval2,
                onChanged: (newValue) {
                  setState(() {
                    _strategiesval2 = newValue as String?;
                  });
                  if (newValue == "BUY AND HOLD") {
                    setState(() {
                      FUND = true;
                    });
                  } else if (newValue == "DOLLAR COST") {
                    setState(() {
                      dollarCost = true;
                    });
                  } else {
                    setState(() {
                      FUND = true;
                      dollarCost = false;
                    });
                  }
                  ;
                },
                items: listStrategiesItem2.map((valueItem) {
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

  bool FUND = false;
  bool dollarCost = false;
  bool compareStrategies = false;
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
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50))),
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
                              'Backtest Laboratory',
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
                      _buildMetricField2(),
                      Row(
                        children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20, left: 10),
                              child: Text(
                                'STRATEGIES',
                                style: TextStyle(
                                    fontFamily: 'Ruda',
                                    fontSize: 25,
                                    color: Color(0xFFffd030)),
                              ),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    compareStrategies = true;
                                  });
                                },
                                icon: Icon(Icons.add),
                                color: Colors.yellow,
                              ),
                            ),
                          ),
                        ],
                      ),
                      _buildStrategiesField(),
                      Visibility(
                        visible: compareStrategies,
                        child: _buildStrategiesField2(),
                      ),
                      Visibility(
                        visible: FUND,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20, left: 10),
                            child: Text(
                              'FUND',
                              style: TextStyle(
                                  fontFamily: 'Ruda',
                                  fontSize: 25,
                                  color: Color(0xFFffd030)),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: FUND,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 8),
                            child: TextFormField(
                              onChanged: ((value) =>
                                  investment_value = int.parse(value)),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 3)),
                                labelText: 'FUND',
                              ),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: dollarCost,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20, left: 10),
                            child: Text(
                              'STARTING PRINCIPAL',
                              style: TextStyle(
                                  fontFamily: 'Ruda',
                                  fontSize: 25,
                                  color: Color(0xFFffd030)),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: dollarCost,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 8),
                            child: TextFormField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 3)),
                                labelText: 'STARTING PRINCIPAL',
                              ),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: dollarCost,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20, left: 10),
                            child: Text(
                              'MONTHLY ADD',
                              style: TextStyle(
                                  fontFamily: 'Ruda',
                                  fontSize: 25,
                                  color: Color(0xFFffd030)),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: dollarCost,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 8),
                            child: TextFormField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 3)),
                                labelText: 'MONTHLY ADD',
                              ),
                            ),
                          ),
                        ),
                      ),
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
                    height: 40, //52
                    width: 90, //MediaQuery.of(context).size.width
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
                    onPressed: () {
                      //postInvest(investment_value);
                      //print(postInvest);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return BacktestResultPage(
                            investresult: investment_value,
                          );
                        }),
                      );
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
