import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/shared/style/text_style.dart';

ThemeData lightTheme() => ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primarySwatch: Colors.deepOrange,
      appBarTheme: AppBarTheme(
        titleSpacing: 20.0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation: 10.0,
        backgroundColor: Colors.white,
        titleTextStyle: titleTextStyle(titleColor: Colors.black,),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepOrange,
        elevation: 20.0,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
      ),
      textTheme: TextTheme(
        bodyText1: bodyTextStyle(
          textColor: Colors.black,
        ),
      ),
    );

ThemeData darkTheme() => ThemeData(
      scaffoldBackgroundColor: const Color(0xFF333739),
      primarySwatch: Colors.deepOrange,
      appBarTheme: AppBarTheme(
        titleSpacing: 20.0,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        elevation: 10.0,
        backgroundColor: const Color(0xFF333739),
        titleTextStyle: titleTextStyle(
          titleColor: Colors.white,
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor:  Color(0xFF333739),
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepOrange,
        elevation: 20.0,
        backgroundColor: Color(0xFF333739),
        unselectedItemColor: Colors.grey,
      ),
      textTheme: TextTheme(
        bodyText1: bodyTextStyle(
          textColor: Colors.white,
        ),
      ),
    );
