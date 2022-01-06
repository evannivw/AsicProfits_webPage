import 'package:asic_miner_website/BasicWidgets/ButtonWidgets/BasicButton.dart';
import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/Text%20field/BasicTextField.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/FontSizes.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Medium_Text.dart';
import 'package:asic_miner_website/UI%20Controllers/Image%20Picker/ImagePicker.dart';
import 'package:flutter/material.dart';

class AddMinerMiningPools extends StatefulWidget
{
  AddMinerMiningPools({this.deleteCallback});
  
  Function? deleteCallback;
  @override
  State<StatefulWidget> createState() {
    return _AddMinerMiningPools();
  }

}

class _AddMinerMiningPools extends State<AddMinerMiningPools>
{
  List<bool> miningPlanList = [true];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:5,bottom: 5),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                BasicButton(
                  onPressed: (){
                    ImagePicker.pick((p0) => null);
                  },
                  width: 150,
                  height: 50,
                  cornerRadius: 5,
                  baseColor: DocColors(Color(0xFF333237).withOpacity(0.35)),
                  padding: EdgeInsets.only(left:20,right: 20),
                  child: IgnorePointer(
                    ignoring: true,
                    child: MediumText("Pool image",color: DocColors.gray,)
                  )
                ),
                currentDivider(),
                Container(
                  width: 150,
                  child: BasicTextField(hintText: "Pool name",),
                ),
                currentDivider(),
                Container(
                  width: 150,
                  child: BasicTextField(hintText: "Pool web page",),
                ),
                currentDivider(),
                for(var plan in miningPlanList)
                coinWidget((){
                  if(miningPlanList.length > 1)
                  {
                    setState(() {
                      miningPlanList.removeLast();
                    });
                  }
                }),

                currentDivider(),
                Container(
                  width: 150,
                  child: BasicTextField(hintText: "Referral code",),
                ),
                currentDivider(),
                Container(
                  width: 150,
                  child: BasicTextField(hintText: "Fees",),
                ),
                currentDivider(),
                Container(
                  width: 150,
                  child: BasicTextField(hintText: "Visit link",maxLength: 500,),
                ),
              ],
            ),
          ),
          Positioned(
            top: -7.5,
            right: -7.5,
            child: BasicButton(
              onPressed: (){
                widget.deleteCallback?.call();
              },
              width: 25,
              height: 25,
              baseColor: DocColors.gray_2,
              child: Icon(Icons.delete,size: 13,),
            ),
          )
        ],
      ),
    );
  }

  Widget coinWidget(Function callback)
  {
    return Container(
      margin: EdgeInsets.only(right: 7.5),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topRight,
        children: [
          BasicButton(
            onPressed: (){
              ImagePicker.pick((p0){
                setState(() {
                  miningPlanList.add(true);
                });
              });
            },
            width: 75,
            height: 50,
            cornerRadius: 5,
            alignment: Alignment.center,
            baseColor: DocColors(Color(0xFF333237).withOpacity(0.35)),
            padding: EdgeInsets.only(left:7.5,right: 7.5),
            child: IgnorePointer(
              ignoring: true,
              child: MediumText("plan coin",fontSize: FontSizes.xs,color: DocColors.gray,textAlign: TextAlign.center,)
            )
          ),

          miningPlanList.length == 1 ? Container():
          Positioned(
            top: 0,
            right: -5,
            child: BasicButton(
              onPressed: (){
                callback();
              },
              width: 20,
              height: 20,
              baseColor: DocColors(Colors.white.withOpacity(0.05)),
              child: Icon(Icons.delete,size: 13,),
            ),
          )
        ],
      ),
    );
  }

  Widget currentDivider()
  {
    return Container(
      margin: EdgeInsets.only(left:15,right: 15),
      width: 1,
      height: 25,
      color: DocColors.gray.getValue(),
    );
  }
} 