import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tea_delivery/router/router.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        ProductsListRoute(),
        CartRoute(),
        ProfileRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) => _openPage(index, tabsRouter),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Каталог'),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Корзина'),
              BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Профиль'),
            ],
          ),
        );
      },
    );
  }

  void _openPage(int index, TabsRouter tabsRouter) {
    tabsRouter.setActiveIndex(index);
  }
}
