import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class WidgetMarkerChart extends StatefulWidget {
  const WidgetMarkerChart({Key? key}) : super(key: key);

  @override
  _WidgetMarkerChartState createState() => _WidgetMarkerChartState();
}

class _WidgetMarkerChartState extends State<WidgetMarkerChart> {
  late List<SalesData> _chartData;
  late TrackballBehavior _trackballBehavior;

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
  void initState() {
    _chartData = getChartData();
    _trackballBehavior = TrackballBehavior(
        enable: true, activationMode: ActivationMode.singleTap);
    super.initState();
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
            enableTooltip: true,
            markerSettings: const MarkerSettings(
                isVisible: true, shape: DataMarkerType.triangle)),
      ],
      primaryXAxis: NumericAxis(
        edgeLabelPlacement: EdgeLabelPlacement.shift,
      ),
      primaryYAxis: NumericAxis(
          labelFormat: '{value}',
          numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0)),
    )));
  }
}

class SalesData {
  SalesData(this.day, this.sales, this.y2);
  final double day;
  final double sales;
  final double y2;
}
