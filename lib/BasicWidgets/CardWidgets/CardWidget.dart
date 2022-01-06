import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget
{
  CardWidget({
    Key? key,
    this.child,
    this.width = double.infinity,
    this.height = double.infinity,
    this.color = DocColors.white,
    this.borderColor = DocColors.transparent,
    this.cornerRadius = 5,
    this.padding = const EdgeInsets.all(10),
    this.margin = const EdgeInsets.only(left:5,right: 5),
    this.constraints = const BoxConstraints(),
    this.alignment = Alignment.center,
    this.hoverColor,
    this.onHover,
    }
  ) : super(key: key);
  Widget? child;
  double? width;
  double? height;
  DocColors color;
  DocColors? hoverColor;
  DocColors borderColor;
  double cornerRadius;
  EdgeInsets? padding;
  EdgeInsets? margin; 
  BoxConstraints constraints;
  Alignment alignment;
  Function(bool)? onHover;
  @override
  State<StatefulWidget> createState() {
    return _CardWidget();
  }
  
}
class _CardWidget extends State<CardWidget>
{
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (pointer){
        widget.onHover?.call(true);
        if(widget.hoverColor == null)return;
        setState(() {
          isHover = true;
        });
      },
      onExit: (pointer)
      {
        widget.onHover?.call(false);
        if(widget.hoverColor == null)return;
        setState(() {
          isHover = false;
        });
      },
      child: ConstrainedBox(
        constraints: widget.constraints,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          key: widget.key,
          width: widget.width,
          height: widget.height,
          padding: widget.padding,
          margin: widget.margin,
          alignment: widget.alignment,
          decoration: BoxDecoration(
            color:isHover && widget.hoverColor != null ? widget.hoverColor!.getValue() : widget.color.getValue(),
            borderRadius: BorderRadius.all(Radius.circular(widget.cornerRadius)),
            border: Border.all(color: widget.borderColor.getValue(),width: 0.5),
          ),
          child: widget.child,
        ),
      ),
    );
  }

}