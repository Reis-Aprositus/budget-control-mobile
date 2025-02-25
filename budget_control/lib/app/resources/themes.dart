import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getwidget/getwidget.dart';

final ThemeData greenTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white, // Set the text color to white
        backgroundColor: const Color.fromARGB(255, 242,113,35), // Orange background
      )),
  appBarTheme: const AppBarTheme(color: Color.fromARGB(255, 242,113,35)),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: const Color.fromARGB(255, 242,113,35))),
  textTheme: GoogleFonts.workSansTextTheme()
      .apply(bodyColor: Colors.black),


);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.deepPurple,
  hintColor: Colors.tealAccent,
  cardColor: Colors.black,
  scaffoldBackgroundColor: Colors.black,
  cardTheme: const CardTheme(color: Color(0xFF222222), elevation: 0),
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black, // Set the text color to black green
        backgroundColor: const Color.fromARGB(255, 242,113,35), // Orange background
      )),
  iconTheme: const IconThemeData(
    color: Color.fromARGB(255,255,170,51), // Set icon color
  ),
  listTileTheme: const ListTileThemeData(
      tileColor: Color.fromARGB(255,255,170,51), // Set tile color
      textColor: Colors.black, // Set text color
      iconColor: Colors.white),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: const Color.fromARGB(255,255,170,51))),
  textTheme: GoogleFonts.workSansTextTheme()
      .apply(bodyColor: const Color.fromARGB(255,255,170,51)),
);