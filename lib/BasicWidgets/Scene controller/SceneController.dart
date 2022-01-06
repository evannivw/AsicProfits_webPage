import 'package:asic_miner_website/BasicWidgets/PageWidget/View_Type.dart';
import 'package:flutter/material.dart';

class SceneController
{
  static ViewType viewType = ViewType.desktop_full;
  static double currentMaxWidth = 0;

  static bool get isMobilView => viewType == ViewType.mobile;

  static void pop(BuildContext context)
  {
    if(Navigator.canPop(context))
    {
      Navigator.pop(context);
    }
  }
  static void push(BuildContext context, {@required dynamic nextPage})
  {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => nextPage),
    );
  }

  static void pushAndRemoveUntil(BuildContext context, {@required dynamic nextPage})
  {
    Navigator.pushAndRemoveUntil(context, 
      MaterialPageRoute(builder: (context) => nextPage), 
      (Route<dynamic> route) => false
    );
  }
}