import 'package:asic_miner_website/BasicWidgets/ButtonWidgets/BasicButton.dart';
import 'package:asic_miner_website/BasicWidgets/CardWidgets/CardWidget.dart';
import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/Scene%20controller/SceneController.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/FontSizes.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Medium_Text.dart';
import 'package:asic_miner_website/Helpers/WindowHelper.dart';
import 'package:asic_miner_website/Models/WhereToBuyModel.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Icon%20Widget/SVGWidgets.dart';
import 'package:flutter/material.dart';

class WhereToBuyCard extends StatelessWidget
{
  WhereToBuyCard({@required seller});

  final WhereToBuyModel seller = WhereToBuyModel();
  
  @override
  Widget build(BuildContext context) {
    return SceneController.isMobilView ?
    desktopView() : desktopView();
  }

  Widget mobileView()
  {
    return CardWidget(
      height: 57,
      color: DocColors(Color(0xFF27272B)),
      margin: EdgeInsets.only(top:10,bottom: 5),
      padding: EdgeInsets.only(left: 15,right: 15),
      alignment: Alignment.centerLeft,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          width: SceneController.currentMaxWidth,
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Imagen
              Container(width: 111,height: 36,
                child: Image.network(
                  seller.imageURL,
                  fit:BoxFit.contain,
                ),
              ),
              
              //Price
              MediumText("\$29, 999. 00"),
              
              //More info
              MediumText("PSU included",color: DocColors.gray,),

              //Shipping
              MediumText("2-5 days",color: DocColors.gray,),

              //Button
              BasicButton(
                onPressed: (){},
                width: 66,
                height: 29,
                text: "Shop",
                baseColor: DocColors.blue,
                padding: EdgeInsets.zero,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget desktopView()
  {
    return CardWidget(
      height: 57,
      color: DocColors(Color(0xFF27272B)),
      margin: EdgeInsets.only(top:10,bottom: 5),
      padding: EdgeInsets.only(left: 15,right: 15),
      alignment: Alignment.centerLeft,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          width: 1095,
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Imagen
              Container(width: 111,height: 36,color: DocColors.blue_2.getValue(),),
              
              //Link
              Column(
                children: [
                  MediumText(seller.nameSeller,color: DocColors.green,),
                  MediumText(seller.subtitle,color: DocColors.gray,fontSize: FontSizes.xs,),
                ],
              ),
              
              //Flag
              Container(
                width: 22,
                height: 22,
                child: SVGWidgets.usaFlagIcon,
              ),
              
              //Price
              MediumText("\$${seller.price}"),
              
              //Avaliability
              MediumText(seller.available,
                color: seller.available.toLowerCase().contains("out of stock")?
                DocColors.red: DocColors.green,
                
                ),
              
              //More info
              MediumText(seller.moreInfo,color: DocColors.gray,),

              //Shipping
              MediumText(seller.shipping,color: DocColors.gray,),

              //Button
              BasicButton(
                onPressed: (){
                  WindowHelper().openInNewTab(seller.visitLink);
                },
                width: 66,
                height: 29,
                text: "Shop",
                baseColor: DocColors.blue,
                padding: EdgeInsets.zero,
              )
            ],
          ),
        ),
      ),
    );
  }
  
}