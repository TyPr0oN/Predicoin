// can import asset as backend api for stats
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoinStats extends StatefulWidget {
  const CoinStats({
    Key? key,
    required this.coinInfo,
    this.btcPredict,
  }) : super(key: key);
  final dynamic btcPredict;
  final dynamic coinInfo;
  @override
  State<CoinStats> createState() => _CoinStatsState();
}

class _CoinStatsState extends State<CoinStats> {
  final List<String> dayValues = [];
  var today;
  @override
  void initState() {
    // print(coinInfo[0]);
    for (var i = 0; i < widget.coinInfo[0].length; i++) {
      // print((widget.coinInfo[0][i.toString()]['Date'].toString()));
      dayValues.add((widget.coinInfo[0][i.toString()]['Date'].toString()));
    }
    today = dayValues.length - 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stat(title: "High", value: '${double.parse(widget.coinInfo[0]["$today"]['High'].toString()).toStringAsFixed(3)} \$'),
            Container(
              width: 30,
            ),
            Stat(title: "Currency", value: widget.coinInfo[1]['name']),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stat(title: "Low", value: '${double.parse(widget.coinInfo[0]["$today"]['Low'].toString()).toStringAsFixed(3)} \$'),
            Container(
              width: 30,
            ),
            Stat(title: "Close", value: '${double.parse(widget.coinInfo[0]["$today"]['Close'].toString()).toStringAsFixed(3)} \$'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stat(title: "Open", value: '${double.parse(widget.coinInfo[0]["$today"]['Open'].toString()).toStringAsFixed(3)} \$'),
            Container(
              width: 30,
            ),
            Stat(title: "24hchange", value: '${double.parse(widget.coinInfo[0]["$today"]['24hchange'].toString()).toStringAsFixed(3)} \%'),
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
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
