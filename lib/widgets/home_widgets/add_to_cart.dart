import 'package:catalog_project_codepur/core/store.dart';
import 'package:catalog_project_codepur/models/cart.dart';
import 'package:catalog_project_codepur/models/catalog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {

  final Item catalog;
  AddToCart({super.key, required this.catalog});



  @override
  Widget build(BuildContext context) {

    VxState.watch(context, on: [AddMutation,RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;

    bool isInCart = _cart.items.contains(catalog);
    return ElevatedButton(
        onPressed: (){
          if(!isInCart){
            AddMutation(catalog);
          }
        },
        style: ButtonStyle(
            shape:
            MaterialStateProperty.all(const StadiumBorder())),
        child: isInCart? const Icon(Icons.done) : const Icon(CupertinoIcons.cart_badge_plus)
    );
  }
}