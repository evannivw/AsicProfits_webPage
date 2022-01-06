import 'package:asic_miner_website/BasicWidgets/ButtonWidgets/BasicButton.dart';
import 'package:asic_miner_website/BasicWidgets/CardWidgets/CardWidget.dart';
import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/HorizontalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/VerticalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Bold_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/FontSizes.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Medium_Text.dart';
import 'package:asic_miner_website/Models/MinerModel.dart';
import 'package:flutter/material.dart';

class BuyingOptionCard extends StatelessWidget
{
  BuyingOptionCard({@required currentMiner});
  final MinerModel currentMiner = MinerModel();
  @override
  Widget build(BuildContext context) {
    return card();
  }
  
  Widget card()
  {
    return CardWidget(
      width: 257.5,
      height: 277,
      color: DocColors(Color(0xFFFFFFFF).withOpacity(0.05)),
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          //First container
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  //Name
                  Row(
                    children: [

                      //Circle
                      Container(
                        width: 29,
                        height: 29,
                        decoration: BoxDecoration(
                          color: DocColors.white.getValue(),
                          borderRadius:BorderRadius.circular(999)
                        ),
                      ),

                      HorizontalSpacing(),

                      //Texts
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BoldText("Bitmain",fontSize: FontSizes.xs,),
                          MediumText(currentMiner.model,fontSize: FontSizes.xs,color: DocColors.gray,)
                        ],
                      )
                    ],
                  ),

                  VerticalSpacing(height: 5,),

                  //Precio/day
                  Row(
                    children: [
                      MediumText('\$231.85',color: DocColors.green,),
                      MediumText('/day',color: DocColors.gray,),
                    ],
                  )
                ],
              ),

              //Imagen
              Container(
                width:69,
                height: 95,
                child: Image.asset('assets/images/miner.png'),
              )
            ],
          ),

          VerticalSpacing(height: 5,),

          containerCard('Income'),
          containerCard('Electricity'),
          containerCard('Profit'),
          
          VerticalSpacing(),
          
          BasicButton(
            onPressed: (){},
            width: null,
            height: 29,
            text: "Buy",
            textColor: DocColors.white,
            baseColor: DocColors(Color(0xFF39383D)),
          )

          
        ],
      ),
    );
  }

  Widget containerCard(String title)
  {
    return Column(
      children: [
        //VerticalSpacing(),
        Divider(color: DocColors.gray.getValue(),thickness: 0.25,height: 12.5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MediumText(title,fontSize: FontSizes.xs,),
            Row(
              children: [
                MediumText('\$231.85',color: DocColors.green,fontSize: FontSizes.xs,),
                MediumText('/yearly',color: DocColors.gray,fontSize: FontSizes.xs,),
              ],
            )
          ],
        )
      ],
    );
  }
}