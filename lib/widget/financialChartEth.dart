import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

import '../provider/predictFeedETH.dart';

class WidgetFinancialChartEth extends StatefulWidget {
  const WidgetFinancialChartEth({Key? key, required this.ethPredict})
      : super(key: key);
  final dynamic ethPredict;
  @override
  _WidgetFinancialChartState createState() => _WidgetFinancialChartState();
}

class _WidgetFinancialChartState extends State<WidgetFinancialChartEth> {
  //late List<ChartSampleData> _chartData;

  final List<ChartData> chartData = [];
  final List<ChartDataPredict> predictData = [];
  @override
  void initState() {
    for (var i = 0; i < widget.ethPredict[0].length; i++) {
      //print(widget.ethPredict[0][0]);
      //print(double.parse(widget.ethPredict[0][i.toString()]['next_predicted_days_value'].toString()));
      chartData.add(ChartData(
          widget.ethPredict[0][i]['date'].toString(),
          double.tryParse(
              widget.ethPredict[0][i]['original_close'].toString())));
    }
    for (var i = 0; i < widget.ethPredict[0].length; i++) {
      predictData.add(ChartDataPredict(
          widget.ethPredict[0][i]['date'].toString(),
          double.tryParse(
              widget.ethPredict[0][i]['test_predicted_close'].toString())));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SfCartesianChart(
          trackballBehavior: TrackballBehavior(
            enable: true,
            activationMode: ActivationMode.singleTap,
            builder: (context, trackballDetails) => Container(
              child: Text(
                  "${trackballDetails.point!.x} : ${trackballDetails.point!.y}"),
            ),
          ),
          //tooltipBehavior: TooltipBehavior(enable: true),
          primaryXAxis: CategoryAxis(),
          primaryYAxis: NumericAxis(),
          series: <ChartSeries>[
            LineSeries<ChartData, String>(
                dataSource: chartData,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y),
            LineSeries<ChartDataPredict, String>(
                dataSource: predictData,
                xValueMapper: (ChartDataPredict data, _) => data.x,
                yValueMapper: (ChartDataPredict data, _) => data.y)
          ],
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double? y;
}

class ChartDataPredict {
  ChartDataPredict(this.x, this.y);
  final String x;
  final double? y;
}
