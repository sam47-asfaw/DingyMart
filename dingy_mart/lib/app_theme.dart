import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class AppTheme{

  static AppBarTheme appBarTheme = AppBarTheme(
    foregroundColor: Colors.white,
    backgroundColor: Colors.indigo.shade50,
    shadowColor: Colors.indigo.shade50,
    elevation: 0.8,
    actionsIconTheme: commonIconTheme,

  );
  static IconThemeData commonIconTheme = const IconThemeData(
    color: Colors.indigo,
    size: 30.0,
  );

  static TextTheme commonTextTheme = TextTheme(
    headline1: GoogleFonts.poppins(
    color: Colors.indigo,
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    ),
    headline2: GoogleFonts.poppins(
    color: Colors.indigo,
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
    ),
    headline3: GoogleFonts.poppins(
    color: Colors.indigo,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    ),
    headline4: GoogleFonts.poppins(
    color: Colors.indigo,
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    ),
    headline5: GoogleFonts.poppins(
      color: Colors.indigo,
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
    ),
    headline6: GoogleFonts.poppins(
      color: Colors.black87,
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
    ),
  );

  static ThemeData commonTheme(){
    return ThemeData(
      brightness: Brightness.light,
      appBarTheme: appBarTheme,
      textTheme: commonTextTheme,
      iconTheme: commonIconTheme,
    );
  }
}


