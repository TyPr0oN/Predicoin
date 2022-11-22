import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class BacktestSol with ChangeNotifier {
  var publicAPI = "http://10.0.2.2:8000";

  // var invest = {
  //   'investment_value':
  // }
  String investResult = '';
  Future<String> sendInvestSolSma({int? investment_value}) async {
    print('hello');
    Map<String, dynamic> formData = {'investment_value': investment_value};

    final response = await Dio()
        .post('http://10.0.2.2:8000/sol_sma_post', queryParameters: formData);
    print(response);
    var res = json.decode(response.toString());
    print(res);
    investResult = res['investment'];
    print(investResult);
    print('end');
    return investResult;
  }

  File? backtestSol;
  Future<File?> fetchRequest() async {
    try {
      final res = await Dio().get(publicAPI + '/sol_sma_plot');
      backtestSol = res.data;
    } on DioError catch (e) {
      print('error');
      print(e);
      print(e.response);
    }
    print('he');
    return backtestSol;
  }

  String investResultMacd = '';
  Future<String> sendInvestSolMacd({int? investment_value}) async {
    print('hello');
    Map<String, dynamic> formData = {'investment_value': investment_value};

    final response = await Dio()
        .post('http://10.0.2.2:8000/sol_macd', queryParameters: formData);
    print(response);
    var res = json.decode(response.toString());
    print(res);
    investResultMacd = res['investment'];
    print(investResultMacd);
    print('end');
    return investResultMacd;
  }

  String investResultRsi = '';
  Future<String> sendInvestSolRsi({int? investment_value}) async {
    print('hello');
    Map<String, dynamic> formData = {'investment_value': investment_value};

    final response = await Dio()
        .post('http://10.0.2.2:8000/sol_rsi_post', queryParameters: formData);
    print(response);
    var res = json.decode(response.toString());
    print(res);
    investResultMacd = res['investment'];
    print(investResultMacd);
    print('end');
    return investResultMacd;
  }

  String investResultBb = '';
  Future<String> sendInvestSolBb({int? investment_value}) async {
    print('hello');
    Map<String, dynamic> formData = {'investment_value': investment_value};

    final response = await Dio()
        .post('http://10.0.2.2:8000/sol_bb_post', queryParameters: formData);
    print(response);
    var res = json.decode(response.toString());
    print(res);
    investResultMacd = res['investment'];
    print(investResultMacd);
    print('end');
    return investResultMacd;
  }
}
