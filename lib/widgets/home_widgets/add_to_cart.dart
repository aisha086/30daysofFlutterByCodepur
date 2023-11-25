import 'package:catalog_project_codepur/models/cart.dart';
import 'package:catalog_project_codepur/models/catalog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {

  final Item catalog;
  AddToCart({super.key, required this.catalog});


  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(catalog);
    return ElevatedButton(
        onPressed: (){
          if(!isInCart){
            isInCart = isInCart.toggle();
            final _catalog = CatalogModel();

            _cart.catalog = _catalog;
            _cart.add(catalog);
            // setState(() {});
          }
        },
        style: ButtonStyle(
            shape:
            MaterialStateProperty.all(const StadiumBorder())),
        child: isInCart? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus)
    );
  }
}