import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AssetPriceChart extends StatelessWidget {
  final Color lineColor;
  List<FlSpot>? data;

  AssetPriceChart({
    required this.lineColor,
    this.data,
  });

  @override
  Widget build(BuildContext context) {
    return LineChart(
      lineChartData,
      swapAnimationDuration: const Duration(milliseconds: 250),
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
          tooltipBgColor: Colors.black.withOpacity(0.8),
        ),
      );
  FlTitlesData get titlesData => FlTitlesData(
        bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      );
  FlGridData get gridData => FlGridData(show: false);
  FlBorderData get borderData => FlBorderData(show: false);
  LineChartBarData get lineChartBarData => LineChartBarData(
        isCurved: true,
        color: this.lineColor,
        barWidth: 2,
        dotData: FlDotData(show: false),
        spots: data ?? AssetPriceChart.generateSampleData(),
        belowBarData: BarAreaData(
          show: true,
          color: this.lineColor.withAlpha(50),
        ),
      );
  static List<FlSpot> generateSampleData() {
    final List<FlSpot> result = [];
    final numPoints = 35;
    final maxY = 6;

    double prev = 0;

    for (int i = 0; i < numPoints; i++) {
      final next = prev +
          Random().nextInt(3).toDouble() % -1000 * i +
          Random().nextDouble() * maxY / 10;

      prev = next;
      result.add(
        FlSpot(i.toDouble(), next),
      );
    }

    return result;
  }
}
