import 'package:predicoin/provider/predictvalue.dart';

class predictBtcList {
  predictBtcList({
    this.name = '',
    this.rmse = 0,
    this.predictvaluelist = const [],
  });
  final String? name;
  final double? rmse;
  final List<PredictValue> predictvaluelist;
}
