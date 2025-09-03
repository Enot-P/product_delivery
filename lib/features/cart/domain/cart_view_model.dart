import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tea_delivery/app/entity/cart_item_entity.dart';
import 'package:tea_delivery/app/repositories/repositories.dart';

class CartViewModel extends ChangeNotifier {
  // List<CartItemEntity> _cartItems = [];
  final _cartRepository = GetIt.I<CartRepository>();

  List<CartItemEntity> get cartItems => List<CartItemEntity>.unmodifiable(_cartRepository.cartItems);

  late StreamSubscription<List<CartItemEntity>> _subscription;

  CartViewModel() {
    setup();
  }

  void setup() {
    _subscription = _cartRepository.cartItemsStream.listen((updateItems) => notifyListeners());
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
