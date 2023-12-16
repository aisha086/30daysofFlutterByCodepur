import 'package:catalog_project_codepur/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

import 'pages/cart_page.dart';
import 'package:catalog_project_codepur/utils/routes.dart';
import 'package:catalog_project_codepur/widgets/themes.dart';

import 'pages/login_page.dart';
import 'pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(VxState(
      store: MyStore(),
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.loginRoute,
      routes: {
        // "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.cartPageRoute: (context) => const CartPage()
      },
    );
  }
}
