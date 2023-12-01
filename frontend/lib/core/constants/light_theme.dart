import "package:flutter/material.dart";

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: Color.fromARGB(255, 146, 195, 192),
    secondary: Color.fromARGB(255, 137, 113, 173),
    tertiary: Color.fromARGB(255, 187, 146, 117),
    background: Colors.white,
    onBackground: Color.fromARGB(255, 32, 38, 46)
  )
);