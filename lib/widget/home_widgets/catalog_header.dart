import 'package:flutter/material.dart';
// import 'package:flutter_intro_project/widget/themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      "Catalog"
          .text
          .xl5
          .bold
          .color(context.accentColor)
          .fontFamily(GoogleFonts.poppins().fontFamily.toString())
          .make(),
      "Trending products".text.color(context.accentColor).xl.make()
    ]).pOnly(bottom: 8);
  }
}
