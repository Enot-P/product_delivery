import 'package:flutter/material.dart';
import 'package:tea_delivery/app/api_client/api_client.dart';
import 'package:tea_delivery/app/entity/entity.dart';
import 'package:tea_delivery/app/repositories/cart_repository.dart';

class ProductsListViewModel extends ChangeNotifier {
  final _apiClient = TeaApiClient();
  CartRepository _cartRepository = CartRepository();

  List<ProductEntity> _listTea = [];
  List<ProductEntity> get listTea => List<ProductEntity>.unmodifiable(_listTea);

  ProductsListViewModel() {
    setup();
  }

  Future<void> setup() async {
    _listTea = await _apiClient.getListTeas();
    notifyListeners();
  }

  bool checkProductInCart(ProductEntity product) => _cartRepository.checkProduct(product);
  void increaseProductInCart(ProductEntity product) => _cartRepository.increaseProductQuantity(product);
  void decreaseProductInCart(ProductEntity product) => _cartRepository.decreaseProductQuantity(product);
  void addProductInCart(ProductEntity product) => _cartRepository.addProduct(product);
}
