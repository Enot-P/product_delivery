// Создаем guard
import 'package:auto_route/auto_route.dart';
import 'package:get_it/get_it.dart';
import 'package:tea_delivery/app/repositories/repositories.dart';
import 'package:tea_delivery/router/router.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(NavigationResolver resolver, StackRouter router) async {
    final AuthRepository authRepository = GetIt.I<AuthRepository>();
    final sessionToken = await authRepository.getSessionToken();
    if (sessionToken == null) {
      resolver.next(true);
    } else {
      await router.replace(const HomeRoute());
    }
  }
}
