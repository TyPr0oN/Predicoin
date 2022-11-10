import 'package:flutter/material.dart';
import 'coinEthList.dart';
import 'package:dio/dio.dart';

class CoinEth with ChangeNotifier {
  List<CoinEthList> _list = [];
  var publicAPI = "http://10.0.2.2:8000";

  List<CoinEthList> get ethinfo {
    return [..._list];
  }

  dynamic ethInfo = '';
  Future<dynamic> fetchRequest() async {
    try {
      final res = await Dio().get(publicAPI + '/eth_info');
      ethInfo = res.data;
    } on DioError catch (e) {
      print('error');
      print(e);
      print(e.response);
    }
    return ethInfo;
  }
}
