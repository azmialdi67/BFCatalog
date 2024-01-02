import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primaryColor: darkBluish,
      listTileTheme: ListTileThemeData(textColor: darkBluish),
      colorScheme: ColorScheme.light(primary: darkBluish, secondary: darkBluish)
          .copyWith(brightness: Brightness.light),
      primaryTextTheme: TextTheme(titleLarge: TextStyle(color: darkBluish)),
      fontFamily: GoogleFonts.montserrat(color: darkBluish).fontFamily,
      cardColor: Colors.white,
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: darkBluish),
      canvasColor: creamColor,
      buttonTheme: ButtonThemeData(
          colorScheme: ColorScheme.fromSwatch(backgroundColor: darkBluish)),
      appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black)),
      textTheme: Theme.of(context).textTheme.copyWith(
              bodySmall: const TextStyle(
            color: Colors.black,
            backgroundColor: Colors.transparent,
          )),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(darkBluish))));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        primaryColor: lightBluish,
        listTileTheme: const ListTileThemeData(textColor: Colors.white),
        fontFamily: GoogleFonts.montserrat(color: lightBluish).fontFamily,
        primaryTextTheme: TextTheme(titleLarge: TextStyle(color: lightBluish)),
        buttonTheme: ButtonThemeData(
          colorScheme: ColorScheme.fromSwatch(backgroundColor: lightBluish),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(lightBluish),
        )),
        colorScheme: ColorScheme.dark(
          brightness: Brightness.dark,
          primary: lightBluish,
          secondary: Colors.white,
        ),
        cardColor: Colors.black,
        canvasColor: darkCreamColor,
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: lightBluish),
        appBarTheme: const AppBarTheme(
            color: Colors.black,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(
              color: Colors.white,
            )),
        textTheme: Theme.of(context).textTheme.copyWith(
                bodySmall: const TextStyle(
              color: Colors.white,
              backgroundColor: Colors.transparent,
            )),
      );

  //Colors
  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluish = const Color(0xff403b58);
  static Color lightBluish = Vx.indigo500;
}
