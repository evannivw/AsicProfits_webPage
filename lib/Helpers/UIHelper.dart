import 'package:flutter/material.dart';

class UIHelper
{
  Color fromStringToColor(String strColor)
  {
    switch(strColor.toLowerCase())
    {
      case "yellow": return Colors.yellow;
    }
    return Colors.yellow;
  }

  String fromColorToString(Color color)
  {
    if(color == Color(0xFFFFEB3B))
    {
      return "yellow";
    }
    return "yellow";
  }
}