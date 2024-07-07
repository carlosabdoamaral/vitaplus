import 'package:flutter/material.dart';
import 'package:vitaplus/utils/color_utils.dart';

const pinkDark = Color.fromRGBO(255, 0, 76, 1);
const pinkLight = Color.fromRGBO(245, 62, 117, 1);

const blueDark = Color.fromRGBO(47, 46, 65, 1);
const blueLight = Color.fromRGBO(52, 47, 130, 1);

Color purple = hexToColor("6B45CC");
Color blue = Colors.indigo;
LinearGradient defaultGradient = LinearGradient(
  colors: [hexToColor("6B45CC"), hexToColor("275CAF")],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);
