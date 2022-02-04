import 'package:asic_miner_website/Backend/Firebase/Storage/FirebaseStorage.dart';
import 'package:asic_miner_website/BasicWidgets/ButtonWidgets/BasicButton.dart';
import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/Text%20field/BasicTextField.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/FontSizes.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Medium_Text.dart';
import 'package:asic_miner_website/Helpers/UIHelper.dart';
import 'package:asic_miner_website/Models/MinableCoinModel.dart';
import 'package:asic_miner_website/Models/MiningPoolModel.dart';
import 'package:asic_miner_website/UI%20Controllers/Image%20Picker/ImagePicker.dart';
import 'package:flutter/material.dart';

class AddMinerMiningPools extends StatefulWidget {
  AddMinerMiningPools(
      {this.id = "",
      this.index = 0,
      this.deleteCallback,
      this.saveCallback,
      this.currentMiningPool});
  String id;
  int index;
  MiningPoolModel? currentMiningPool;
  Function(MiningPoolModel)? saveCallback = (s) {};
  Function? deleteCallback = () {};
  @override
  State<StatefulWidget> createState() {
    return _AddMinerMiningPools(currentMiningPool ?? MiningPoolModel());
  }
}

class _AddMinerMiningPools extends State<AddMinerMiningPools> {
  MiningPoolModel miningPoolModel;
  List<MinableCoinModel> coinList = [];
  _AddMinerMiningPools(this.miningPoolModel);

  @override
  void initState() {
    super.initState();
    if (miningPoolModel.miningPlans.length == 0) {
      coinList.add(MinableCoinModel());
    } else {
      coinList = miningPoolModel.miningPlans;
    }
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                BasicButton(
                    onPressed: () {
                      ImagePicker.pick((p0) async {
                        UIHelper().showLoading(context);
                        String url = await FirebaseStorage().uploadImage(p0,
                            "miners/" + widget.id, "pool/image${widget.index}");
                        UIHelper().hideLoading(context);
                        setState(() {
                          miningPoolModel.imageURL = url;
                          widget.saveCallback?.call(miningPoolModel);
                        });
                      });
                    },
                    width: 150,
                    height: 50,
                    cornerRadius: 5,
                    baseColor: DocColors(Color(0xFF333237).withOpacity(0.35)),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: IgnorePointer(
                        ignoring: true,
                        child: MediumText(
                          miningPoolModel.imageURL != ""
                              ? "Image loaded"
                              : "Pool image",
                          color: DocColors.gray,
                        ))),
                currentDivider(),
                Container(
                  width: 150,
                  child: BasicTextField(
                    controller:
                        TextEditingController(text: miningPoolModel.name),
                    hintText: "Pool name",
                    onValueChange: (str) {
                      miningPoolModel.name = str;
                      widget.saveCallback?.call(miningPoolModel);
                    },
                  ),
                ),
                currentDivider(),
                Container(
                  width: 150,
                  child: BasicTextField(
                    maxLength: 1000,
                    hintText: "Pool web page",
                    controller:
                        TextEditingController(text: miningPoolModel.webPage),
                    onValueChange: (str) {
                      miningPoolModel.webPage = str;
                      widget.saveCallback?.call(miningPoolModel);
                    },
                  ),
                ),
                currentDivider(),
                /*miningPoolModel.miningPlans.length == 0
                    ? coinWidget(0, (id) {
                        setState(() {
                          miningPoolModel.miningPlans.removeAt(id);
                        });
                      })
                    : Container(),*/
                for (int i = 0; i < coinList.length; i++)
                  coinWidget(i, (id) {
                    setState(() {
                      coinList.removeAt(i);
                    });
                  }),
                currentDivider(),
                Container(
                  width: 150,
                  child: BasicTextField(
                    hintText: "Referral code",
                    controller: TextEditingController(
                        text: miningPoolModel.referalCode),
                    onValueChange: (str) {
                      miningPoolModel.referalCode = str;
                      widget.saveCallback?.call(miningPoolModel);
                    },
                  ),
                ),
                currentDivider(),
                Container(
                  width: 150,
                  child: BasicTextField(
                    hintText: "Fees",
                    controller:
                        TextEditingController(text: miningPoolModel.fees),
                    onValueChange: (str) {
                      miningPoolModel.fees = str;
                      widget.saveCallback?.call(miningPoolModel);
                    },
                  ),
                ),
                currentDivider(),
                Container(
                  width: 150,
                  child: BasicTextField(
                    hintText: "Visit link",
                    controller:
                        TextEditingController(text: miningPoolModel.visitLink),
                    onValueChange: (str) {
                      miningPoolModel.visitLink = str;
                      widget.saveCallback?.call(miningPoolModel);
                    },
                    maxLength: 500,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: -7.5,
            right: -7.5,
            child: BasicButton(
              onPressed: () {
                widget.deleteCallback?.call();
              },
              width: 25,
              height: 25,
              baseColor: DocColors.gray_2,
              child: Icon(
                Icons.delete,
                size: 13,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget coinWidget(int id, Function(int id) callback) {
    //var coin = miningPoolModel.miningPlans[id];
    return Container(
      margin: EdgeInsets.only(right: 7.5),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topRight,
        children: [
          BasicButton(
              onPressed: () {
                ImagePicker.pick((p0) async {
                  UIHelper().showLoading(context);
                  String url = await FirebaseStorage().uploadImage(
                      p0, "miners/" + widget.id, "pool/coin${widget.index}");
                  UIHelper().hideLoading(context);
                  setState(() {
                    coinList[id].imageURL = url;
                    miningPoolModel.miningPlans = coinList;
                    widget.saveCallback?.call(miningPoolModel);
                    coinList.add(MinableCoinModel());
                  });
                });
              },
              width: 75,
              height: 50,
              cornerRadius: 5,
              alignment: Alignment.center,
              baseColor: DocColors(Color(0xFF333237).withOpacity(0.35)),
              padding: EdgeInsets.only(left: 7.5, right: 7.5),
              child: IgnorePointer(
                  ignoring: true,
                  child: MediumText(
                    coinList[id].imageURL != "" ? "image loaded" : "plan coin",
                    fontSize: FontSizes.xs,
                    color: DocColors.gray,
                    textAlign: TextAlign.center,
                  ))),
          coinList.length == 1
              ? Container()
              : Positioned(
                  top: 0,
                  right: -5,
                  child: BasicButton(
                    onPressed: () {
                      callback(id);
                    },
                    width: 20,
                    height: 20,
                    baseColor: DocColors(Colors.white.withOpacity(0.05)),
                    child: Icon(
                      Icons.delete,
                      size: 13,
                    ),
                  ),
                )
        ],
      ),
    );
  }

  Widget currentDivider() {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      width: 1,
      height: 25,
      color: DocColors.gray.getValue(),
    );
  }
}
