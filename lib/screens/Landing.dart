
import 'package:flutter/material.dart';
import 'package:predicoin/screens/CryptoLanding.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: SearchAction,

            color: Color(0xFFffd030), icon: Icon(Icons.search),
          ),
          IconButton(onPressed: (){},
            color: Color(0xFFffd030), icon: Icon(Icons.account_circle),
          ),
          IconButton(onPressed: (){},
            color: Color(0xFFffd030), icon: Icon(Icons.notifications),
          ),
        ],
      ),
      body: CryptoLanding(),
    );
  }
}

void SearchAction() {
  setState(() {
    print("Search");
  });
}

void setState(Null Function() param0) {
}
