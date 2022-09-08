import 'package:flutter/material.dart';
import 'package:predicoin/screens/Home.dart';
import 'package:predicoin/screens/buttomBar.dart';
import 'package:predicoin/screens/Landing.dart';
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
                  children: [
                    Row(
                      children: [
                        Padding(padding: const EdgeInsets.all(1),
                            child: ElevatedButton.icon(onPressed: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                                return LandingPage();
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
                            'BTC',
                            style: TextStyle(fontFamily: 'Ruda', fontSize: 25, color: Color(0xFFffd030)),
                          ),
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
