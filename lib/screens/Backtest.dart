import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:predicoin/screens/Home.dart';
import 'package:predicoin/screens/BacktestResult.dart';

class BacktestPage extends StatefulWidget {
  const BacktestPage({Key? key}) : super(key: key);

  @override
  _BacktestPageState createState() => _BacktestPageState();
}

class _BacktestPageState extends State<BacktestPage> {
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
  List listMetricItem2 = ["CANDLESTICK", "GRAPH",];
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
  List listStrategiesItem = ["BUY AND HOLD", "DOLLAR COST",];
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
                          Padding(padding: EdgeInsets.all(1),
                            child: ElevatedButton.icon(onPressed: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                                return HomePage();
                              }),
                              );
                            },style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
                              backgroundColor: MaterialStateProperty.all(Color(0xFF2D3035)),
                            ), icon: Icon(Icons.chevron_left), label: Text(''),
                            ),
                          ),
                          Padding(padding: const EdgeInsets.all(1),
                            child: Text(
                              'Backtest Laboratory',
                              style: TextStyle(fontFamily: 'Ruda', fontSize: 25, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: Padding(padding: const EdgeInsets.only(top: 20,left: 10),
                          child: Text(
                            'Asset',
                            style: TextStyle(fontFamily: 'Ruda', fontSize: 25, color: Color(0xFFffd030)),
                          ),
                        ),
                      ),
                      _buildAssetField(),
                      Container(
                        child: Padding(padding: const EdgeInsets.only(top: 20,left: 10),
                          child: Text(
                            'METRIC',
                            style: TextStyle(fontFamily: 'Ruda', fontSize: 25, color: Color(0xFFffd030)),
                          ),
                        ),
                      ),
                      _buildMetricField2(),
                      Container(
                        child: Padding(padding: const EdgeInsets.only(top: 20,left: 10),
                          child: Text(
                            'STRATEGIES',
                            style: TextStyle(fontFamily: 'Ruda', fontSize: 25, color: Color(0xFFffd030)),
                          ),
                        ),
                      ),
                      _buildStrategiesField(),
                      Container(
                        child: Padding(padding: const EdgeInsets.only(top: 20,left: 10),
                          child: Text(
                            'FUND',
                            style: TextStyle(fontFamily: 'Ruda', fontSize: 25, color: Color(0xFFffd030)),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 8),
                          child: TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.black, width: 3)
                              ),
                              labelText: 'FUND',
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
                    child: Text("Create", style: TextStyle(fontSize: 24),),
                      style: ElevatedButton.styleFrom(primary: Color(0xFFFFE042),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                       ),
                      onPressed: () async {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                          return BacktestResultPage();
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
