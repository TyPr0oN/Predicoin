import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class BacktestBtc with ChangeNotifier {
  var publicAPI = "http://10.0.2.2:8000";

  // var invest = {
  //   'investment_value':
  // }
  String investResult = '';
  Future<String> sendInvestBtcSma({int? investment_value}) async {
    print('hello');
    Map<String, dynamic> formData = {'investment_value': investment_value};

    final response = await Dio()
        .post('http://10.0.2.2:8000/btc_sma_post', queryParameters: formData);
    print(response);
    var res = json.decode(response.toString());
    print(res);
    investResult = res['investment'];
    print(investResult);
    print('end');
    return investResult;
  }

  File? backtestBtc;
  Future<File?> fetchRequest() async {
    try {
      final res = await Dio().get(publicAPI + '/btc_sma_plot');
      backtestBtc = res.data;
    } on DioError catch (e) {
      print('error');
      print(e);
      print(e.response);
    }
    print('he');
    return backtestBtc;
  }
}
