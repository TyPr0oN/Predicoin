import 'package:flutter/material.dart';
import 'package:predicoin/screens/Home.dart';
import 'package:predicoin/screens/PredictResult.dart';
class PredictPage extends StatefulWidget {
  const PredictPage({Key? key}) : super(key: key);

  @override
  _PredictPageState createState() => _PredictPageState();
}

class _PredictPageState extends State<PredictPage> {
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
                              // shape: MaterialStateProperty.all(
                              //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
                              backgroundColor: MaterialStateProperty.all(Color(0xFF2D3035)),
                            ), icon: Icon(Icons.chevron_left), label: Text(''),
                            ),
                          ),
                          Padding(padding: const EdgeInsets.all(1),
                            child: Text(
                              'Predict',
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
                    height: 52, //40
                    width: MediaQuery.of(context).size.width, //90
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
                        return PredictResultPage();
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