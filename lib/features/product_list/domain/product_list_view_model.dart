import 'package:flutter/material.dart';
import 'package:tea_delivery/app/api_client/api_client.dart';
import 'package:tea_delivery/app/domain/domain.dart';

class ProductsListViewModel extends ChangeNotifier {
  final _apiClient = TeaApiClient();

  List<TeaEntity> _listTea = [];
  List<TeaEntity> get listTea => List<TeaEntity>.unmodifiable(_listTea);

  ProductsListViewModel() {
    setup();
  }

  Future<void> setup() async {
    _listTea = await _apiClient.getListTeas();
    notifyListeners();
  }
}
