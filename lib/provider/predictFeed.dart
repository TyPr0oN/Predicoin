import 'dart:ffi';

import 'package:flutter/material.dart';
import 'predictList.dart';
import 'package:dio/dio.dart';

class PredictBtcFeed with ChangeNotifier {
  List<predictBtcList> _list = [];
  var publicAPI = "http://10.0.2.2:8000";

  List<predictBtcList> get feed {
    return [..._list];
  }

  //predictBtcList findById(String id) {
  //return _list.firstWhere((fed) => fed.id == id);
  //}

  List<predictBtcList> modifyRequest(List<dynamic> data) {
    List<predictBtcList> list = [];
    print(data);
    for (var el in data) {
      list.add(predictBtcList(
        name: el['name'],
        //predictvaluelist: {el[]},
        //id: el['id'],
        //value: el['last_original_days_value'],
        //y2: el['next_predicted_days_value'],
        rmse: el['rmse'],
      ));
    }
    _list = list;
    return _list;
  }

  dynamic predictBtc = '';
  Future<dynamic> fetchRequest() async {
    try {
      final res = await Dio().get(publicAPI + '/predict_btc');
      predictBtc = res.data;
      //print('fetchRequest');
      //print(res.data[1]['name']);
      //for (var i = 0; i < res.data[0].length; i++) {
      //print(res.data[0][i.toString()]['last_original_days_value']);
      //}
      //_list = modifyRequest(res.data.toList());
      //print(_list[0].value);
      //print(_list[1].value);
    } on DioError catch (e) {
      print('error');
      print(e);
      print(e.response);
    }
    return predictBtc;
  }
}
