import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/FontSizes.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/Fonts.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Medium_Text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class BasicDropDown extends StatefulWidget
{
  BasicDropDown(
    {
      this.hintText = "",
      this.dropList = const ['A','B','C'],
      this.fontSizes = FontSizes.m,
      this.initValue,
    
    }
  );
  List<String> dropList;
  String hintText;
  FontSizes fontSizes;
  String? initValue;
  @override
  State<StatefulWidget> createState() {
    return _BasicDropDown();
  }
}
class _BasicDropDown extends State<BasicDropDown>
{
  String? _currentValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentValue = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: MediumText(widget.hintText,fontSize: FontSizes.m,color: DocColors.gray,),
      isExpanded: true,
      underline: Container(),
      dropdownColor: Color(0xFF26242A),
      iconDisabledColor: DocColors.white.getValue(),
      iconEnabledColor: DocColors.white.getValue(),
      iconSize: 15,
      value: _currentValue,
      items: widget.dropList.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: MediumText(value,fontSize: widget.fontSizes,),
        );
      }).toList(),
      onChanged: (str) {
        setState(() {
          _currentValue = str;
        });
      },
    );
  }
  
}