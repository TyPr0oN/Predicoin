import 'package:flutter/material.dart';

class CryptoLanding extends StatefulWidget {
  const CryptoLanding({Key? key}) : super(key: key);

  @override
  _CryptoLandingState createState() => _CryptoLandingState();
}

class _CryptoLandingState extends State<CryptoLanding> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 4, child: Scaffold(
      backgroundColor: Color(0xFF2D3035),
    ));
  }
}
