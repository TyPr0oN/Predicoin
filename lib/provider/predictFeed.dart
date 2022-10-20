import 'dart:ffi';

import 'package:flutter/material.dart';
import 'predictList.dart';
import 'package:dio/dio.dart';

class PredictBtcFeed with ChangeNotifier {
  List<predictBtcList> _list = [];
  String? _day;
  var publicAPI = "http://10.0.2.2:8000";

  List<predictBtcList> get feed {
    return [..._list];
  }

  predictBtcList findById(String id) {
    return _list.firstWhere((fed) => fed.id == id);
  }

  List<predictBtcList> modifyRequest(List<dynamic> data) {
    List<predictBtcList> list = [];
    for (var el in data) {
      list.add(predictBtcList(
        name: el['name'],
        id: el['id'],
        value: el['last_original_days_value'],
        y2: el['next_predicted_days_value'],
        rmse: el['rmse'],
      ));
    }
    return list;
  }

  Future<List<predictBtcList>> fetchRequest() async {
    try {
      final res = await Dio().get(publicAPI + '/predict_btc');
      _list = modifyRequest(res.data.toList());
    } on DioError catch (e) {
      print('error');
      print(e);
      print(e.response);
    }
    return _list;
  }
}
