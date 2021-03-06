import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/FontSizes.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/Fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BasicTextField extends StatelessWidget {
  BasicTextField(
      {this.maxLength = 50,
      this.controller,
      this.hintText = "",
      this.useObscureText = false,
      this.onValueChange});
  int maxLength;
  TextEditingController? controller;
  String hintText;
  bool useObscureText;
  Function(String)? onValueChange;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onValueChange,
      maxLength: maxLength,
      controller: controller,
      style: GoogleFonts.getFont(
        Fonts.medium.getValue(),
        color: DocColors.white.getValue(),
        fontWeight: Fonts.medium.getWeight(),
        fontSize: FontSizes.s.getValue(),
      ),
      maxLines: 1,
      obscureText: useObscureText,
      decoration: InputDecoration(
          border: InputBorder.none,
          counterText: "",
          hintText: hintText,
          hintStyle: GoogleFonts.getFont(
            Fonts.medium.getValue(),
            color: DocColors.gray.getValue(),
            fontWeight: Fonts.medium.getWeight(),
            fontSize: FontSizes.s.getValue(),
          )),
    );
  }
}
