import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intro_project/core/store.dart';
import 'package:flutter_intro_project/models/cart.dart';
import 'package:flutter_intro_project/products/product_catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart(this.catalog, {super.key});
  final cart = CartModel();
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel cart = (VxState.store as MyStore).cart;
    bool isInCart = cart.items.contains(catalog);
    return ElevatedButton(
        onPressed: () {
          if (!isInCart) {
            AddMutation(catalog);
          }
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(context.primaryColor),
            shape: MaterialStateProperty.all(const StadiumBorder())),
        child: isInCart
            ? const Icon(
                Icons.done,
                color: Colors.white,
              )
            : const Icon(
                CupertinoIcons.cart_badge_plus,
                color: Colors.white,
              ));
  }
}
