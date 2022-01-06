import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Custom_Text.dart';
import 'package:flutter/material.dart';

import 'Fuentes/FontSizes.dart';
import 'Fuentes/Fonts.dart';


class LightText extends StatelessWidget
{
  LightText(this.text,
    {
      this.fontSize = FontSizes.xxs,
      this.color : DocColors.black,
    }
  );
  String text;
  FontSizes fontSize;
  DocColors color;

  @override
  Widget build(BuildContext context) {
    return CustomText(text,
      color: color,
      fontFamily: Fonts.light,
      fontSize: fontSize
    );
  }
  
}