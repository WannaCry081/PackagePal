import "package:flutter/material.dart";

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: Color.fromARGB(255, 167, 222, 219),
    secondary: Color.fromARGB(255, 160, 131, 203),
    tertiary: Color.fromARGB(255, 215, 165, 131),
    background: Color.fromARGB(255, 32, 38, 46),
    onBackground: Colors.white
  )
);