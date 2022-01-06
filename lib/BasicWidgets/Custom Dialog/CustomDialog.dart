import 'package:flutter/material.dart';

class CustomDialog
{
  static void makeDialog(BuildContext context,Widget view, {Color barrierColor = const Color(0x7d383838)})
  {
    showDialog(
      context: context, 
      useSafeArea: false,
      barrierColor: barrierColor,
      builder: (context)
      {
        return view;
      }
    );
  }
}