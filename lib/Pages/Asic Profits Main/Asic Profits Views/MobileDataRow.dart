import 'package:asic_miner_website/BasicWidgets/ButtonWidgets/BasicButton.dart';
import 'package:asic_miner_website/BasicWidgets/CardWidgets/CardWidget.dart';
import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/HorizontalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/VerticalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Bold_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/FontSizes.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Medium_Text.dart';
import 'package:asic_miner_website/Helpers/UIHelper.dart';
import 'package:asic_miner_website/Models/MinerModel.dart';
import 'package:asic_miner_website/TabPage%20View/Controller/TabPageViewController.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Icon%20Widget/SVGWidgets.dart';
import 'package:flutter/material.dart';

class MobileDataRow extends StatefulWidget
{
  MobileDataRow({this.callback,currentMiner});
  final MinerModel currentMiner = MinerModel();
  Function? callback;
  @override
  State<StatefulWidget> createState() {
    return _MobileDataRow();
  }

}

class _MobileDataRow extends State<MobileDataRow>
{
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        widget.callback?.call();
      },
      child: Container(
        margin: EdgeInsets.only(top:15,bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            title(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CardWidget(
                  borderColor: DocColors.green,
                  width: 60,
                  height: 22,
                  color: DocColors.transparent,
                  cornerRadius: 0,
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  child: MediumText("\$207.20",color: DocColors.green,fontSize: FontSizes.xs,),
                ),
                HorizontalSpacing(width: 5,),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: DocColors.white.getValue(),
                  size: 13,
                )
              ],
            )
          ],
        ),
      ),
    );
    return ExpansionTile(
      title: title(),
      collapsedIconColor: Colors.white,
      iconColor: Colors.white,
      tilePadding: EdgeInsets.symmetric(horizontal: 5),
      /*trailing: 
        AnimatedRotation(
          turns: _isExpanded ? 0.25 : 0,
          duration: Duration(milliseconds: 300),
          child: Container(
            width: 10,
            height: 10,
            color: DocColors.white.getValue(),
          ),
        ),*/
      onExpansionChanged: (valor)
      {
        setState(() {
          _isExpanded = valor;
        });
      },
      children: [
        VerticalSpacing(),
        InfoCard("Release", MediumText("Coming soon")),
        VerticalSpacing(),
        InfoCard("Hashrate", coloredText("3", "GH/s")),
        VerticalSpacing(),
        InfoCard("Power", coloredText("2556", "W")),
        VerticalSpacing(),
        InfoCard("Noise", coloredText("75", "db")),
        VerticalSpacing(),
        InfoCard("Algo", MediumText("EtHash")),
        VerticalSpacing(),
        InfoCard("Profitability", coloredText("\$231.85", "/day",mainColor: DocColors.green)),
        VerticalSpacing(),
        InfoCard("Link", linkButton("Visit")),
        VerticalSpacing(height: 20,),
      ],
    );
  
  }

  Widget title()
  {
    return Row(
      children: [
        Container(
          width: 29,
          height: 29,
          decoration: BoxDecoration(
            color: UIHelper().fromStringToColor(widget.currentMiner.color),
            borderRadius: BorderRadius.circular(999)
          ),
        ),
        HorizontalSpacing(),
        MediumText(widget.currentMiner.model,fontSize: FontSizes.s,),
      ],
    );
  }

  Widget InfoCard(String titulo,Widget data)
  {
    return Container(
      padding: EdgeInsets.only(left:15,right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 85,
            child: BoldText(titulo,color: DocColors.gray,fontSize: FontSizes.s,),
          ),
    
          Container(width: 105,
            alignment: Alignment.centerLeft,
            child: data,
          ),
          Container(width: 85,)
    
        ],
      ),
    );
  }

  Widget coloredText(String text, String unit,{DocColors mainColor = DocColors.white})
  {
    return Row(
          children: [
            MediumText(text,color: mainColor,fontSize: FontSizes.s,),
            MediumText(' ${unit}',color: DocColors.gray,fontSize: FontSizes.s,),
          ],
        );
  }

  Widget linkButton(String text)
  {
    return BasicButton(
            onPressed: (){},
            width: null,
            height: 29,
            splashColor: DocColors.black,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.zero,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MediumText(text,fontSize: FontSizes.s,color: DocColors(Color(0xFF5192FE)),),
                HorizontalSpacing(width: 5,),
                Container(width: 12.5,height: 11.1,child: SVGWidgets.linkIcon,)
              ],
            ),
          );
  }

}