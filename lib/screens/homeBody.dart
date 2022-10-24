import 'package:flutter/material.dart';
import 'package:predicoin/main.dart';
import 'package:predicoin/screens/Coininfo.dart';

import 'package:predicoin/asset/coinFillter.dart';

class homeBodyPage extends StatelessWidget {
  const homeBodyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2D3035),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  "Crypto Coin",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: CoinFillter(
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     Text(
              //       "Price",
              //       style: TextStyle(color: Colors.white),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.only(left: 80.0),
              //       child: Text(
              //         "Volume",
              //         style: TextStyle(color: Colors.white),
              //       ),
              //     ),
              //   ],
              // ),
              Row(
                children: [
                  Column(
                    //coin list on homepage
                    //shrinkWrap: true,
                    //physics: NeverScrollableScrollPhysics(),

                    children: <Widget>[
                      Container(
                        height: 23,
                      ),
                      Container(
                          height: 50,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return CoininfoPage();
                                }),
                              );
                            },
                            child: Text('BTC',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white)),
                          )),
                      Container(
                          height: 50,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return CoininfoPage();
                                }),
                              );
                            },
                            child: Text('ETH',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white)),
                          )),
                      Container(
                          height: 50,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return CoininfoPage();
                                }),
                              );
                            },
                            child: Text('APT',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white)),
                          )),
                    ],
                  ),
                  Container(
                    width: 100,
                    margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.11),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          height: 50,
                          child: Text(
                            "Price",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Container(
                            height: 50,
                            child: Text('19,491.42',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white))),
                        Container(
                            height: 50,
                            child: Text('1,332.52',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white))),
                        Container(
                            height: 50,
                            child: Text('9.2772',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white))),
                      ],
                    ),
                  ),
                  Container(
                    width: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          height: 50,
                          child: Text(
                            "Volume",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Container(
                            height: 50,
                            child: Text('+1.43%',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white))),
                        Container(
                            height: 50,
                            child: Text('+1.45%',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white))),
                        Container(
                            height: 50,
                            child: Text('+6.13%',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white))),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
