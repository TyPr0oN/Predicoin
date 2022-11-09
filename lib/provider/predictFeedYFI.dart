import 'dart:ffi';

import 'package:flutter/material.dart';
import 'predictList.dart';
import 'package:dio/dio.dart';

class PredictYfiFeed with ChangeNotifier {
  var publicAPI = "http://10.0.2.2:8000";

  dynamic predictYfi = '';
  Future<dynamic> fetchRequest() async {
    try {
      final res = await Dio().get(publicAPI + '/predict_yfi');
      predictYfi = res.data;
    } on DioError catch (e) {
      print('error');
      print(e);
      print(e.response);
    }
    return predictYfi;
  }
}
