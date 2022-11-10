import 'package:flutter/material.dart';
import 'coinPaxgList.dart';
import 'package:dio/dio.dart';

class CoinPaxg with ChangeNotifier {
  List<CoinPaxgList> _list = [];
  var publicAPI = "http://10.0.2.2:8000";

  List<CoinPaxgList> get paxginfo {
    return [..._list];
  }

  dynamic paxgInfo = '';
  Future<dynamic> fetchRequest() async {
    try {
      final res = await Dio().get(publicAPI + '/paxg_info');
      paxgInfo = res.data;
    } on DioError catch (e) {
      print('error');
      print(e);
      print(e.response);
    }
    return paxgInfo;
  }
}
