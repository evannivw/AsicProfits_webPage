import 'package:asic_miner_website/BasicWidgets/ButtonWidgets/BasicButton.dart';
import 'package:asic_miner_website/BasicWidgets/CardWidgets/CardWidget.dart';
import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/Page%20view/ExpandablePageView.dart';
import 'package:asic_miner_website/BasicWidgets/Scene%20controller/SceneController.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/HorizontalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/VerticalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Text%20field/BasicTextField.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Bold_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Custom_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/FontSizes.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/Fonts.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Medium_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Regular_Text.dart';
import 'package:asic_miner_website/Pages/FAQ%20Page/FAQ%20views/ExpansionCard.dart';
import 'package:asic_miner_website/Pages/FAQ%20Page/Faq%20Text/FaqTexts.dart';
import 'package:asic_miner_website/Pages/Hosting%20Page/Hosting%20page%20views/HostingCard.dart';
import 'package:asic_miner_website/Pages/Mining%20Hardware%20Comparision%20Page/Controller/MHCPageController.dart';
import 'package:asic_miner_website/Pages/Mining%20Hardware%20Comparision%20Page/Minin%20Hardware%20page%20Views/ComparisionCardWidget.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Bottom%20Widgets/BotonInfoWidget.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Bottom%20Widgets/DisclaimerWidget.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Bottom%20Widgets/WeeklyAsicWidget2.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Buying%20Options/BuyingOpportunitiesWidget.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Icon%20Widget/SVGWidgets.dart';
import '../../Proyect Widgets/Bottom Widgets/WeeklyAsicWidget.dart';
import 'package:flutter/material.dart';

class MHCPage extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return _MHCPage();
  }
  
}
class _MHCPage extends State<MHCPage>
{
  MHCPageController _controller = MHCPageController();

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
            MediumText("Miners", color: DocColors.gray,),
            Icon(Icons.arrow_right,size: 15,color: DocColors.gray.getValue(),),
            MediumText("Comparison",color: DocColors.gray,),
            Icon(Icons.arrow_right,size: 15,color: DocColors.white.getValue(),),
            MediumText("Compare",),
          ],
        ),
        VerticalSpacing(),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 1000),
          child: mainView(),
        ),
        VerticalSpacing(height: 100,),
        WeeklyAsicWidget2(),
        BuyingOpportunitiesWidget(),
        BottomInfoWidget(),
      ],
    );
  }

  Widget mainView()
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //Titulo
        BoldText("Mining hardware comparison",fontSize:SceneController.isMobilView ? FontSizes(35): FontSizes(40),),
        MediumText(
          "Compare hashrate, profitability, and power consumption of different hardware",
          fontSize: FontSizes.m,
          color: DocColors.gray,
        ),
        VerticalSpacing(height: 40,),

        comparisionCardWidget(),

        VerticalSpacing(height: 20,),
        
        //Compare gpu card
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ComparisionCardWidget(),
            HorizontalSpacing(width: 20,),
            ComparisionCardWidget(),
          ],
        )
      ],
    );

  }

  //First card where you choose what gpu to compare
  Widget comparisionCardWidget()
  {
    return CardWidget(
      width: 668,
      height: 180,
      color: DocColors(Color(0xFF2B2B2F)),
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                dropdownWithTitle("Currency"),
                textfieldWithTitle("Electricity"),
                dropdownWithTitle("Reward calculation",dropDownLista: ["Current"]),
              ],
            ),
          ),

          Divider(thickness: 0.25,color: DocColors.gray.getValue(),height: 0,),
          
          Padding(
            padding: EdgeInsets.only(top:20,bottom: 20,left: 20,right:20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MediumText("Filter",fontSize: FontSizes(11),color: DocColors.gray,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    checkBoxWithTitle(
                      "With alerts",
                      _controller.enableAlerts,
                      (){
                        setState(() {
                          _controller.enableAlerts = !_controller.enableAlerts;
                        });
                      }
                    ),
                    checkBoxWithTitle(
                      "Specs",
                      _controller.enableSpecs,
                      (){
                        setState(() {
                          _controller.enableSpecs = !_controller.enableSpecs;
                        });
                      }
                    ),
                    checkBoxWithTitle(
                      "Daily profits",
                      _controller.enableDailyProfits,
                      (){
                        setState(() {
                          _controller.enableDailyProfits = !_controller.enableDailyProfits;
                        });
                      }
                    ),
                    checkBoxWithTitle(
                      "Algorithms",
                      _controller.enableAlgo,
                      (){
                        setState(() {
                          _controller.enableAlgo = !_controller.enableAlgo;
                        });
                      }
                    ),
                    checkBoxWithTitle(
                      "Minable Coins",
                      _controller.enableMinableCoins,
                      (){
                        setState(() {
                          _controller.enableMinableCoins = !_controller.enableMinableCoins;
                        });
                      }
                    ),
                    checkBoxWithTitle(
                      "In Stock",
                      _controller.enableInStock,
                      (){
                        setState(() {
                          _controller.enableInStock = !_controller.enableInStock;
                        });
                      }
                    ),
                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }

  //First card - checkbox
  Widget checkBoxWithTitle(String title,bool enable, Function() onTap)
  {
    return Container(
      margin: EdgeInsets.only(top:10),
      child: Row(
        children: [
          Container(
            width: 13,
            height: 13,
            child: InkWell(
              onTap: onTap,
              child: 
              enable ?
              SVGWidgets.checkboxFilledIcon :
              SVGWidgets.checkboxEmptyIcon,
            ),
          ),
          HorizontalSpacing(width: 7.5,),
          MediumText(title,fontSize: FontSizes.xs,)
        ],
      ),
    );
  }


  Widget dropdownWithTitle(String title, {List<String> dropDownLista = const ["USD"]})
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MediumText(title,fontSize: FontSizes(11),color: DocColors.gray,),
        VerticalSpacing(height: 5,),
        CardWidget(
          width: 194,
          height: 30,
          margin: EdgeInsets.zero,
          color: DocColors(Color(0xFF414045)),
          padding: EdgeInsets.only(left:10,right: 10),
          child: DropdownButton<String>(
            isExpanded: true,
            underline: Container(),
            dropdownColor: DocColors.gray_4.getValue(),
            iconDisabledColor: DocColors.white.getValue(),
            iconEnabledColor: DocColors.white.getValue(),
            iconSize: 15,
            value: dropDownLista[0],
            items: dropDownLista.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: MediumText(value,fontSize: FontSizes.xs,),
              );
            }).toList(),
            onChanged: (str) {

            },
          ),
        )
      ],
    );
  }


  Widget textfieldWithTitle(String title, )
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MediumText(title,fontSize: FontSizes(11),color: DocColors.gray,),
        VerticalSpacing(height: 5,),
        CardWidget(
          width: 194,
          height: 30,
          margin: EdgeInsets.zero,
          color: DocColors(Color(0xFF414045)),
          padding: EdgeInsets.only(left:10,right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: BasicTextField(maxLength: 5,)
              ),
              RegularText("USD/kWh",fontSize: const FontSizes(11),),
            ],
          )
        ),
      ],
    );
  }
  

  

}