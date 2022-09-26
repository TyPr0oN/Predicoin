
import 'package:flutter/material.dart';
import 'package:predicoin/asset/buttomBar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buttomBar(),
    );
  }
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Image.asset('assets/logo/predicoin.png',height: 37,),
    );
  }
}
