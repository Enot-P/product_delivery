import 'package:flutter/material.dart';
import 'package:talker/talker.dart';
import 'package:tea_delivery/app/entity/cart_item_entity.dart';
import 'package:tea_delivery/app/repositories/repositories.dart';

class CartViewModel extends ChangeNotifier {
  // List<CartItemEntity> _cartItems = [];
  List<CartItemEntity> get cartItems => List<CartItemEntity>.unmodifiable(CartRepository().cartItems);

  CartViewModel() {
    setup();
  }

  void setup() {
    // _cartItems = _cartRepository.cartItems;
    // Talker().debug(_cartItems);
    notifyListeners();
  }
}
