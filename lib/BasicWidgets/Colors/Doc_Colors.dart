import 'package:flutter/material.dart';

///Colores de el proyecto
class DocColors
{
  const DocColors(this._value);

  final Color _value;

  //valor de el docColor en Color
  Color getValue()
  {
    return _value;
  }

  ///Color transparent
  static const DocColors transparent = DocColors(Color(0x00000000));

  ///Color negro
  static const DocColors black = DocColors(Color(0xFF202024));

  ///Color blue
  static const DocColors blue = DocColors(Color(0xFF0053FF));

  ///Color gray
  static const DocColors gray = DocColors(Color(0xFF949496));

  ///Color white
  static const DocColors white = DocColors(Colors.white);

  ///Color green
  static const DocColors green = DocColors(Color(0xFF00FF85));

  ///Color red
  static const DocColors red = DocColors(Color(0xFFFF4500));

  ///Color gray_2
  static const DocColors gray_2 = DocColors(Color(0xFF333237));

  ///Color blue_2
  static const DocColors blue_2 = DocColors(Colors.blueAccent);

  ///Color gray3
  static const DocColors gray_3 = DocColors(Color(0xFF41424B));

  ///Color gray4
  static const DocColors gray_4 = DocColors(Color(0xFF414045));

  ///Color black2
  static const DocColors black_2 = DocColors(Color(0xFF333237));  

}