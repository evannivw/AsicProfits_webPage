import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Custom_Text.dart';
import 'package:flutter/material.dart';

import 'Fuentes/FontSizes.dart';
import 'Fuentes/Fonts.dart';


class BoldText extends StatelessWidget
{
  BoldText(this.text,
    {
      this.fontSize = FontSizes.l,
      this.color : DocColors.white,
    }
  );
  String text;
  FontSizes fontSize;
  DocColors color;

  @override
  Widget build(BuildContext context) {
    return CustomText(text,
      color: color,
      fontFamily: Fonts.bold,
      fontSize: fontSize,
      maxLines: 2,
    );
  }
  
}