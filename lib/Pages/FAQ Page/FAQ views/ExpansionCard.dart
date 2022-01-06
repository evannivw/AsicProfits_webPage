import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Icon%20Widget/SVGWidgets.dart';
import 'package:flutter/material.dart';

class ExpansionCard extends StatefulWidget
{
  ExpansionCard({this.title,this.text,this.divider});

  Widget? title;
  Widget? text;
  Widget? divider;

  @override
  State<StatefulWidget> createState() {
    return _ExpansionCard();
  }

}

class _ExpansionCard extends State<ExpansionCard>
{
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return expansionCard();
  }
  
  Widget expansionCard()
  {
    return Column(
      children: [
        ExpansionTile(
          tilePadding: EdgeInsets.zero,
          title: widget.title ?? Container(),
          collapsedIconColor: Colors.white,
          iconColor: Colors.white,
          controlAffinity: ListTileControlAffinity.platform,
          trailing: 
            AnimatedRotation(
              turns: _isExpanded ? 0.125 : 0,
              duration: Duration(milliseconds: 300),
              child: Container(
                width: 13,
                height: 13,
                child: SVGWidgets.plus2Icon,
              ),
            ),
          children: [
            widget.text ?? Container(),
          ],
          onExpansionChanged: (valor)
          {
            setState(() {
              _isExpanded = valor;
            });
          },
        ),
        widget.divider ?? Container()
      ],
    );
  }
  
}