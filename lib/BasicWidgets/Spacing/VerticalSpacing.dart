import 'package:flutter/material.dart';

class VerticalSpacing extends StatelessWidget
{
  VerticalSpacing({this.height = 10});
  double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height,);
  }
  
}