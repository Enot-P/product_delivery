import 'package:talker/talker.dart';
import 'package:tea_delivery/app/entity/entity.dart';

class CartRepository {
  CartRepository._();

  static final CartRepository _instance = CartRepository._();

  factory CartRepository() {
    return _instance;
  }

  List<CartItemEntity> _cartItems = [];
  List<CartItemEntity> get cartItems => _cartItems;

  // TODO: Найти решение получше, чтобы не пробегать по всему массиву каждый раз
  void removeProductByProduct(ProductEntity product) => _cartItems.removeWhere((item) => item.product == product);
  void removeProductByIndex(int index) => _cartItems.removeAt(index);
  void addProduct(ProductEntity product) {
    _cartItems.add(CartItemEntity(product: product, quantity: 1));
    Talker().debug(_cartItems);
  }

  bool checkProduct(ProductEntity product) => _cartItems.any((item) => item.product == product);

  void increaseProductQuantity(ProductEntity product) {
    final indexProductInCart = _cartItems.indexWhere((item) => item.product == product);

    if (indexProductInCart > 0) {
      _cartItems[indexProductInCart].quantity += 1;
    } else {
      throw 'Товара нету в корзине';
    }
  }

  void decreaseProductQuantity(ProductEntity product) {
    final indexProductInCart = _cartItems.indexWhere((item) => item.product == product);
    if (indexProductInCart == -1) throw 'Товара нету в корзине';

    if (_cartItems[indexProductInCart].quantity > 1) {
      _cartItems[indexProductInCart].quantity -= 1;
    } else {
      removeProductByIndex(indexProductInCart);
    }
  }
}
