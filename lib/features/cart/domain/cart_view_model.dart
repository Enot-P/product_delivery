import 'package:flutter/material.dart';
import 'package:tea_delivery/app/api_client/api_client.dart';
import 'package:tea_delivery/app/entity/product.dart';

class CartViewModel extends ChangeNotifier {
  final _apiClient = TeaApiClient();

  List<ProductEntity> _listTea = [];
  List<ProductEntity> get listTea => List<ProductEntity>.unmodifiable(_listTea);

  CartViewModel() {
    setup();
  }

  Future<void> setup() async {
    _listTea = await _apiClient.getListTeasForCart();
    notifyListeners();
  }
}
