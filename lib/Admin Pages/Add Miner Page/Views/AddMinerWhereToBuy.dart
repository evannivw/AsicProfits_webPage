import 'package:asic_miner_website/Backend/Firebase/Storage/FirebaseStorage.dart';
import 'package:asic_miner_website/BasicWidgets/ButtonWidgets/BasicButton.dart';
import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/Text%20field/BasicTextField.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/FontSizes.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Medium_Text.dart';
import 'package:asic_miner_website/Helpers/UIHelper.dart';
import 'package:asic_miner_website/Models/WhereToBuyModel.dart';
import 'package:asic_miner_website/UI%20Controllers/Image%20Picker/ImagePicker.dart';
import 'package:flutter/material.dart';

class AddMinerWhereToBuy extends StatefulWidget {
  AddMinerWhereToBuy(
      {this.id = "",
      this.index = 0,
      this.deleteCallback,
      this.saveCallback,
      this.currentSeller});
  String id;
  int index;
  WhereToBuyModel? currentSeller;
  Function(WhereToBuyModel)? saveCallback = (s) {};
  Function? deleteCallback;
  @override
  State<StatefulWidget> createState() {
    return _AddMinerWhereToBuy();
  }
}

class _AddMinerWhereToBuy extends State<AddMinerWhereToBuy> {
  List<String> miningPlanList = [""];
  WhereToBuyModel _seller = WhereToBuyModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _seller = widget.currentSeller ?? WhereToBuyModel();
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
                        String url = await FirebaseStorage().uploadImage(
                            p0,
                            "miners/" + widget.id,
                            "seller/image${widget.index}");
                        UIHelper().hideLoading(context);
                        setState(() {
                          _seller.imageURL = url;
                          widget.saveCallback?.call(_seller);
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
                          _seller.imageURL != ""
                              ? "Image loaded"
                              : "Seller image",
                          color: DocColors.gray,
                        ))),
                currentDivider(),
                Container(
                  width: 150,
                  child: BasicTextField(
                    hintText: "Seller name",
                    controller: TextEditingController(text: _seller.nameSeller),
                    onValueChange: (str) {
                      _seller.nameSeller = str;
                      widget.saveCallback?.call(_seller);
                    },
                  ),
                ),
                currentDivider(),
                Container(
                  width: 150,
                  child: BasicTextField(
                    hintText: "Seller subtitle",
                    controller: TextEditingController(text: _seller.subtitle),
                    onValueChange: (str) {
                      _seller.subtitle = str;
                      widget.saveCallback?.call(_seller);
                    },
                  ),
                ),
                currentDivider(),
                BasicButton(
                    onPressed: () {
                      ImagePicker.pick((p0) async {
                        UIHelper().showLoading(context);
                        String url = await FirebaseStorage().uploadImage(
                            p0,
                            "miners/" + widget.id,
                            "seller/country${widget.index}");
                        UIHelper().hideLoading(context);
                        setState(() {
                          _seller.countryImageURL = url;
                          widget.saveCallback?.call(_seller);
                        });
                      });
                    },
                    width: 75,
                    height: 50,
                    cornerRadius: 5,
                    baseColor: DocColors(Color(0xFF333237).withOpacity(0.35)),
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: IgnorePointer(
                        ignoring: true,
                        child: MediumText(
                          _seller.countryImageURL != ""
                              ? "Image loaded"
                              : "Country",
                          color: DocColors.gray,
                          fontSize: FontSizes.xs,
                        ))),
                currentDivider(),
                Container(
                  width: 150,
                  child: BasicTextField(
                    hintText: "Price",
                    controller: TextEditingController(text: _seller.price),
                    onValueChange: (str) {
                      _seller.price = str;
                      widget.saveCallback?.call(_seller);
                    },
                  ),
                ),
                currentDivider(),
                Container(
                  width: 150,
                  child: BasicTextField(
                    hintText: "Availability",
                    controller: TextEditingController(text: _seller.available),
                    onValueChange: (str) {
                      _seller.available = str;
                      widget.saveCallback?.call(_seller);
                    },
                  ),
                ),
                currentDivider(),
                Container(
                  width: 150,
                  child: BasicTextField(
                    hintText: "More info",
                    controller: TextEditingController(text: _seller.moreInfo),
                    onValueChange: (str) {
                      _seller.moreInfo = str;
                      widget.saveCallback?.call(_seller);
                    },
                  ),
                ),
                currentDivider(),
                Container(
                  width: 150,
                  child: BasicTextField(
                    hintText: "Shipping",
                    controller: TextEditingController(text: _seller.shipping),
                    onValueChange: (str) {
                      _seller.shipping = str;
                      widget.saveCallback?.call(_seller);
                    },
                  ),
                ),
                currentDivider(),
                Container(
                  width: 150,
                  child: BasicTextField(
                    hintText: "Shopping link",
                    controller: TextEditingController(text: _seller.visitLink),
                    onValueChange: (str) {
                      _seller.visitLink = str;
                      widget.saveCallback?.call(_seller);
                    },
                    maxLength: 1000,
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

  Widget currentDivider() {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      width: 1,
      height: 25,
      color: DocColors.gray.getValue(),
    );
  }
}
