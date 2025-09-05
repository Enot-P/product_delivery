import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tea_delivery/app/repositories/repositories.dart';
import 'package:tea_delivery/router/router.dart';

class AuthViewModel extends ChangeNotifier {
  final GlobalKey<FormState> formKey;
  final AuthRepository _authRepository;
  AuthViewModel(this.formKey, this._authRepository);

  final loginControler = TextEditingController();
  final passControler = TextEditingController();

  String? _errorMessaage;
  String? get errorMessage => _errorMessaage;

  bool _isAuthProgress = false;
  bool get isAuthProgress => _isAuthProgress;

  bool _hasLoginError = false;
  bool get hasLoginError => _hasLoginError;

  bool _hasPasswordError = false;
  bool get hasPasswordError => _hasPasswordError;

  void clearLoginError() {
    _hasLoginError = false;
    _errorMessaage = null;
    formKey.currentState!.validate();
    notifyListeners();
  }

  void clearPasswordError() {
    _hasPasswordError = false;
    _errorMessaage = null;
    formKey.currentState!.validate();
    notifyListeners();
  }

  void onPressAuthButton(BuildContext context) {
    _isAuthProgress = true;
    _hasLoginError = loginControler.text.isEmpty;
    _hasPasswordError = passControler.text.isEmpty;

    if (_hasLoginError || _hasPasswordError) {
      formKey.currentState!.validate();
      notifyListeners();
    } else if (formKey.currentState!.validate()) {
      _errorMessaage = null;
      _authRepository.setSessionToken();
      AutoRouter.of(context).pushAndPopUntil(const HomeRoute(), predicate: (_) => false);
    }
    _isAuthProgress = false;
  }
}
