import 'package:flutter/material.dart';

///Tipo de fuente usado en la aplicacion
class Fonts
{
  //Nombre de la fuente
  static const FONT_NAME = "Poppins";


  const Fonts(this._value,this._weight);
  
  //valor actual de la fuente
  final String _value;
  final FontWeight _weight;

  ///Devuelve el valor de el font en string
  String getValue()
  {
    return _value;
  }
  FontWeight getWeight()
  {
    return _weight;
  }

  ///Light
  static const Fonts light = Fonts(FONT_NAME,FontWeight.w300);

  ///Regular
  static const Fonts regular = Fonts(FONT_NAME,FontWeight.w400);

  ///Medium
  static const Fonts medium = Fonts(FONT_NAME,FontWeight.w500);

  ///Semi bold
  static const Fonts semiBold = Fonts(FONT_NAME,FontWeight.w600);

  ///Bold
  static const Fonts bold = Fonts(FONT_NAME,FontWeight.w700);

  ///Black
  static const Fonts black = Fonts(FONT_NAME,FontWeight.w800);

  
}