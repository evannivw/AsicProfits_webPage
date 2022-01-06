import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Custom_Text.dart';
import 'package:flutter/material.dart';

import 'Fuentes/FontSizes.dart';
import 'Fuentes/Fonts.dart';


class MediumText extends StatelessWidget
{
  MediumText(this.text,
    {
      this.fontSize = FontSizes.s,
      this.color = DocColors.white,
      this.textAlign = TextAlign.left,
    }
  );
  TextAlign textAlign;
  String text;
  FontSizes fontSize;
  DocColors color;

  @override
  Widget build(BuildContext context) {
    return CustomText(text,
      color: color,
      fontFamily: Fonts.medium,
      fontSize: fontSize,
      maxLines: 2,
    );
  }
  
}