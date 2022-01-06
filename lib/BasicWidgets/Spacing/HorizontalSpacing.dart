import 'package:flutter/material.dart';

class HorizontalSpacing extends StatelessWidget
{
  HorizontalSpacing({this.width=10});
  double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width,);
  }
  
}