import 'package:flutter/material.dart';
import 'package:tea_delivery/app/api_client/api_client.dart';
import 'package:tea_delivery/app/entity/entity.dart';

class ProductsListViewModel extends ChangeNotifier {
  final _apiClient = TeaApiClient();

  List<ProductEntity> _listTea = [];
  List<ProductEntity> get listTea => List<ProductEntity>.unmodifiable(_listTea);

  ProductsListViewModel() {
    setup();
  }

  Future<void> setup() async {
    _listTea = await _apiClient.getListTeas();
    notifyListeners();
  }
}
