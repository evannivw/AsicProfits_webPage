import 'package:asic_miner_website/BasicWidgets/ButtonWidgets/BasicButton.dart';
import 'package:asic_miner_website/BasicWidgets/CardWidgets/CardWidget.dart';
import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/Drop%20down/BasicDropDown.dart';
import 'package:asic_miner_website/BasicWidgets/Scene%20controller/SceneController.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/HorizontalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/VerticalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Text%20field/BasicTextField.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Custom_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/FontSizes.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/Fonts.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Medium_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Regular_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Semi_BoldText.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Icon%20Widget/SVGWidgets.dart';
import 'package:flutter/material.dart';

class AdminCalculatorTopWidget extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return _AdminCalculatorTopWidget();
  }

}
class _AdminCalculatorTopWidget extends State<AdminCalculatorTopWidget>
{
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        topWidget(),
        VerticalSpacing(height: 15,),
        profitWidget(),
      ],
    );
  }

  Widget topWidget()
  {
    return CardWidget(
      width: null,
      height: 160,
      color: DocColors(Color(0xFF2B2B2F)),
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              width: 1045,
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  textfieldWithTitle("Hashrate",leadingText: "GH/s"),
                  textfieldWithTitle("Power consumption",leadingText: "W"),
                  //dropdownWithTitle("Currency",dropDownLista: ["USD"]),
                  textfieldWithTitle("Electricity cost"),
                  textfieldWithTitle("Network Difficulty",leadingText: ""),
                ],
              ),
            ),
          ),
          VerticalSpacing(),
          Divider(thickness: 0.25,color: DocColors.gray.getValue(),height: 0,),
          VerticalSpacing(height: 20,),
          Padding(
            padding: EdgeInsets.only(left:20,right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BasicButton(
                  width: 100,
                  onPressed: (){},
                  baseColor: DocColors.blue,
                  text: "Calculate",
                )
              ],
            ),
          ),
          VerticalSpacing(height: 20,),
          /*
          
          
          Padding(
            padding: EdgeInsets.only(top:20,bottom: 20,left: 10,right:10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MediumText("Filter",fontSize: FontSizes(11),color: DocColors.gray,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    
                    checkBoxWithTitle(
                      "Daily profits",
                      true,
                      (){
                        
                      }
                    ),
                    checkBoxWithTitle(
                      "Algorithms",
                      true,
                      (){
                        
                      }
                    ),
                    checkBoxWithTitle(
                      "Minable Coins",
                      true,
                      (){
                        
                      }
                    ),
                    checkBoxWithTitle(
                      "In Stock",
                      true,
                      (){
                        
                      }
                    ),
                  ],
                ),
              ],
            ),
          ),
          */
        ],
      ),
    );
  }

  Widget profitWidget()
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CardWidget(
          width: 250,
          height: 80,
          margin: EdgeInsets.all(0),
          color: DocColors(Color(0xFF2B2B2F)),
          padding: EdgeInsets.only(left:20,right: 20),
          alignment: Alignment.centerRight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              RegularText("PROFIT RATIO PER DAY"),
              SemiBoldText("129%",fontSize: FontSizes(25),),
            ],
          ),
        ),
        HorizontalSpacing(width: 15,),
        CardWidget(
          width: 250,
          height: 80,
          margin: EdgeInsets.all(0),
          color: DocColors(Color(0xFF2B2B2F)),
          padding: EdgeInsets.only(left:20,right: 20),
          alignment: Alignment.centerRight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              RegularText("PROFIT PER MONTH"),
              SemiBoldText("\$168.44",fontSize: FontSizes(25),),
            ],
          ),
        ),
      ],
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
          child:BasicDropDown(dropList: dropDownLista,fontSizes: FontSizes.s,) 
        )
      ],
    );
  }


  Widget textfieldWithTitle(String title,{String leadingText = "USD/kWh"} )
  {
    return Container(
      margin: EdgeInsets.only(left:5,right: 5),
      child: Column(
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
                RegularText(leadingText,fontSize: const FontSizes(11),),
              ],
            )
          ),
        ],
      ),
    );
  }
  

}