import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:predicoin/widget/financialCharts.dart';

class WidgetBtcPriceChart extends StatefulWidget {
  const WidgetBtcPriceChart({
    Key? key,
    required this.coinInfo,
    this.btcPredict,
    required this.lineColor,
  }) : super(key: key);
  final Color lineColor;
  final dynamic btcPredict;
  final dynamic coinInfo;
  @override
  State<WidgetBtcPriceChart> createState() => _WidgetBtcPriceChartState();
}

class _WidgetBtcPriceChartState extends State<WidgetBtcPriceChart> {
  Color? lineColor;
  List<double>? data;
  // dynamic? coinInfo;
  final List<double> yValues = [];
  final List<String> dayValues = [];
  @override
  void initState() {
    // print(coinInfo[0]);
    for (var i = 0; i < widget.coinInfo[0].length; i++) {
      // print((widget.coinInfo[0][i.toString()]['Close'].toString()));
      yValues.add(double.parse(widget.coinInfo[0][i.toString()]['Close'].toString()));
      // print((widget.coinInfo[0][i.toString()]['Date'].toString()));
      dayValues.add((widget.coinInfo[0][i.toString()]['Date'].toString()));
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
    const style = TextStyle(color: Colors.white, fontSize: 10);
    String text = '';
    switch (value.toInt()) {
      case 10000:
        text = '10k';
        break;
      case 20000:
        text = '20k';
        break;
      case 30000:
        text = '30k';
        break;
      case 40000:
        text = '40k';
        break;
      case 50000:
        text = '50k';
        break;
      case 60000:
        text = '60k';
        break;
      case 70000:
        text = '70k';
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
            sideTitles:
                SideTitles(showTitles: true, reservedSize: 18, interval: 300, getTitlesWidget: bottomTitleWidget)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles:
            AxisTitles(sideTitles: SideTitles(showTitles: true, reservedSize: 30, getTitlesWidget: leftTitleWidget)),
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
  static List<FlSpot> generateSampleData() {
    final List<FlSpot> result = [];
    final numPoints = 35;
    final maxY = 6;

    double prev = 0;
    return result;
  }
}
