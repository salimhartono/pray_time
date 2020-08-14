import 'package:flutter/material.dart';

final baseTextStyle = const TextStyle(color: Colors.white);

final styleCityHeader = baseTextStyle
    .copyWith(fontSize: 35.0, fontWeight: FontWeight.bold, shadows: <Shadow>[
  Shadow(
    offset: Offset(2.0, 2.0),
    blurRadius: 3.0,
    color: Color.fromARGB(255, 0, 0, 0),
  ),
  Shadow(
    offset: Offset(2.0, 2.0),
    blurRadius: 8.0,
    color: Color.fromARGB(125, 0, 0, 255),
  ),
]);

final styleAddresHeader = baseTextStyle
    .copyWith(fontSize: 20.0, fontWeight: FontWeight.w400, shadows: <Shadow>[
  Shadow(
    offset: Offset(2.0, 2.0),
    blurRadius: 3.0,
    color: Color.fromARGB(255, 0, 0, 0),
  ),
  Shadow(
    offset: Offset(2.0, 2.0),
    blurRadius: 8.0,
    color: Color.fromARGB(125, 0, 0, 255),
  ),
]);

final styleListText =
    baseTextStyle.copyWith(fontSize: 18.0, fontWeight: FontWeight.w400);

final styleTimeText =
    baseTextStyle.copyWith(fontSize: 18.0, fontWeight: FontWeight.bold);
