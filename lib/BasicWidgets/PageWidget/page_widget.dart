import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/PageWidget/View_Type.dart';
import 'package:asic_miner_website/BasicWidgets/Scene%20controller/SceneController.dart';
import 'package:flutter/material.dart';

import 'Basic_Protocol.dart';

///Widget de pagina con implementacion de BasicProtocol. implementar desktopView o mobileView
class PageWidget<T extends StatefulWidget> extends State<T> implements BasicProtocol
{
  @override
  double currentMaxWidth = 0;

  @override
  double currentMaxHeight = 0;

  @override
  final double maxWidth = 1146;

  @override
  final double changeViewWidth = 715;

  @override
  ViewType viewType = ViewType.desktop_full;


  @override
  Widget build(BuildContext context) {
    return GestureDetector
    (
      onTap: (){
        //TODO: implementar el desasignar focus
      },
      child: Scaffold(
            body: 
            LayoutBuilder(
                builder: (context, constraints) {
                  currentMaxHeight = constraints.maxHeight;
                  currentMaxWidth = constraints.maxWidth;
                  if(constraints.maxWidth >= changeViewWidth)
                  {
                    viewType = ViewType.desktop_full;
                  }else
                  {
                    viewType = ViewType.mobile;
                  }
                  SceneController.viewType = viewType;
                  SceneController.currentMaxWidth = currentMaxWidth > maxWidth ? maxWidth : currentMaxWidth;
                  
                  return Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      background(),
                      /*Container(
                        height: currentMaxHeight,
                        child: SingleChildScrollView(
                          padding: currentMargin(),
                          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                          child:viewType != ViewType.mobile ?
                                desktopView()
                                :
                                mobileView() ,
                        ),
                      )*/
                      ListView(
                        children: [
                          Container(
                            margin: currentMargin(),
                            width: currentMaxWidth,
                            //height: currentMaxHeight,
                            child: 
                              viewType != ViewType.mobile ?
                              desktopView()
                              :
                              mobileView() 
                          ),
                          bottomWidget()
                        ],
                      )
                    ]
                  );
              },
            ),
          ),
      );
  }

  @override
  EdgeInsets currentMargin()
  {
    var currentValue = (currentMaxWidth - maxWidth)/2;
    if(viewType == ViewType.mobile)
    {
      return EdgeInsets.only(top: 20,left: 15,right: 15);
    }else
    {
      if(currentValue > 0)
      {
        return EdgeInsets.only(top: 20,left:currentValue,right:currentValue); 
      }else
      {
        return EdgeInsets.only(top: 20,left: 20,right: 20); 
      }
    }
  }

  @override
  Widget background() {
    return Container(color: DocColors.black.getValue(),);
  }

  @override
  Widget desktopView() {
    return Container();
  }

  @override
  Widget mobileView() {
    return desktopView();
  }

  @override
  Widget bottomWidget()
  {
    return Container();
  }
  

}