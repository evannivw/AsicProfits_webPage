import 'package:asic_miner_website/Backend/Firebase/Storage/FirebaseStorage.dart';
import 'package:asic_miner_website/BasicWidgets/ButtonWidgets/BasicButton.dart';
import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/HorizontalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Medium_Text.dart';
import 'package:asic_miner_website/Helpers/UIHelper.dart';
import 'package:asic_miner_website/Models/MinableCoinModel.dart';
import 'package:asic_miner_website/UI%20Controllers/Image%20Picker/ImagePicker.dart';
import 'package:flutter/material.dart';

class AddMinerMinableCoin extends StatefulWidget {
  AddMinerMinableCoin(
      {this.id = "",
      this.index = 0,
      this.deleteCallback,
      this.currentCoin,
      this.saveCallback});
  String id;
  int index;
  MinableCoinModel? currentCoin;
  Function(MinableCoinModel)? saveCallback = (s) {};
  Function? deleteCallback;
  @override
  State<StatefulWidget> createState() {
    return _AddMinerMinableCoin();
  }
}

class _AddMinerMinableCoin extends State<AddMinerMinableCoin> {
  MinableCoinModel minableCoinModel = MinableCoinModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    minableCoinModel = widget.currentCoin ?? MinableCoinModel();
  }

  @override
  Widget build(BuildContext context) {
    return imageWithDeleteIcon();
  }

  Widget imageWithDeleteIcon() {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        children: [
          BasicButton(
              onPressed: () {
                ImagePicker.pick((p0) async {
                  UIHelper().showLoading(context);
                  String url = await FirebaseStorage().uploadImage(
                      p0, "miners/" + widget.id, "coin/image${widget.index}");
                  UIHelper().hideLoading(context);
                  setState(() {
                    minableCoinModel.imageURL = url;
                    widget.saveCallback?.call(minableCoinModel);
                  });
                });
              },
              width: 550,
              height: 50,
              cornerRadius: 5,
              baseColor: DocColors(Color(0xFF333237).withOpacity(0.35)),
              padding: EdgeInsets.only(left: 20, right: 20),
              child: IgnorePointer(
                  ignoring: true,
                  child: MediumText(
                    minableCoinModel.imageURL != ""
                        ? "Image loaded"
                        : "Load an image",
                    color: DocColors.gray,
                  ))),
          HorizontalSpacing(),
          BasicButton(
            onPressed: () {
              widget.deleteCallback?.call();
            },
            width: 25,
            height: 25,
            baseColor: DocColors(Colors.white.withOpacity(0.05)),
            child: Icon(
              Icons.delete,
              size: 15,
            ),
          )
        ],
      ),
    );
  }
}
