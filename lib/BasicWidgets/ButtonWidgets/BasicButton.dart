import 'package:asic_miner_website/BasicWidgets/CardWidgets/CardWidget.dart';
import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/FontSizes.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Medium_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Regular_Text.dart';
import 'package:flutter/material.dart';

class BasicButton extends StatelessWidget
{
  BasicButton({
    @required this.onPressed,
    this.baseColor = DocColors.black,
    this.textColor = DocColors.white,
    this.text = "Button",
    this.width = 86,
    this.height = 32,
    this.cornerRadius = 100,
    this.child,
    this.padding = const EdgeInsets.only(top: 5, bottom: 5,left: 0,right: 0),
    this.alignment = Alignment.center,
    this.splashColor,
    }
  );
  Function()? onPressed;
  String text;
  Widget? child;
  DocColors baseColor;
  DocColors textColor;
  double? width;
  double? height;
  double cornerRadius;
  EdgeInsets padding;
  Alignment alignment;
  DocColors? splashColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double?>(0),
          padding: MaterialStateProperty.all<EdgeInsets>(padding),
          overlayColor:splashColor == null ? null : MaterialStateProperty.all<Color>(splashColor!.getValue()),
          backgroundColor: MaterialStateProperty.all<Color>(baseColor.getValue()),
          //mouseCursor: MaterialStateProperty.all<MouseCursor>(SystemMouseCursors.cell),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(cornerRadius),
              //side: BorderSide(color: Colors.white)
            )
          )
        ),
        onPressed: onPressed, 
        child: 
          child == null ? 
          Container(
            alignment: alignment,
            child: MediumText(text,color: textColor),
          )
          : 
          child!
        ),
    );
  }
  
}