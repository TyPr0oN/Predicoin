import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

import '../provider/predictFeed.dart';

class WidgetFinancialChart extends StatefulWidget {
  const WidgetFinancialChart({Key? key, required this.btcPredict})
      : super(key: key);
  final dynamic btcPredict;
  @override
  _WidgetFinancialChartState createState() => _WidgetFinancialChartState();
}

class _WidgetFinancialChartState extends State<WidgetFinancialChart> {
  //late List<ChartSampleData> _chartData;

  final List<ChartData> chartData = [];
  @override
  void initState() {
    for (var i = 16; i < widget.btcPredict[0].length; i++) {
      //print(double.parse(widget.btcPredict[0][i.toString()]['next_predicted_days_value'].toString()));
      chartData.add(ChartData(
          i - 15,
          double.parse(widget.btcPredict[0][i.toString()]
                  ['next_predicted_days_value']
              .toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SfCartesianChart(
          primaryXAxis: NumericAxis(),
          primaryYAxis: NumericAxis(),
          series: <ChartSeries>[
            LineSeries<ChartData, int>(
                dataSource: chartData,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y)
          ],
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final double y;
}
