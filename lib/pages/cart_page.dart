import 'package:flutter/material.dart';
import 'package:flutter_intro_project/core/store.dart';
import 'package:flutter_intro_project/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: "Cart".text.xl2.make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          const Divider(),
          const _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal();

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "".text.makeCentered()
        : SizedBox(
            height: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                VxConsumer(
                  notifications: const {},
                  mutations: const {RemoveMutation},
                  builder: (context, store, _) => "\$${_cart.totalPrice}"
                      .text
                      .xl5
                      .color(context.accentColor)
                      .make(),
                ),
                30.widthBox,
                ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  "Buying not supported yet.".text.make()));
                        },
                        child: "Buy".text.white.make())
                    .w32(context)
              ],
            ),
          );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    // ignore: no_leading_underscores_for_local_identifiers
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Nothing to show here."
            .text
            .color(context.accentColor)
            .xl3
            .makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
                leading: Icon(
                  Icons.done,
                  color: context.accentColor,
                ),
                trailing: IconButton(
                    icon: const Icon(
                      Icons.remove_circle_outline,
                      color: Vx.red500,
                    ),
                    onPressed: () => RemoveMutation(_cart.items[index])),
                title: "${_cart.items[index].name}".text.make()),
          );
  }
}
