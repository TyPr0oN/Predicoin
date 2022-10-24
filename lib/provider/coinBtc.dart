import 'dart:ffi';
import 'package:flutter/material.dart';
import 'coinBtcList.dart';
import 'package:dio/dio.dart';

class CoinBtc with ChangeNotifier {
  List<CoinBtcList> _list = [];
  var publicAPI = "http://10.0.2.2:8000";

  List<CoinBtcList> get btcinfo {
    return [..._list];
  }

  List<CoinBtcList> modifyRequest(List<dynamic> data) {
    List<CoinBtcList> list = [];

    for (var el in data) {
      list.add(
          CoinBtcList(name: el['name'], date: el['date'], close: el['close']));
    }
    _list = list;
    return _list;
  }

  dynamic btcInfo = '';
  Future<dynamic> fetchRequest() async {
    try {
      //print('hello');
      final res = await Dio().get(publicAPI + '/btc_info');
      //print(res.data);
      btcInfo = res.data;
    } on DioError catch (e) {
      print('error');
      print(e);
      print(e.response);
    }
    return btcInfo;
  }
}
