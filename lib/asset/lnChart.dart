import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class AssetLineChart extends StatefulWidget {
  const AssetLineChart({Key? key}) : super(key: key);

  @override
  _AssetLineChartState createState() => _AssetLineChartState();
}

class _AssetLineChartState extends State<AssetLineChart> {
  late List<SalesData> _chartData;
  late TooltipBehavior _tooltipBehavior;
  late TrackballBehavior _trackballBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    _trackballBehavior = TrackballBehavior(
        enable: true, activationMode: ActivationMode.singleTap);
    super.initState();
  }

  List<SalesData> getChartData() {
    final List<SalesData> chartData = [
      SalesData(0, 0, 0),
      SalesData(10, 0, 0),
      SalesData(20, 1, 1),
      SalesData(30, -2, -3),
      SalesData(40, 2, 2),
      SalesData(50, 3, 3),
      SalesData(60, 3.5, 4),
      SalesData(70, 3, 3),
      SalesData(80, 2, 1.5),
      SalesData(90, 1, 1),
      SalesData(100, 2, 3),
    ];
    return chartData;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SfCartesianChart(
              // tooltipBehavior: _tooltipBehavior,
              trackballBehavior: _trackballBehavior,
              series: <ChartSeries>[
                LineSeries<SalesData, double>(
                    name: 'Sales',
                    dataSource: _chartData,
                    xValueMapper: (SalesData sales, _) => sales.day,
                    yValueMapper: (SalesData sales, _) => sales.sales,
                    dataLabelSettings: DataLabelSettings(isVisible: false),
                    enableTooltip: true),
                LineSeries<SalesData, double>(
                    name: 'y2',
                    dataSource: _chartData,
                    xValueMapper: (SalesData sales, _) => sales.day,
                    yValueMapper: (SalesData sales, _) => sales.y2,
                    dataLabelSettings: DataLabelSettings(isVisible: false),
                    enableTooltip: true,)
              ],
              primaryXAxis: NumericAxis(
                edgeLabelPlacement: EdgeLabelPlacement.shift,
                interval: 2,
              ),
              primaryYAxis: NumericAxis(
                  labelFormat: '{value}',
                  numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0)),
            )
        )
    );
  }
}

class SalesData{
  SalesData(this.day,this.sales,this.y2);
  final double day;
  final double sales;
  final double y2;
}