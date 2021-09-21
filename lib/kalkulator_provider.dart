import 'dart:math';

import 'package:flutter/material.dart';

class KalkulatorProvider extends ChangeNotifier{

  List<int> _listPrima = [];
  List<int> get listPrima => _listPrima;
  set listPrima(List<int> val){
    _listPrima = val;
  }

  Future<List<int>> hitungBilanganPrima({int? nilaiAwal, int? nilaiAkhir}) async {
    _listPrima.clear();

    for(int i = nilaiAwal!; i <= nilaiAkhir!; i++){
      int j;
      int a = 0;
      int flag = 0;

      a = i ~/ 2;
      for(j = 2; j <= a; j++){
        if(i % j == 0){
          flag = 1;
          break;
        }
      }
      if(flag==0){
        print('$i');
        _listPrima.add(i);
      }

    }

    print(_listPrima);

    notifyListeners();
    return _listPrima;
  }
}