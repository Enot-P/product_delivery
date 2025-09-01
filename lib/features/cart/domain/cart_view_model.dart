import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tea_delivery/app/entity/cart_item_entity.dart';
import 'package:tea_delivery/app/repositories/repositories.dart';

class CartViewModel extends ChangeNotifier {
  // List<CartItemEntity> _cartItems = [];
  List<CartItemEntity> get cartItems => List<CartItemEntity>.unmodifiable(CartRepository().cartItems);

  late StreamSubscription<List<CartItemEntity>> _subscription;

  CartViewModel() {
    setup();
  }

  void setup() {
    _subscription = CartRepository().cartItemsStream.listen((updateItems) => notifyListeners());
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
