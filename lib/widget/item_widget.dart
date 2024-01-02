import 'package:flutter/material.dart';

import '../products/product_catalog.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget(item, {super.key, required this.item1})
      : assert(item != null);
  final Item item1;
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.deepPurple,
      shape: const StadiumBorder(),
      child: ListTile(
        onTap: () {},
        leading: Image.network(item1.image),
        title: Text(item1.name),
        subtitle: Text(item1.desc),
        trailing: Text(
          "\$${item1.price}",
          // ignore: deprecated_member_use
          textScaleFactor: 1.5,
          style: const TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
