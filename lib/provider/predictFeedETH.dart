import 'dart:ffi';

import 'package:flutter/material.dart';
import 'predictList.dart';
import 'package:dio/dio.dart';

class PredictEthFeed with ChangeNotifier {
  var publicAPI = "http://10.0.2.2:8000";

  dynamic predictEth = '';
  Future<dynamic> fetchRequest() async {
    try {
      final res = await Dio().get(publicAPI + '/predict_eth');
      predictEth = res.data;
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
    return predictEth;
  }
}
