import 'package:asic_miner_website/BasicWidgets/ButtonWidgets/BasicButton.dart';
import 'package:asic_miner_website/BasicWidgets/CardWidgets/CardWidget.dart';
import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/HorizontalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/VerticalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Text%20field/BasicTextField.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Custom_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/FontSizes.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/Fonts.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Medium_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Regular_Text.dart';
import 'package:asic_miner_website/Helpers/WindowHelper.dart';
import 'package:asic_miner_website/Models/MinableCoinModel.dart';
import 'package:asic_miner_website/Models/MinerModel.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Icon%20Widget/SVGWidgets.dart';
import 'package:flutter/material.dart';

class ComparisionCardWidget extends StatefulWidget {
  ComparisionCardWidget(
      {this.minerModel,
      this.minerList = const [],
      this.cantidad = 1,
      this.showSpecs = true,
      this.showProfits = true,
      this.showAlgo = true,
      this.showInStock = true,
      this.showMinableCoins = true});
  MinerModel? minerModel;
  List<MinerModel> minerList;
  int cantidad;
  bool showSpecs;
  bool showProfits;
  bool showAlgo;
  bool showMinableCoins;
  bool showInStock;
  @override
  State<StatefulWidget> createState() {
    return _ComparisionCardWidget();
  }
}

class _ComparisionCardWidget extends State<ComparisionCardWidget> {
  MinerModel _miner = MinerModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _miner = widget.minerModel ?? MinerModel();
  }

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      width: 325,
      height: 1505,
      color: DocColors(Color(0xFF2B2B2F)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                textfieldWithTitle("Units"),
                HorizontalSpacing(
                  width: 7.5,
                ),
                dropdownWithTitle("Hardware",
                    dropDownLista:
                        widget.minerList.map((e) => e.model).toList())
              ],
            ),
          ),
          Divider(
            color: DocColors.gray.getValue(),
            thickness: 0.25,
          ),
          !widget.showSpecs ? Container() : specs(),
          VerticalSpacing(),
          !widget.showProfits ? Container() : profits(),
          VerticalSpacing(),
          !widget.showAlgo ? Container() : algo(),
          VerticalSpacing(),
          !widget.showMinableCoins ? Container() : minableCoins(),
          VerticalSpacing(),
          !widget.showInStock ? Container() : inStock(),
          VerticalSpacing(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BasicButton(
                onPressed: () {
                  WindowHelper().openInNewTab(_miner.visitLink);
                },
                width: 132,
                height: 36,
                text: "Explore more",
                baseColor: DocColors.blue,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget inStock() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        title("In Stock"),
        Container(
          width: 13,
          height: 13,
          margin: EdgeInsets.only(right: 20),
          child: InkWell(
            onTap: () {},
            child: _miner.status.toLowerCase() == "enable"
                ? SVGWidgets.checkboxFilledIcon
                : SVGWidgets.thumbsDownRedIcon,
          ),
        ),
      ],
    );
  }

  Widget minableCoins() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title("Minable Coins"),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              for (var coin in _miner.minableCoinList)
                coinWidget(coin, size: 30),
            ],
          ),
        ),
        VerticalSpacing(
          height: 20,
        ),
        Divider(
          color: DocColors.gray.getValue(),
          thickness: 0.25,
        ),
      ],
    );
  }

  Widget algo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title("Algorithms"),
        dataInfo("Algorythm", _miner.algo),
        dataInfo("Hashrate", "${_miner.hashrate} ${_miner.hashrateUnits}"),
        dataInfo("Consumption", "${_miner.power}W"),
        dataInfo("Efficiency", "${_miner.efficiency}j/Mh"),
        VerticalSpacing(
          height: 20,
        ),
        Divider(
          color: DocColors.gray.getValue(),
          thickness: 0.25,
        ),
      ],
    );
  }

  Widget profits() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title("Est. Daily Profits"),
        dataInfo("Daily", "\$20.41", dataColor: DocColors.green),
        dataInfo("Monthly", "\$612.49", dataColor: DocColors.green),
        dataInfo("Year", "\$7,348.72", dataColor: DocColors.green),
        VerticalSpacing(
          height: 20,
        ),
        Divider(
          color: DocColors.gray.getValue(),
          thickness: 0.25,
        ),
      ],
    );
  }

  Widget specs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title("Specs"),
        dataInfo("Manufacturer", _miner.manu),
        dataInfo("Release date", _miner.release),
        dataInfo("Size", _miner.size),
        dataInfo("Weight", "${_miner.power}g"),
        dataInfo("Noise level", "${_miner.power}db"),
        dataInfo("Fan(s)", _miner.fans),
        dataInfo("Power", "${_miner.power}W"),
        dataInfo("Voltage", "${_miner.voltage}V"),
        dataInfo("Interface", "${_miner.interface}"),
        VerticalSpacing(
          height: 20,
        ),
        Divider(
          color: DocColors.gray.getValue(),
          thickness: 0.25,
        ),
      ],
    );
  }

  //Coin of the minable coins section
  Widget coinWidget(MinableCoinModel coin,
      {double size = 41, double margin = 15}) {
    return Container(
      width: size,
      height: size,
      margin: EdgeInsets.only(left: 0, right: margin),
      padding: EdgeInsets.all(7.5),
      decoration: BoxDecoration(
          color: Color(0xFF333336), borderRadius: BorderRadius.circular(999)),
      child: Image.network(coin.imageURL),
    );
  }

  //Info title widget
  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
      child: MediumText(
        title,
        fontSize: FontSizes.m,
      ),
    );
  }

  //Row with the data
  Widget dataInfo(String title, String data,
      {DocColors dataColor = DocColors.white}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MediumText(
            title,
            color: DocColors.gray,
          ),
          CustomText(
            data,
            fontFamily: Fonts.medium,
            fontSize: FontSizes.s,
            color: dataColor,
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }

  Widget textfieldWithTitle(
    String title,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MediumText(
          title,
          fontSize: FontSizes(11),
          color: DocColors.gray,
        ),
        VerticalSpacing(
          height: 5,
        ),
        CardWidget(
            width: 53,
            height: 30,
            margin: EdgeInsets.zero,
            color: DocColors(Color(0xFF414045)),
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: BasicTextField(
                  maxLength: 3,
                  controller:
                      TextEditingController(text: widget.cantidad.toString()),
                )),
                RegularText(
                  "x",
                  fontSize: const FontSizes(11),
                ),
              ],
            )),
      ],
    );
  }

  Widget dropdownWithTitle(String title,
      {List<String> dropDownLista = const ["USD"]}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MediumText(
          title,
          fontSize: FontSizes(11),
          color: DocColors.gray,
        ),
        VerticalSpacing(
          height: 5,
        ),
        CardWidget(
          width: 223,
          height: 30,
          margin: EdgeInsets.zero,
          color: DocColors(Color(0xFF414045)),
          padding: EdgeInsets.only(left: 10, right: 10),
          child: DropdownButton<String>(
            isExpanded: true,
            underline: Container(),
            dropdownColor: DocColors.gray_4.getValue(),
            iconDisabledColor: DocColors.white.getValue(),
            iconEnabledColor: DocColors.white.getValue(),
            iconSize: 15,
            value: dropDownLista[0],
            items: dropDownLista.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: MediumText(
                  value,
                  fontSize: FontSizes.xs,
                ),
              );
            }).toList(),
            onChanged: (str) {
              if (str == null) return;
              for (var miner in widget.minerList) {
                if (miner.model == str) {
                  setState(() {
                    _miner = miner;
                  });
                  return;
                }
              }
            },
          ),
        )
      ],
    );
  }
}
