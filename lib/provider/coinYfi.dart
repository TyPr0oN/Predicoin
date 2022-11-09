import 'package:flutter/material.dart';
import 'coinYfiList.dart';
import 'package:dio/dio.dart';

class CoinYfi with ChangeNotifier {
  List<CoinYfiList> _list = [];
  var publicAPI = "http://10.0.2.2:8000";

  List<CoinYfiList> get yfiinfo {
    return [..._list];
  }

  dynamic yfiInfo = '';
  Future<dynamic> fetchRequest() async {
    try {
      final res = await Dio().get(publicAPI + '/yfi_info');
      yfiInfo = res.data;
    } on DioError catch (e) {
      print('error');
      print(e);
      print(e.response);
    }
    return yfiInfo;
  }
}
