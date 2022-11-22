import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class BacktestYfi with ChangeNotifier {
  var publicAPI = "http://10.0.2.2:8000";

  // var invest = {
  //   'investment_value':
  // }
  String investResult = '';
  Future<String> sendInvestYfiSma({int? investment_value}) async {
    print('hello');
    Map<String, dynamic> formData = {'investment_value': investment_value};

    final response = await Dio()
        .post('http://10.0.2.2:8000/yfi_sma_post', queryParameters: formData);
    print(response);
    var res = json.decode(response.toString());
    print(res);
    investResult = res['investment'];
    print(investResult);
    print('end');
    return investResult;
  }

  File? backtestYfi;
  Future<File?> fetchRequest() async {
    try {
      final res = await Dio().get(publicAPI + '/yfi_sma_plot');
      backtestYfi = res.data;
    } on DioError catch (e) {
      print('error');
      print(e);
      print(e.response);
    }
    print('he');
    return backtestYfi;
  }

  String investResultMacd = '';
  Future<String> sendInvestYfiMacd({int? investment_value}) async {
    print('hello');
    Map<String, dynamic> formData = {'investment_value': investment_value};

    final response = await Dio()
        .post('http://10.0.2.2:8000/yfi_macd', queryParameters: formData);
    print(response);
    var res = json.decode(response.toString());
    print(res);
    investResultMacd = res['investment'];
    print(investResultMacd);
    print('end');
    return investResultMacd;
  }

  String investResultRsi = '';
  Future<String> sendInvestYfiRsi({int? investment_value}) async {
    print('hello');
    Map<String, dynamic> formData = {'investment_value': investment_value};

    final response = await Dio()
        .post('http://10.0.2.2:8000/yfi_rsi_post', queryParameters: formData);
    print(response);
    var res = json.decode(response.toString());
    print(res);
    investResultMacd = res['investment'];
    print(investResultMacd);
    print('end');
    return investResultMacd;
  }

  String investResultBb = '';
  Future<String> sendInvestYfiBb({int? investment_value}) async {
    print('hello');
    Map<String, dynamic> formData = {'investment_value': investment_value};

    final response = await Dio()
        .post('http://10.0.2.2:8000/yfi_bb_post', queryParameters: formData);
    print(response);
    var res = json.decode(response.toString());
    print(res);
    investResultMacd = res['investment'];
    print(investResultMacd);
    print('end');
    return investResultMacd;
  }
}
