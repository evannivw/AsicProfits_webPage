import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/FontSizes.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/Fonts.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Controller/TextController.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget
{
  
  CustomText(this.text,
    {
      this.fontSize = FontSizes.s,
      this.fontFamily = Fonts.regular,
      this.color = DocColors.white,
      this.overflow = TextOverflow.ellipsis,
      this.textAlign = TextAlign.left,
      this.maxLines = 1,
    }
  );

  ///texto de el widget
  String text;

  ///Tamano de fuente de el widget
  FontSizes fontSize;

  ///Tipo de fuente de el widget
  Fonts fontFamily;

  ///Color de el texto
  DocColors color;

  TextOverflow overflow;
  
  TextAlign textAlign;

  int maxLines = 1;


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      maxLines: maxLines,
      textAlign: textAlign,
      style:
          TextController.useGoogleFont?
          GoogleFonts.getFont(
            fontFamily.getValue(),
            color: this.color.getValue(),
            fontWeight: fontFamily.getWeight(),
            fontSize: fontSize.getValue(),
            height: 1.55,
          )
          :
          TextStyle(
            fontSize: fontSize.getValue(),
            fontFamily: fontFamily.getValue(),
            color: color.getValue(),
            letterSpacing: 0,
            height: 1,
            fontWeight: fontFamily.getWeight()
          ),
      );
  }
  
}