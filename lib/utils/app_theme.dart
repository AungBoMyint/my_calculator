import 'package:flutter/material.dart';

ThemeData lightTheme() => ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        )),
    tabBarTheme: const TabBarTheme(
      indicator: BoxDecoration(),
      labelColor: Colors.black,
      labelStyle: TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelColor: Colors.grey,
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: Colors.black,
        fontSize: 45,
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        color: Colors.black54,
        fontSize: 35,
        fontWeight: FontWeight.bold,
      ),
      headline3: TextStyle(
        color: Colors.amber,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      headline4: TextStyle(
        color: Colors.black,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      headline6: TextStyle(
        color: Colors.grey,
        fontSize: 20,
      ),
      subtitle1: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      subtitle2: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ));
ThemeData darkTheme() => ThemeData.dark().copyWith(
    tabBarTheme: const TabBarTheme(
      indicator: BoxDecoration(),
      labelColor: Colors.white,
      labelStyle: TextStyle(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelColor: Colors.grey,
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: Colors.white,
        fontSize: 45,
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        color: Colors.white70,
        fontSize: 35,
        fontWeight: FontWeight.bold,
      ),
      headline3: TextStyle(
        color: Colors.yellow,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      headline4: TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      headline6: TextStyle(
        color: Colors.grey,
        fontSize: 20,
      ),
      subtitle1: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      subtitle2: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ));
