import 'package:asic_miner_website/BasicWidgets/PageWidget/View_Type.dart';
import 'package:flutter/material.dart';

abstract class BasicProtocol
{
  ///La vista de escritorio dependiendo de el width de la pantalla y de maxWidth
  Widget desktopView();

  ///La vista para mobiles dependiendo de el width de la pantalla y de maxWidth
  Widget mobileView();

  //el fondo de la vista
  Widget background();

  //Botom widget of website, no margin
  Widget bottomWidget();

  //El margen de la pantalla; implementar dependiendo de la viewType
  EdgeInsets currentMargin();

  //El tipo de vista de la pantalla
  ViewType viewType = ViewType.desktop_full;

  //El width maximo de el contenido de el website
  final double maxWidth = 1000;

  //El width maximo para cambiar el tiepo de viewType
  final double changeViewWidth = 715;

  //El maxWidth actual de el layout de la vista
  double currentMaxWidth = 0;

  //El maxHeight actual de el layout de la vista
  double currentMaxHeight = 0;
}