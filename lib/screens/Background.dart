import 'package:flutter/material.dart';
import 'package:predicoin/screens/Login.dart';
import 'package:predicoin/screens/Home.dart';
class BackgroundScreen extends StatelessWidget {
  const BackgroundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D3035),
      body: Stack(
        children: [
         Padding(
           padding: const EdgeInsets.fromLTRB(10, 150, 10, 0),
           child: SingleChildScrollView(
             child: Column(
               children: [
                 Image.asset('assets/logo/predicoin.png'),
               ],
             ),
           ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.all(50),
              height: 55,
              width: double.infinity,
              child: ElevatedButton(onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                  return HomePage();
                }),
                );
              },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
                  backgroundColor: MaterialStateProperty.all(Color(0xff2D3035)),
                ),
                child: const Text('Start',
                  style: TextStyle(color: Colors.white,
                    fontSize: 20,
                  ),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
