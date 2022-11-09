import 'package:flutter/material.dart';
import 'coinSOlList.dart';
import 'package:dio/dio.dart';

class CoinSol with ChangeNotifier {
  List<CoinSolList> _list = [];
  var publicAPI = "http://10.0.2.2:8000";

  List<CoinSolList> get solinfo {
    return [..._list];
  }

  dynamic solInfo = '';
  Future<dynamic> fetchRequest() async {
    try {
      final res = await Dio().get(publicAPI + '/sol_info');
      solInfo = res.data;
    } on DioError catch (e) {
      print('error');
      print(e);
      print(e.response);
    }
    return solInfo;
  }
}
