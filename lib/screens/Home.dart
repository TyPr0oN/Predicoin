import 'package:flutter/material.dart';
import 'package:predicoin/screens/Coininfo.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2D3035),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0,right: 20,top: 20),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text("Crypto Coin",
                style: TextStyle(fontSize: 25, color: Colors.white,fontWeight: FontWeight.bold),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Price", style: TextStyle(color: Colors.white),),
                  Padding(
                    padding: const EdgeInsets.only(left: 80.0),
                    child: Text("24hr chg%", style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 2.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Text("BTC",style: TextStyle(fontSize: 18, color: Colors.white,),)
                                TextButton(style: TextButton.styleFrom(textStyle: TextStyle(fontSize: 18,)),
                                    onPressed: (){
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)
                                      {
                                          return CoininfoPage();
                                      }),);
                                    }, child: const Text('BTC',style: TextStyle(color: Colors.white,),),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("200",style: TextStyle(fontSize: 18, color: Colors.white,),)
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("-1.8",style: TextStyle(fontSize: 18, color: Colors.white,),)
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
