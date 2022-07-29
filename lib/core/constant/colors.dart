import 'package:flutter/material.dart';

const primaryColor = Color(0xFF056CDA);
const lightBlueColor = Color(0xFFB8DAFC);
const orangeColor = Color(0xFFF9BE7E);
const greyColor = Color(0xFFC9C9C9);
const backgroundColor = Color(0xFFF5F6FC);
const greyTextColor = Color(0xFF5C5B5B);


 const MaterialColor mainColor = const MaterialColor(
   0xFF056CDA, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
  const <int, Color>{
    50: const Color(0xFF056CDA ),//10%
    100: const Color(0xFF056CDA),//20%
    200: const Color(0xFF056CDA),//30%
    300: const Color(0xFF056CDA),//40%
    400: const Color(0xFF056CDA),//50%
    500: const Color(0xFF056CDA),//60%
    600: const Color(0xFF056CDA),//70%
    700: const Color(0xFF056CDA),//80%
    800: const Color(0xFF056CDA),//90%
    900: const Color(0xFF056CDA),//100%
  },
);