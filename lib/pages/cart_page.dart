import 'package:catalog_project_codepur/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title:  const Text("Cart", style: TextStyle(
          fontSize: 25
        )),
        centerTitle: true,
      ),
    );
  }
}
