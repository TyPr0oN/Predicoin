import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class BacktestEth with ChangeNotifier {
  var publicAPI = "http://10.0.2.2:8000";

  // var invest = {
  //   'investment_value':
  // }
  String investResult = '';
  Future<String> sendInvestEthSma({int? investment_value}) async {
    print('hello');
    Map<String, dynamic> formData = {'investment_value': investment_value};

    final response = await Dio()
        .post('http://10.0.2.2:8000/eth_sma_post', queryParameters: formData);
    print(response);
    var res = json.decode(response.toString());
    print(res);
    investResult = res['investment'];
    print(investResult);
    print('end');
    return investResult;
  }

  File? backtestEth;
  Future<File?> fetchRequest() async {
    try {
      final res = await Dio().get(publicAPI + '/eth_sma_plot');
      backtestEth = res.data;
    } on DioError catch (e) {
      print('error');
      print(e);
      print(e.response);
    }
    print('he');
    return backtestEth;
  }

  String investResultMacd = '';
  Future<String> sendInvestEthMacd({int? investment_value}) async {
    print('hello');
    Map<String, dynamic> formData = {'investment_value': investment_value};

    final response = await Dio()
        .post('http://10.0.2.2:8000/eth_macd', queryParameters: formData);
    print(response);
    var res = json.decode(response.toString());
    print(res);
    investResultMacd = res['investment'];
    print(investResultMacd);
    print('end');
    return investResultMacd;
  }

  String investResultRsi = '';
  Future<String> sendInvestEthRsi({int? investment_value}) async {
    print('hello');
    Map<String, dynamic> formData = {'investment_value': investment_value};

    final response = await Dio()
        .post('http://10.0.2.2:8000/eth_rsi_post', queryParameters: formData);
    print(response);
    var res = json.decode(response.toString());
    print(res);
    investResultMacd = res['investment'];
    print(investResultMacd);
    print('end');
    return investResultMacd;
  }

  String investResultBb = '';
  Future<String> sendInvestEthBb({int? investment_value}) async {
    print('hello');
    Map<String, dynamic> formData = {'investment_value': investment_value};

    final response = await Dio()
        .post('http://10.0.2.2:8000/eth_bb_post', queryParameters: formData);
    print(response);
    var res = json.decode(response.toString());
    print(res);
    investResultMacd = res['investment'];
    print(investResultMacd);
    print('end');
    return investResultMacd;
  }
}
