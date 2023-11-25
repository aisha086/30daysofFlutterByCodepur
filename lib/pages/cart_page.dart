import 'package:catalog_project_codepur/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Cart", style: TextStyle(fontSize: 25)),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _CartList().p32().expand(),
          const Divider(),
          const _CartTotal()
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal();

  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return Container(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}".text.xl4.color(context.theme.indicatorColor).make(),
          30.widthBox,
          ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Buying not supported yet!")));
                  },
                  child: "Buy".text.make())
              .w24(context)
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
   _CartList();

  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty? "Nothing to show".text.makeCentered() : ListView.builder(
        itemCount: _cart.items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.done_rounded),
            trailing: IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              onPressed: () {
                _cart.remove(_cart.items[index]);
                // setState(() {});
              },
            ),
            title: _cart.items[index].name.text.make(),
          );
        });
  }
}
