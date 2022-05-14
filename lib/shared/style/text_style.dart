import 'package:flutter/material.dart';

TextStyle titleTextStyle({
  required Color titleColor
}) => TextStyle(
      color: titleColor,
      fontSize: 22.0,
      fontWeight: FontWeight.bold,
    );

TextStyle bodyTextStyle({required Color textColor}) => TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w800,
      color: textColor,
    );
