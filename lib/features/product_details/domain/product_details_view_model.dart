import 'package:flutter/material.dart';
import 'package:tea_delivery/app/api_client/tea_api_client.dart';
import 'package:tea_delivery/app/entity/product.dart';
import 'package:tea_delivery/app/repositories/repositories.dart';

class ProductDetailsViewModel extends ChangeNotifier {
  final _apiClient = TeaApiClient();

  late final ProductEntity product;

  final int productId;
  final CartRepository cartRepository;
  ProductDetailsViewModel({required this.cartRepository, required this.productId}) {
    init();
  }

  Future<void> init() async {
    product = await _apiClient.getProductEntityById(productId);
    notifyListeners();
  }

  void pressOnIncreaseProductButton() {
    cartRepository.increaseProductQuantity(product);
    notifyListeners();
  }

  void pressOnDecreaseProductButton() {
    cartRepository.decreaseProductQuantity(product);
    notifyListeners();
  }

  void addProductInCart() {
    cartRepository.addProduct(product);
    notifyListeners();
  }

  bool checkProductInCart() {
    return cartRepository.checkProductInCart(product);
  }

  int getQuantityProduct() {
    return cartRepository.getQuantityProduct(product) ?? -100;
  }
}
