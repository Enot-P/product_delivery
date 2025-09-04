import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tea_delivery/app/entity/entity.dart';
import 'package:tea_delivery/app/repositories/repositories.dart';

class CartViewModel extends ChangeNotifier {
  final CartRepository cartRepository;

  late StreamSubscription<List<CartItemEntity>> _subscription;

  CartViewModel({required this.cartRepository}) {
    setup();
  }

  void setup() {
    _subscription = cartRepository.cartItemsStream.listen((updateItems) => notifyListeners());
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  void pressOnIncreaseProductButton(ProductEntity product) {
    cartRepository.increaseProductQuantity(product);
    notifyListeners();
  }

  void pressOnDecreaseProductButton(ProductEntity product) {
    cartRepository.decreaseProductQuantity(product);
    notifyListeners();
  }

  int getQuantityProduct(ProductEntity product) {
    // TODO: прорпаботать возможную ошибку
    return cartRepository.getQuantityProduct(product) ?? -100;
  }

  List<CartItemEntity> getCartItems() => cartRepository.cartItems;
}
