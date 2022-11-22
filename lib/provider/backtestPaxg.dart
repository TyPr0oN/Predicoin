import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class BacktestPaxg with ChangeNotifier {
  var publicAPI = "http://10.0.2.2:8000";

  // var invest = {
  //   'investment_value':
  // }
  String investResult = '';
  Future<String> sendInvestPaxgSma({int? investment_value}) async {
    print('hello');
    Map<String, dynamic> formData = {'investment_value': investment_value};

    final response = await Dio()
        .post('http://10.0.2.2:8000/paxg_sma_post', queryParameters: formData);
    print(response);
    var res = json.decode(response.toString());
    print(res);
    investResult = res['investment'];
    print(investResult);
    print('end');
    return investResult;
  }

  File? backtestPaxg;
  Future<File?> fetchRequest() async {
    try {
      final res = await Dio().get(publicAPI + '/paxg_sma_plot');
      backtestPaxg = res.data;
    } on DioError catch (e) {
      print('error');
      print(e);
      print(e.response);
    }
    print('he');
    return backtestPaxg;
  }

  String investResultMacd = '';
  Future<String> sendInvestPaxgMacd({int? investment_value}) async {
    print('hello');
    Map<String, dynamic> formData = {'investment_value': investment_value};

    final response = await Dio()
        .post('http://10.0.2.2:8000/paxg_macd', queryParameters: formData);
    print(response);
    var res = json.decode(response.toString());
    print(res);
    investResultMacd = res['investment'];
    print(investResultMacd);
    print('end');
    return investResultMacd;
  }

  String investResultRsi = '';
  Future<String> sendInvestPaxgRsi({int? investment_value}) async {
    print('hello');
    Map<String, dynamic> formData = {'investment_value': investment_value};

    final response = await Dio()
        .post('http://10.0.2.2:8000/paxg_rsi_post', queryParameters: formData);
    print(response);
    var res = json.decode(response.toString());
    print(res);
    investResultMacd = res['investment'];
    print(investResultMacd);
    print('end');
    return investResultMacd;
  }

  String investResultBb = '';
  Future<String> sendInvestPaxgBb({int? investment_value}) async {
    print('hello');
    Map<String, dynamic> formData = {'investment_value': investment_value};

    final response = await Dio()
        .post('http://10.0.2.2:8000/paxg_bb_post', queryParameters: formData);
    print(response);
    var res = json.decode(response.toString());
    print(res);
    investResultMacd = res['investment'];
    print(investResultMacd);
    print('end');
    return investResultMacd;
  }
}
