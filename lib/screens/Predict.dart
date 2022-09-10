import 'package:flutter/material.dart';
import 'package:predicoin/screens/Home.dart';
class PredictPage extends StatelessWidget {
  const PredictPage({Key? key}) : super(key: key);

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
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(

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
