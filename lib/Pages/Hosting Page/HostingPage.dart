import 'package:asic_miner_website/BasicWidgets/ButtonWidgets/BasicButton.dart';
import 'package:asic_miner_website/BasicWidgets/CardWidgets/CardWidget.dart';
import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/Page%20view/ExpandablePageView.dart';
import 'package:asic_miner_website/BasicWidgets/Scene%20controller/SceneController.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/HorizontalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/VerticalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Bold_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Custom_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/FontSizes.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/Fonts.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Medium_Text.dart';
import 'package:asic_miner_website/Pages/FAQ%20Page/FAQ%20views/ExpansionCard.dart';
import 'package:asic_miner_website/Pages/FAQ%20Page/Faq%20Text/FaqTexts.dart';
import 'package:asic_miner_website/Pages/Hosting%20Page/Hosting%20page%20views/HostingCard.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Bottom%20Widgets/BotonInfoWidget.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Bottom%20Widgets/DisclaimerWidget.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Bottom%20Widgets/WeeklyAsicWidget2.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Buying%20Options/BuyingOpportunitiesWidget.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Icon%20Widget/SVGWidgets.dart';
import '../../Proyect Widgets/Bottom Widgets/WeeklyAsicWidget.dart';
import 'package:flutter/material.dart';

class HostingPage extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return _HostingPage();
  }
  
}
class _HostingPage extends State<HostingPage>
{
  int _currentPage = 0;
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return desktopView();
  }

  Widget desktopView()
  {
    return Column(
      //direction: Axis.vertical,
      //crossAxisAlignment: CrossAxisAlignment.start,
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            MediumText("Hosting facilities", color: DocColors.gray,),
            Icon(Icons.arrow_right,size: 15,color: DocColors.white.getValue(),),
            MediumText("Compare",),
          ],
        ),
        VerticalSpacing(),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 1000),
          child: mainView(),
        ),
        VerticalSpacing(height: 50,),
        WeeklyAsicWidget2(),
        BuyingOpportunitiesWidget(),
        BottomInfoWidget()
      ],
    );
  }
 
  Widget mainView()
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //Titulo
        BoldText("Hosting Facilities",fontSize:SceneController.isMobilView ? FontSizes(35): FontSizes(40),),
    
        VerticalSpacing(height: 20,),
    
        //Hosting cards
        SceneController.isMobilView ?
        Column(
          children: [
            HostingCard(),
            VerticalSpacing(),
            HostingCard(),
            VerticalSpacing(),
            HostingCard(),
            VerticalSpacing(),
            HostingCard(),
            VerticalSpacing(),
          ],
        ):
        Container(
          height: 700,
          width: SceneController.currentMaxWidth,
          child: GridView.extent(
            maxCrossAxisExtent: 400,
            shrinkWrap: true,
            cacheExtent: 200,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: <Widget>[
              HostingCard(),
              HostingCard(),
              HostingCard(),
              HostingCard(),
              HostingCard(),
              HostingCard(),
            ],
          ),
        ),
    
        VerticalSpacing(height: 20,),
        
        //View more button
        SceneController.isMobilView ?
        BasicButton(
          onPressed: (){},
          width: null,
          height: 29,
          splashColor: DocColors.black,
          child: MediumText("See more",fontSize: FontSizes.s,color: DocColors(Color(0xFF5192FE)),)
        ):
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BasicButton(
              onPressed: (){},
              width: 123,
              height: 29,
              baseColor: DocColors(Color(0xFF39383D)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 8,height: 8,child: SVGWidgets.plusIcon,),
                  HorizontalSpacing(width: 7.5,),
                  MediumText("View more",fontSize: FontSizes.s,)
                ],
              ),
            ),
          ],
        )
        
      ],
    );
  }
  
  
  

}