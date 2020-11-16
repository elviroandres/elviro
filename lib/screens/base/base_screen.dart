import 'package:flutter/material.dart';
import 'package:busaca/common/custom_drawer/custom_drawer.dart';
import 'package:busaca/models/page_manager.dart';
import 'package:busaca/screens/products/products_screen.dart';
import 'package:provider/provider.dart';
import 'package:busaca/screens/login/login_screen.dart';

class BaseScreen extends StatelessWidget {

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PageManager(pageController),
      child: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(), // can't allow scroll
        children: <Widget>[
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: const Text('Home'),
            ),
          ),
          ProductsScreen(),
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: const Text('Home4'),
            ),
          ),
        ],
      ),
    );
  }
}
