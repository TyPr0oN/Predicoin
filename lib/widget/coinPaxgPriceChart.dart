import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WidgetPaxgPriceChart extends StatefulWidget {
  const WidgetPaxgPriceChart({
    Key? key,
    required this.coinInfo,
    required this.lineColor,
  }) : super(key: key);
  final Color lineColor;
  final dynamic coinInfo;
  @override
  State<WidgetPaxgPriceChart> createState() => _WidgetPaxgPriceChartState();
}

class _WidgetPaxgPriceChartState extends State<WidgetPaxgPriceChart> {
  Color? lineColor;
  List<double>? data;
  final List<double> yValues = [];
  final List<String> dayValues = [];

  @override
  void initState() {
    for (var i = 0; i < widget.coinInfo[0].length; i++) {
      yValues.add(
          double.parse(widget.coinInfo[0][i.toString()]['Close'].toString()));
      dayValues.add((DateFormat("yyyy")
          .format(DateTime.parse(widget.coinInfo[0][i.toString()]['Date']))
          .toString()));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LineChart(
      lineChartData,
      swapAnimationDuration: const Duration(milliseconds: 250),
    );
  }

  Widget leftTitleWidget(double value, TitleMeta meta) {
    const style = TextStyle(color: Colors.white, fontSize: 12);
    String text = '';
    switch (value.toInt()) {
      case 1000:
        text = '1k';
        break;
      case 1500:
        text = '1.5k';
        break;
      case 1600:
        text = '1.6k';
        break;
      case 1700:
        text = '1.7k';
        break;
      case 1800:
        text = '1.8k';
        break;
      case 1900:
        text = '1.9k';
        break;
      case 2000:
        text = '2k';
        break;
      case 2100:
        text = '2.1k';
        break;
    }
    return SideTitleWidget(
        axisSide: meta.axisSide,
        child: Text(
          text,
          style: style,
        ));
  }

  Widget bottomTitleWidget(double value, TitleMeta meta) {
    const style = TextStyle(color: Colors.white, fontSize: 10);

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(dayValues[value.toInt()], style: style),
    );
  }

  LineChartData get lineChartData => LineChartData(
        lineTouchData: lineTouchData,
        gridData: gridData,
        titlesData: titlesData,
        borderData: borderData,
        lineBarsData: [
          lineChartBarData,
        ],
      );
  LineTouchData get lineTouchData => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: Color(0xff1D194B),
            getTooltipItems: ((List<LineBarSpot> touchedBarSpots) {
              return touchedBarSpots.map((barSpot) {
                final FlSpot = barSpot;
                return LineTooltipItem(
                  '\Date ${dayValues[FlSpot.x.toInt()]} \n',
                  TextStyle(
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(
                      text: 'Close ' +
                          '${double.parse(FlSpot.y.toString()).toStringAsFixed(7)}',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                );
              }).toList();
            })),
      );
  FlTitlesData get titlesData => FlTitlesData(
        bottomTitles: AxisTitles(
            sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 20,
                interval: 350,
                getTitlesWidget: bottomTitleWidget)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(
            sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 31,
                getTitlesWidget: leftTitleWidget)),
      );
  FlGridData get gridData => FlGridData(show: false);
  FlBorderData get borderData => FlBorderData(show: false);
  LineChartBarData get lineChartBarData => LineChartBarData(
        isCurved: true,
        color: this.lineColor,
        barWidth: 2,
        dotData: FlDotData(show: false),
        spots: yValues.asMap().entries.map((e) {
          return FlSpot(e.key.toDouble(), e.value);
        }).toList(),
        belowBarData: BarAreaData(
          show: true,
          color: this.lineColor?.withAlpha(50),
        ),
      );
}
