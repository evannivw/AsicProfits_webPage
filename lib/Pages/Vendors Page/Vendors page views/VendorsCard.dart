import 'package:asic_miner_website/BasicWidgets/ButtonWidgets/BasicButton.dart';
import 'package:asic_miner_website/BasicWidgets/CardWidgets/CardWidget.dart';
import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/Scene%20controller/SceneController.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/HorizontalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/VerticalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/FontSizes.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Medium_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Semi_BoldText.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Icon%20Widget/SVGWidgets.dart';
import 'package:flutter/material.dart';

class VendorsCard extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return _VendorsCard();
  }

}

class _VendorsCard extends State<VendorsCard>
{
  bool _isHover = false;
  @override
  Widget build(BuildContext context) {
    return 
    SceneController.isMobilView?
    mobileVendorsCard() : vendorsCard();
  }
  
  Widget mobileVendorsCard()
  {
    return Container(
      margin: EdgeInsets.only(top:10,bottom: 10),
      child: ExpansionTile(
        iconColor: DocColors.white.getValue(),
        collapsedIconColor: Colors.white,
        tilePadding: EdgeInsets.zero,
        title: Row(
          children: [
            //Imagen
            Container(width: 102,height: 23,color: DocColors.blue_2.getValue(),),
            HorizontalSpacing(width: 20,),
            //Seller
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MediumText("51ASIC"),
                MediumText("www.51asic.ru",color: DocColors.gray,fontSize: FontSizes.xs,),
              ],
            ),
          ],
        ),
        children: [
          VerticalSpacing(height: 20,),
          CardWidget(
              margin: EdgeInsets.zero,
              color: DocColors(Color(0xFF2B2B2F)),
              padding: EdgeInsets.all(20),
              height: null,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SemiBoldText("Country",color: DocColors.gray,fontSize: FontSizes.xs,),
                      VerticalSpacing(height: 20,),
                      SemiBoldText("Distributor",color: DocColors.gray,fontSize: FontSizes.xs,),
                      VerticalSpacing(height: 20,),
                      SemiBoldText("Payment",color: DocColors.gray,fontSize: FontSizes.xs,),
                      VerticalSpacing(height: 20,),
                      SemiBoldText("Trust",color: DocColors.gray,fontSize: FontSizes.xs,),
                      VerticalSpacing(height: 20,),
                      SemiBoldText("Visit",color: DocColors.gray,fontSize: FontSizes.xs,),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 22,
                            height: 14,
                            color: DocColors.red.getValue(),
                          ),
                          HorizontalSpacing(),
                          MediumText("Russia",fontSize: FontSizes.xs,),
                        ],
                      ),
                      VerticalSpacing(height: 20,),
                      MediumText("Bitmain, Ebang, BW",fontSize: FontSizes.xs,),
                      VerticalSpacing(height: 20,),
                      MediumText("Cryptocurrency",fontSize: FontSizes.xs,),
                      VerticalSpacing(height: 20,),
                      SVGWidgets.trustIcon,
                      VerticalSpacing(height: 20,),
                      InkWell(
                        onTap: (){},
                        child: MediumText("Visit",fontSize: FontSizes.s,color: DocColors(Color(0xFF5192FE)),)
                      )
                    ],
                  ),
                  
                  HorizontalSpacing(width: 20,),
                ],
              ),
            ),
        ],
      ),
    );
  }

  //Card of current vendor
  Widget vendorsCard()
  {
    return CardWidget(
      height: 57,
      color: DocColors(Color(0xFF27272B)),
      margin: EdgeInsets.only(top:10,bottom: 5),
      padding: EdgeInsets.only(left: 15,right: 15),
      alignment: Alignment.centerLeft,
      borderColor: _isHover ? DocColors.green : DocColors.transparent,
      onHover: (b)
      {
        setState(() {
          _isHover = b;
        });
      },
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          width: 1095,
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Imagen
              Container(width: 102,height: 23,color: DocColors.blue_2.getValue(),),
              
              //Seller
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MediumText("51ASIC"),
                  MediumText("www.51asic.ru",color: DocColors.gray,fontSize: FontSizes.xs,),
                ],
              ),
              
              //Country
              Row(
                children: [
                  Container(
                    width: 22,
                    height: 15,
                    color: DocColors.red.getValue(),
                  ),
                  HorizontalSpacing(),
                  MediumText("Russia",color: DocColors.gray,fontSize: FontSizes.s,),
                ],
              ),
              
              //Distributor
               MediumText("Bitmain, Ebang, BW",color: DocColors.gray,fontSize: FontSizes.s,),

              //Payment
              MediumText("Wire transfer Cryptocurrency",color: DocColors.gray,fontSize: FontSizes.s,),

              //Trust
              SVGWidgets.trustIcon,
              
              //Button
              BasicButton(
                onPressed: (){},
                width: 66,
                height: 29,
                text: "Visit",
                baseColor:_isHover ? DocColors.blue : DocColors(Color(0xFF39383D)),
                padding: EdgeInsets.zero,
              )
            ],
          ),
        ),
      ),
    );
  }
}