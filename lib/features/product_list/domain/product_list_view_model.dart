import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tea_delivery/app/api_client/api_client.dart';
import 'package:tea_delivery/app/entity/entity.dart';
import 'package:tea_delivery/app/repositories/repositories.dart';
import 'package:tea_delivery/router/router.dart';

class ProductsListViewModel extends ChangeNotifier {
  final _apiClient = TeaApiClient();
  final _cartRepository = GetIt.I<CartRepository>();
  final _authRepository = GetIt.I<AuthRepository>();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<ProductEntity> _productList = [];
  List<ProductEntity> get productList => List<ProductEntity>.unmodifiable(_productList);

  ProductsListViewModel() {
    setup();
  }

  Future<void> setup() async {
    _isLoading = true;
    await Future.delayed(const Duration(seconds: 2));
    _productList = await _apiClient.getListTeas();

    _isLoading = false;
    notifyListeners();
  }

  void addProductInCart(ProductEntity product) => _cartRepository.addProduct(product);
  bool checkProductInCart(ProductEntity product) => _cartRepository.checkProductInCart(product);

  int getQuantityProduct(ProductEntity product) {
    // TODO: прорпаботать возможную ошибку
    return _cartRepository.getQuantityProduct(product) ?? -100;
  }

  void logout(BuildContext context) {
    _authRepository.deleteSessionToken();

    AutoRouter.of(context).pushAndPopUntil(AuthRoute(), predicate: (_) => false);
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   if (context.mounted) {
    //     AutoRouter.of(context).pushAndPopUntil(AuthRoute(), predicate: (_) => false);
    //   }
    // });
  }
}
