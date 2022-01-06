import 'package:asic_miner_website/BasicWidgets/ButtonWidgets/BasicButton.dart';
import 'package:asic_miner_website/BasicWidgets/CardWidgets/CardWidget.dart';
import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/Scene%20controller/SceneController.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/HorizontalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/VerticalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Bold_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/FontSizes.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Medium_Text.dart';
import 'package:asic_miner_website/TabPage%20View/Controller/TabPageViewController.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Icon%20Widget/SVGWidgets.dart';
import 'package:flutter/material.dart';

class SideView extends StatefulWidget
{
  SideView({this.tabController});
  TabPageViewController? tabController;
  @override
  State<StatefulWidget> createState() {
    return _SideView();
  }
  
}

class _SideView extends State<SideView>
{
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        
        AnimatedPositioned(
          duration: Duration(milliseconds: 100),
          right: !mounted ? -MediaQuery.of(context).size.width : 0,
          curve: Curves.easeInOut,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Container(
            color: Color(0xFF202024),
            margin: EdgeInsets.only(left:0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VerticalSpacing(height: 20,),
                  userRow(),
                  VerticalSpacing(),
                  currentDivider(),
                  
                  expandedButton(
                    "Miners",
                    ["Manufacteres","Vendors","Hosting"],
                    routes:[MainPage.Main,MainPage.Vendors,MainPage.Hosting]  
                  ),
                  currentDivider(),
                  expandedButton(
                    "Oportunities",
                    [],
                    routes: [MainPage.Main]
                  ),
                  currentDivider(),
                  expandedButton(
                    "Directories",
                    ["Manufacteres","Vendors"],
                    routes: [MainPage.Main,MainPage.Vendors],
                  ),
                  currentDivider(),
                  expandedButton(
                    "Help",
                    ["FAQ","Contact page", "Terms & Conditions","Privacy policy","Hosting application "],
                    routes:[MainPage.FAQ,MainPage.Contact,MainPage.Terms,MainPage.Privacy,MainPage.HostingAplication]  
                  ),
        
                  VerticalSpacing(height: (MediaQuery.of(context).size.height/2)-160,),
                  currentDivider(),
                  VerticalSpacing(),
                  logOutButton()
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget currentDivider()
  {
    return Divider(color: Color(0xFF707070),thickness: 0.25,);
  }

  Widget userRow()
  {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left:20,right: 20,top:10,bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  color: DocColors.white.getValue()
                ),
              ),
    
              HorizontalSpacing(),
    
              Material(
                color: DocColors.black.getValue(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BoldText("John Smith",fontSize: FontSizes(16),),
                    MediumText("johnsmith@gmail.com",fontSize: FontSizes.s,color: DocColors.gray,),
                  ],
                ),
              ),
              
            ],
          ),
        
          BasicButton(
            onPressed: (){SceneController.pop(context);},
            width: 36,
            height: 36,
            baseColor: DocColors.gray_2,
            child: SVGWidgets.xIcon,
          ),
        ],
      ),
    );
  }

  Widget expandedButton(String title, List<String> texts,{List<MainPage> routes = const []})
  {
    return Material(
      child: Container(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.only(top:10,bottom: 10,left: 10,right: 10),
        color: DocColors.black.getValue(),
        //hoverColor: DocColors(Color(0xFF343438)),
        child: 
        texts.length == 0 ? 
        sideButton(title, 15,route: routes[0])
        
        :
        ExpansionTile(
          title: MediumText(title,fontSize: FontSizes(16),),
          collapsedIconColor: DocColors.white.getValue(),
          iconColor: DocColors.white.getValue(),
          children: [
            for(int i = 0; i < texts.length; i++)
            sideButton(texts[i], 35,route: routes[i]),
          ],
        ),
      ),
    );
  }

  Widget sideButton(String text,double leftPadding, {double topBottomPadding = 10, MainPage? route})
  {
    return BasicButton(
      onPressed: (){
        SceneController.pop(context);
        widget.tabController?.nextPage(route ?? MainPage.Main);
      },
      width: MediaQuery.of(context).size.width-100,
      height: 50,
      cornerRadius: 0,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(top:topBottomPadding,bottom: topBottomPadding,left: leftPadding),
      child: Container(
        alignment: Alignment.centerLeft,
        child: MediumText(text,fontSize: FontSizes(16),)),
    );
  }

  Widget logOutButton()
  {
    return BasicButton(
      onPressed: (){
        
      },
      width: MediaQuery.of(context).size.width-100,
      height: 65,
      cornerRadius: 0,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(top:10,bottom: 10,left: 35),
      child: Container(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            SVGWidgets.logoutIcon,
            HorizontalSpacing(),
            MediumText("Log out",fontSize: FontSizes(16),),
          ],
        )),
    );
  }
  
}