import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:flutter/material.dart';

import 'Custom_Text.dart';
import 'Fuentes/FontSizes.dart';
import 'Fuentes/Fonts.dart';


class RegularText extends StatelessWidget
{
  RegularText(this.text,
    {
      this.fontSize = FontSizes.xs,
      this.color = DocColors.white,
    }
  );
  String text;
  FontSizes fontSize;
  DocColors color;

  @override
  Widget build(BuildContext context) {
    return CustomText(text,
      color: color,
      fontFamily: Fonts.regular,
      fontSize: fontSize
    );
  }
  
}