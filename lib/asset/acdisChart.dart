import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AssetAcdisChart extends StatefulWidget {
  const AssetAcdisChart({Key? key}) : super(key: key);

  @override
  _AssetAcdisChartState createState() => _AssetAcdisChartState();
}

class _AssetAcdisChartState extends State<AssetAcdisChart> {
  List<ChartSampleData> chartData = <ChartSampleData>[
    ChartSampleData(
        x: DateTime(2016, 01, 01),
        open: 101.51,
        high: 104.85,
        low: 95.43,
        close: 95.96),
    ChartSampleData(
        x: DateTime(2016, 01, 04),
        open: 102.61,
        high: 105.85,
        low: 96.43,
        close: 96.96),
    ChartSampleData(
        x: DateTime(2016, 01, 11),
        open: 98.97,
        high: 101.19,
        low: 95.36,
        close: 97.13),
    ChartSampleData(
        x: DateTime(2016, 01, 18),
        open: 98.41,
        high: 101.46,
        low: 93.42,
        close: 101.42),
    ChartSampleData(
        x: DateTime(2016, 01, 25),
        open: 101.52,
        high: 101.53,
        low: 92.39,
        close: 97.34),
    ChartSampleData(
        x: DateTime(2016, 02, 01),
        open: 96.47,
        high: 97.33,
        low: 93.69,
        close: 94.02),
    ChartSampleData(
        x: DateTime(2016, 02, 08),
        open: 93.13,
        high: 96.35,
        low: 92.59,
        close: 93.99),
    ChartSampleData(
        x: DateTime(2016, 02, 15),
        open: 95.02,
        high: 98.89,
        low: 94.61,
        close: 96.04),
    ChartSampleData(
        x: DateTime(2016, 02, 22),
        open: 96.31,
        high: 98.0237,
        low: 93.32,
        close: 96.91),
    ChartSampleData(
        x: DateTime(2016, 02, 29),
        open: 96.86,
        high: 103.75,
        low: 96.65,
        close: 103.01),
    ChartSampleData(
        x: DateTime(2016, 03, 07),
        open: 102.39,
        high: 102.83,
        low: 100.15,
        close: 102.26),
  ];

  late TooltipBehavior _tooltipBehavior;
  @override
  void initState(){
    _tooltipBehavior = TooltipBehavior(enable: true, shared: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            children: [
              SfCartesianChart(
                  primaryXAxis: DateTimeAxis(),
                  primaryYAxis: NumericAxis(),
                  axes: [
                    NumericAxis(
                      opposedPosition: true,
                      name: 'indicator',
                    )
                  ],
                  tooltipBehavior: _tooltipBehavior,
                  indicators: <TechnicalIndicators<ChartSampleData,DateTime>>[AtrIndicator<ChartSampleData, DateTime>(
                  seriesName: 'AAPL', period: 3, yAxisName: 'indicator'),
                  ],
                  series: <ChartSeries<ChartSampleData, DateTime>>[
                    HiloOpenCloseSeries<ChartSampleData, DateTime>(
                        dataSource: chartData,
                        xValueMapper: (ChartSampleData data, _) => data.x as DateTime,
                        lowValueMapper: (ChartSampleData data, _) => data.low,
                        highValueMapper: (ChartSampleData data, _) => data.high,
                        openValueMapper: (ChartSampleData data, _) => data.open,
                        closeValueMapper: (ChartSampleData data, _) => data.close,
                        name: 'AAPL'),
                  ]
              ),
              // SfCartesianChart(
              //   primaryXAxis: DateTimeAxis(),
              //   indicators: <TechnicalIndicators<ChartSampleData, DateTime>>[
              //     AccumulationDistributionIndicator<ChartSampleData, DateTime>(
              //         seriesName: 'AAPL'),
              //   ],
              //   series: <ChartSeries<ChartSampleData, DateTime>>[
              //     HiloOpenCloseSeries<ChartSampleData, DateTime>(
              //       dataSource: chartData,
              //       xValueMapper: (ChartSampleData sales, _) => sales.x as DateTime,
              //       lowValueMapper: (ChartSampleData sales, _) => sales.low,
              //       highValueMapper: (ChartSampleData sales, _) => sales.high,
              //       openValueMapper: (ChartSampleData sales, _) => sales.open,
              //       closeValueMapper: (ChartSampleData sales, _) => sales.close,
              //       name: 'AAPL',
              //     )
              //   ],
              // ),
            ],
          )
        ),
    );
  }
}

class ChartSampleData {
  ChartSampleData({this.x, this.open, this.high, this.low, this.close});
  final DateTime? x;
  final double? low;
  final double? high;
  final double? open;
  final double? close;
}