import 'package:flutter/material.dart';
import 'package:flutter_intro_project/widget/home_widgets/add_to_cart.dart';
import 'package:flutter_intro_project/widget/home_widgets/catalog_image.dart';
import 'package:flutter_intro_project/products/product_catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({
    super.key,
    required this.catalog,
    // ignore: unnecessary_null_comparison
  })  : assert(catalog != null);
  @override
  Widget build(BuildContext context) {
    var children2 = [
      Hero(
          tag: Key(catalog.id.toString()),
          child: CatalogImage(image: catalog.image)),
      Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          catalog.name.text.bold.lg.color(context.accentColor).make(),
          catalog.desc.text
              .textStyle(context.captionStyle)
              .color(context.accentColor)
              .make(),
          10.heightBox,
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              "\$${catalog.price}"
                  .text
                  .color(context.accentColor)
                  .bold
                  .xl
                  .make(),
              AddToCart(catalog)
            ],
          ).pOnly(right: 8.0)
        ],
      ).p(context.isMobile ? 0 : 16))
    ];
    return VxBox(
      child: context.isMobile
          ? Row(
              children: children2,
            )
          : Column(
              children: children2,
            ),
    ).color(context.cardColor).rounded.square(150).make().py16();
  }
}
