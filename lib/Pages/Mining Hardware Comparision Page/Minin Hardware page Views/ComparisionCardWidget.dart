import 'package:asic_miner_website/BasicWidgets/ButtonWidgets/BasicButton.dart';
import 'package:asic_miner_website/BasicWidgets/CardWidgets/CardWidget.dart';
import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/HorizontalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/VerticalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Text%20field/BasicTextField.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Custom_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/FontSizes.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/Fonts.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Medium_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Regular_Text.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Icon%20Widget/SVGWidgets.dart';
import 'package:flutter/material.dart';

class ComparisionCardWidget extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return _ComparisionCardWidget();
  }

}
class _ComparisionCardWidget extends State<ComparisionCardWidget>
{
  @override
  Widget build(BuildContext context) {
    return CardWidget(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      width: 325,
      height: 1505,
      color: DocColors(Color(0xFF2B2B2F)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                textfieldWithTitle("Units"),
                HorizontalSpacing(width: 7.5,),
                dropdownWithTitle(
                  "Hardware",
                  dropDownLista: ["Antminer Z15"]
                )
              ],
            ),
          ),

          Divider(color: DocColors.gray.getValue(),thickness: 0.25,),

          VerticalSpacing(),

          title("Specs"),
          dataInfo("Manufacturer", "Bitmain"),
          dataInfo("Release date", "June 2020"),
          dataInfo("Size", "24.5 x 13.2 x 29.0 cm"),
          dataInfo("Weight", "9 kg"),
          dataInfo("Noise level", "70db"),
          dataInfo("Fan(s)", "2"),
          dataInfo("Power", "1510W"),
          dataInfo("Voltage", "12V"),
          dataInfo("Interface", "Ethernet"),
          VerticalSpacing(height: 20,),

          Divider(color: DocColors.gray.getValue(),thickness: 0.25,),

          title("Est. Daily Profits"),
          dataInfo("Daily", "\$20.41",dataColor: DocColors.green),
          dataInfo("Monthly", "\$612.49",dataColor: DocColors.green),
          dataInfo("Year", "\$7,348.72",dataColor: DocColors.green),
          VerticalSpacing(height: 20,),

          Divider(color: DocColors.gray.getValue(),thickness: 0.25,),

          title("Algorithms"),
          dataInfo("Algorythm", "Equihash"),
          dataInfo("Hashrate", "420ksol/s"),
          dataInfo("Consumption", "1510W"),
          dataInfo("Efficiency", "3.595j/ksol"),
          VerticalSpacing(height: 20,),

          Divider(color: DocColors.gray.getValue(),thickness: 0.25,),

          title("Minable Coins"),
          Padding(
            padding: EdgeInsets.only(left: 20,right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                coinWidget(size: 30),
                coinWidget(size: 30),
                coinWidget(size: 30),
                coinWidget(size: 30),
                coinWidget(size: 30),
                coinWidget(size: 30),
              ],
            ),
          ),
          VerticalSpacing(height: 20,),

          Divider(color: DocColors.gray.getValue(),thickness: 0.25,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              title("In Stock"),
              Container(
                width: 13,
                height: 13,
                margin: EdgeInsets.only(right: 20),
                child: InkWell(
                  onTap: (){},
                  child: 
                  true ?
                  SVGWidgets.checkboxFilledIcon :
                  SVGWidgets.checkboxEmptyIcon,
                ),
              ),
            ],
          ),

          VerticalSpacing(height: 40,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BasicButton(
                onPressed: (){},
                width: 132,
                height: 36,
                text: "Explore more",
                baseColor: DocColors.blue,
              )
            ],
          )
        ],
      ),
    );
  }

  //Coin of the minable coins section
  Widget coinWidget({double size = 41,double margin = 15})
  {
    return Container(
      width: size,
      height: size,
      margin: EdgeInsets.only(left:0,right: margin),
      padding: EdgeInsets.all(7.5),
      decoration: BoxDecoration(
        color: Color(0xFF333336),
        borderRadius: BorderRadius.circular(999)
      ),
      child: SVGWidgets.bitcoinIcon,
    );
  }

  //Info title widget
  Widget title(String title)
  {
    return Padding(
      padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
      child: MediumText(title,fontSize: FontSizes.m,),
    );
  }

  //Row with the data 
  Widget dataInfo(String title, String data,{DocColors dataColor = DocColors.white})
  {
    return Container(
      margin: EdgeInsets.only(top:10),
      padding: EdgeInsets.only(left:20,right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MediumText(title,color: DocColors.gray,),
          CustomText(
            data,
            fontFamily: Fonts.medium,
            fontSize: FontSizes.s,
            color: dataColor,
            textAlign: TextAlign.right,
          ),
        ],
      ),
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
          width: 53,
          height: 30,
          margin: EdgeInsets.zero,
          color: DocColors(Color(0xFF414045)),
          padding: EdgeInsets.only(left:10,right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: BasicTextField(
                  maxLength: 3,
                  controller: TextEditingController(text: "1"),  
                )
              ),
              RegularText("x",fontSize: const FontSizes(11),),
            ],
          )
        ),
      ],
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
          width: 223,
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


}