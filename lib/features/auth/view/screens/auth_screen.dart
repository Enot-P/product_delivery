import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:tea_delivery/app/repositories/auth_repository.dart';
import 'package:tea_delivery/features/auth/auth.dart';

@RoutePage()
class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthViewModel(
        _formKey,
        GetIt.I<AuthRepository>(),
      ),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              key: _formKey,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Вход',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 48),
                  Center(child: _ErrorMessageWidget()),
                  SizedBox(height: 16),
                  _LoginFieldWidget(),
                  SizedBox(height: 16),
                  _PasswordFieldWidget(),
                  SizedBox(height: 24),
                  _AuthButtonWidget(),
                  SizedBox(height: 16),
                  Center(child: _FoggotPasswordWidget()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ErrorMessageWidget extends StatelessWidget {
  const _ErrorMessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final errorMessage = context.select<AuthViewModel, String?>((model) => model.errorMessage);
    return errorMessage != null
        ? Text(
            errorMessage,
            style: const TextStyle(color: Colors.red),
          )
        : const SizedBox.shrink();
  }
}

class _FoggotPasswordWidget extends StatelessWidget {
  const _FoggotPasswordWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: const Text(
        'Забыли пароль?',
        style: TextStyle(fontSize: 16, color: Colors.blue),
      ),
    );
  }
}

class _AuthButtonWidget extends StatelessWidget {
  const _AuthButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<AuthViewModel>();
    return ElevatedButton(
      onPressed: () => model.onPressAuthButton(context),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),

      child: const Text(
        'Войти',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

class _PasswordFieldWidget extends StatelessWidget {
  const _PasswordFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AuthViewModel>();
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Пароль',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.lock),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
      controller: model.passControler,
      validator: (_) {
        if (model.hasPasswordError == true) {
          return 'Введите пароль';
        }
        return null;
      },
      onChanged: (_) {
        if (model.hasPasswordError) model.clearPasswordError();
      },
    );
  }
}

class _LoginFieldWidget extends StatelessWidget {
  const _LoginFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AuthViewModel>();
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Логин',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.email),
        errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      ),
      keyboardType: TextInputType.emailAddress,
      controller: model.loginControler,
      validator: (_) {
        if (model.hasLoginError) {
          return 'Введите логин';
        }
        return null;
      },
      onChanged: (_) {
        if (model.hasLoginError) model.clearLoginError();
      },
    );
  }
}
