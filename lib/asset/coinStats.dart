// can import asset as backend api for stats
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoinStats extends StatelessWidget {
  const CoinStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stat(title: "High", value: "฿32.23"),
            Container(width: 30,),
            Stat(title: "Symbol", value: "BTC"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stat(title: "Low", value: "฿31.23"),
            Container(width: 30,),
            Stat(title: "Rank", value: "8"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stat(title: "24h vol.", value: "฿3.28K"),
            Container(width: 30,),
            Stat(title: "Mkt cap", value: "฿30.2K"),
          ],
        ),
      ],
    );
  }
}

class Stat extends StatelessWidget {
  final String title;
  final String value;
  const Stat({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(bottom: 10, top: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              // color: theme.dividerColor,
              color: Colors.white,
              width: 1.0,
            ),
          ),
        ),
        child:
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
        ]),
      ),
    );
  }
}
