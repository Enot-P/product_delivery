import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tea_delivery/app/entity/entity.dart';
import 'package:tea_delivery/app/repositories/repositories.dart';

class CartViewModel extends ChangeNotifier {
  final CartRepository _cartRepository;
  late StreamSubscription<List<CartItemEntity>> _subscription;

  List<CartItemEntity> get cartItems => _cartRepository.cartItems;
  int get finalPrice => _cartRepository.finalPrice;

  CartViewModel({required CartRepository cartRepository}) : _cartRepository = cartRepository {
    _setup();
  }

  void _setup() {
    _subscription = _cartRepository.cartItemsStream.listen((updateItems) => notifyListeners());
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  void pressOnIncreaseProductButton(ProductEntity product) {
    _cartRepository.increaseProductQuantity(product);
    notifyListeners();
  }

  void pressOnDecreaseProductButton(ProductEntity product) {
    _cartRepository.decreaseProductQuantity(product);
    notifyListeners();
  }

  int getQuantityProduct(ProductEntity product) {
    return _cartRepository.getQuantityProduct(product) ?? -100;
  }
}
