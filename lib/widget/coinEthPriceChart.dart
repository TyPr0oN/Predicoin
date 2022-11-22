import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WidgetEthPriceChart extends StatefulWidget {
  const WidgetEthPriceChart({
    Key? key,
    required this.coinInfo,
    required this.lineColor,
  }) : super(key: key);
  final Color lineColor;
  final dynamic coinInfo;
  @override
  State<WidgetEthPriceChart> createState() => _WidgetEthPriceChartState();
}

class _WidgetEthPriceChartState extends State<WidgetEthPriceChart> {
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
      case 2000:
        text = '2k';
        break;
      case 3000:
        text = '3k';
        break;
      case 4000:
        text = '4k';
        break;
      case 5000:
        text = '5k';
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
                      text: 'Close ' + FlSpot.y.toString(),
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
                reservedSize: 26,
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
