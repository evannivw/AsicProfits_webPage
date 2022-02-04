import 'dart:async';

import 'package:advanced_datatable/advanced_datatable_source.dart';
import 'package:advanced_datatable/datatable.dart';
import 'package:asic_miner_website/Admin%20Pages/Add%20Miner%20Page/AddMinerPage.dart';
import 'package:asic_miner_website/BasicWidgets/ButtonWidgets/BasicButton.dart';
import 'package:asic_miner_website/BasicWidgets/CardWidgets/CardWidget.dart';
import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/Scene%20controller/SceneController.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/HorizontalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/VerticalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Text%20field/BasicTextField.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Bold_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Custom_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/FontSizes.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/Fonts.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Medium_Text.dart';
import 'package:asic_miner_website/Helpers/UIHelper.dart';
import 'package:asic_miner_website/Helpers/WindowHelper.dart';
import 'package:asic_miner_website/Models/MinerModel.dart';
import 'package:asic_miner_website/Pages/Asic%20Profits%20Main/Asic%20Profits%20Views/MobileDataRow.dart';
import 'package:asic_miner_website/Pages/Product%20page/ProductPage.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Icon%20Widget/SVGWidgets.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ProfitabilityWidget extends StatefulWidget {
  ProfitabilityWidget({
    this.useViewMoreWidget = true,
    this.useElectricityCostInputs = true,
    this.title = "Profitability",
    this.minerList = const [],
    this.isAdmin = false,
    this.callback,
    this.shouldReloadCallback,
  });
  Function(MinerModel)? callback;
  Function()? shouldReloadCallback;
  bool isAdmin;
  bool useViewMoreWidget;
  bool useElectricityCostInputs;
  List<MinerModel> minerList = [];
  String title;
  @override
  State<StatefulWidget> createState() {
    return _ProfitabilityWidget();
  }
}

class _ProfitabilityWidget extends State<ProfitabilityWidget> {
  int rowsPerPage = AdvancedPaginatedDataTable.defaultRowsPerPage;
  var source = ExampleSource();
  bool loading = true;
  double _timerValue = 0;
  double _loadingMaxTime = 60;
  DateTime _lastUpdate = DateTime.now();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.useViewMoreWidget) startTimer();
  }

  void startTimer() {
    const offsetTime = 250;
    const oneSec = const Duration(milliseconds: offsetTime);
    var _timer = Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_timerValue >= _loadingMaxTime) {
            _timerValue = 0;
            widget.shouldReloadCallback?.call();
            _lastUpdate = DateTime.now();
            if (mounted) setState(() {});
          } else {
            _timerValue = _timerValue + (offsetTime / 1000);
            if (mounted) setState(() {});
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VerticalSpacing(
          height: 40,
        ),
        titleView(),
        VerticalSpacing(
          height: 20,
        ),
        SceneController.isMobilView ? mobileView() : desktopView()
      ],
    );
  }

  Widget titleView() {
    if (SceneController.isMobilView) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BoldText(
            widget.title,
            fontSize: FontSizes(18),
          ),
        ],
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BoldText(
          widget.title,
          fontSize: FontSizes.xxl,
        ),
        !widget.useElectricityCostInputs
            ? Container()
            : electricityCostWidget(),
      ],
    );
  }

  Widget electricityCostWidget() {
    return Row(
      children: [
        MediumText(
          "Electricity cost",
          color: DocColors.gray,
        ),
        HorizontalSpacing(),
        CardWidget(
            width: 72,
            height: 36,
            margin: EdgeInsets.zero,
            color: DocColors(Color(0xFF414045)),
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 5),
            child: BasicTextField(
              maxLength: 4,
            )),
        HorizontalSpacing(),
        MediumText("KWh"),
        HorizontalSpacing(),
        BasicButton(
            onPressed: () {},
            baseColor: DocColors.blue,
            width: 86,
            height: 36,
            cornerRadius: 5,
            text: "Apply")
      ],
    );
  }

  Widget mobileView() {
    return Column(
      children: [
        mobileTable(),
        VerticalSpacing(
          height: 30,
        ),
        !widget.useViewMoreWidget ? Container() : viewMoreWidget(),
      ],
    );
  }

  Widget desktopView() {
    return Column(
      children: [
        table(),
        VerticalSpacing(
          height: 30,
        ),
        !widget.useViewMoreWidget ? Container() : viewMoreWidget(),
      ],
    );
  }

  Widget viewMoreWidget() {
    if (SceneController.isMobilView) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BasicButton(
              onPressed: () {},
              width: null,
              height: 29,
              splashColor: DocColors.black,
              child: MediumText(
                "See more",
                fontSize: FontSizes.s,
                color: DocColors(Color(0xFF5192FE)),
              )),
          VerticalSpacing(
            height: 40,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  width: 21,
                  height: 21,
                  child: CircularProgressIndicator(
                    backgroundColor: Color(0xFF39383D),
                    color: Color(0xFF39383D),
                    value: (_timerValue) * 1 / _loadingMaxTime, // 0.5,
                    valueColor: AlwaysStoppedAnimation<Color>(
                        DocColors.green.getValue()),
                  ),
                ),
                HorizontalSpacing(
                  width: 15,
                ),
                MediumText(
                  "Last updated " +
                      DateFormat('yyyy-MM-dd – kk:mm').format(_lastUpdate),
                  fontSize: FontSizes.s,
                )
              ],
            ),
          ),
          VerticalSpacing(
            height: 40,
          ),
          electricityCostWidget(),
          VerticalSpacing(
            height: 20,
          ),
        ],
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BasicButton(
          onPressed: () {},
          width: 123,
          height: 29,
          baseColor: DocColors(Color(0xFF39383D)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 8,
                height: 8,
                child: SVGWidgets.plusIcon,
              ),
              HorizontalSpacing(
                width: 7.5,
              ),
              MediumText(
                "View more",
                fontSize: FontSizes.s,
              )
            ],
          ),
        ),

        //Circular progress widget
        Row(
          children: [
            Container(
              width: 21,
              height: 21,
              child: CircularProgressIndicator(
                backgroundColor: Color(0xFF39383D),
                color: Color(0xFF39383D),
                value: (_timerValue) * 1 / _loadingMaxTime,
                valueColor:
                    AlwaysStoppedAnimation<Color>(DocColors.green.getValue()),
              ),
            ),
            HorizontalSpacing(
              width: 15,
            ),
            MediumText(
              "Last updated " +
                  DateFormat('yyyy-MM-dd – kk:mm').format(_lastUpdate),
              fontSize: FontSizes.s,
            )
          ],
        ),
      ],
    );
  }

  Widget mobileTable() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        for (var miner in widget.minerList)
          MobileDataRow(
            currentMiner: miner,
            callback: () {
              widget.callback?.call(miner);
            },
          ),
      ],
    );
  }

  Widget table() {
    return Theme(
        data: Theme.of(context).copyWith(
          cardColor: Color(0xff202024),
          dividerColor: Color(0xFF707070),
          indicatorColor: DocColors.white.getValue(),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            width: SceneController.currentMaxWidth,
            child: DataTable(
              dataRowColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                //if (states.contains(MaterialState.hovered))
                //return DocColors.green.getValue().withOpacity(0.25);
                return DocColors.transparent
                    .getValue(); // Use the default value.
              }),
              columns: getDataColumn(),
              rows: getDataRow(),
              showCheckboxColumn: false,
              horizontalMargin: 0,
              dataRowHeight: 69,
              columnSpacing: 0,
              dividerThickness: 0.25,
            ),
          ),
        ));
  }

  List<DataColumn> getDataColumn() {
    return [
      dataColumn("Model", isSort: true),
      dataColumn("Release"),
      dataColumn(
        "Hashrate",
      ),
      dataColumn("Power"),
      dataColumn("Noise"),
      dataColumn("Algo"),
      dataColumn("Profitability"),
      dataColumn("Link"),
    ];
  }

  DataColumn dataColumn(String texto, {bool isSort = false}) {
    return DataColumn(
        onSort: (columnIndex, ascending) {},
        label: Row(
          children: [
            MediumText(texto, color: DocColors.gray, fontSize: FontSizes.xs),
            !isSort
                ? Container()
                : RotatedBox(
                    quarterTurns: 0,
                    child: Icon(
                      Icons.arrow_drop_down,
                      size: 15,
                      color: DocColors.white.getValue(),
                    ))
          ],
        ));
  }

  Widget filterRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        filterButton("Model", 50),
        filterButton("Release", 70),
        filterButton("Hashrate", 90),
        filterButton("Power", 50),
        filterButton("Noise", 50),
        filterButton("Algo", 40),
        filterButton("Profitability", 130),
        filterButton("Link", 40),
      ],
    );
  }

  Widget filterButton(String text, double width) {
    return BasicButton(
      onPressed: () {},
      width: width,
      padding: EdgeInsets.all(0),
      child: MediumText(
        text,
        color: DocColors.gray,
        fontSize: FontSizes.xs,
      ),
    );
  }

  List<DataRow> getDataRow() {
    List<DataRow> _list = [];
    for (int i = 0; i < widget.minerList.length; i++) {
      _list.add(getRow(widget.minerList[i]));
    }
    return _list;
  }

  DataRow getRow(MinerModel miner) {
    return DataRow(
        onSelectChanged: (isSelected) {
          if (isSelected != null && isSelected) {
            if (widget.isAdmin) {
              widget.callback?.call(miner);
            } else {
              widget.callback?.call(miner);
            }
          }
        },
        cells: [
          DataCell(Container(
            width: 200,
            child: Row(
              children: [
                Container(
                  width: 29,
                  height: 29,
                  decoration: BoxDecoration(
                      color: UIHelper().fromStringToColor(miner.color),
                      borderRadius: BorderRadius.circular(999)),
                ),
                HorizontalSpacing(),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 150),
                  child: MediumText(
                    miner.model,
                    color: DocColors.gray,
                    fontSize: FontSizes.xs,
                  ),
                ),
              ],
            ),
          )),

          //Release
          DataCell(
            Container(
              width: 100,
              child: MediumText(
                miner.release,
                color: DocColors.white,
                fontSize: FontSizes.xs,
              ),
            ),
          ),

          //Hashrate
          DataCell(Container(
            width: 100,
            child: Row(
              children: [
                MediumText(
                  miner.hashrate,
                  color: DocColors.white,
                  fontSize: FontSizes.xs,
                ),
                MediumText(
                  ' ${miner.hashrateUnits}',
                  color: DocColors.gray,
                  fontSize: FontSizes.xs,
                ),
              ],
            ),
          )),

          //Power
          DataCell(Container(
            width: 100,
            child: Row(
              children: [
                MediumText(
                  miner.power,
                  color: DocColors.white,
                  fontSize: FontSizes.xs,
                ),
                MediumText(
                  ' W',
                  color: DocColors.gray,
                  fontSize: FontSizes.xs,
                ),
              ],
            ),
          )),

          //Noise
          DataCell(Container(
            width: 100,
            child: Row(
              children: [
                MediumText(
                  miner.noise,
                  color: DocColors.white,
                  fontSize: FontSizes.xs,
                ),
                MediumText(
                  ' db',
                  color: DocColors.gray,
                  fontSize: FontSizes.xs,
                ),
              ],
            ),
          )),

          //Algo
          DataCell(
            Container(
              width: 100,
              child: MediumText(
                miner.algo,
                color: DocColors.gray,
                fontSize: FontSizes.s,
              ),
            ),
          ),

          //Profitability
          DataCell(Container(
            width: 100,
            child: Row(
              children: [
                MediumText(
                  '\$NAN',
                  color: DocColors.green,
                  fontSize: FontSizes.xs,
                ),
                MediumText(
                  '/yearly',
                  color: DocColors.gray,
                  fontSize: FontSizes.xs,
                ),
              ],
            ),
          )),

          //Link
          DataCell(BasicButton(
            width: 66,
            height: 29,
            onPressed: () {
              WindowHelper().openInNewTab(miner.visitLink);
            },
            text: "Visit",
            baseColor: DocColors(Color(0xFF39383D)),
          ))
        ]);
  }
}

class RowData {
  final int index;
  final String value;
  RowData(this.index, this.value);
}

class ExampleSource extends AdvancedDataTableSource<RowData> {
  final data = List<RowData>.generate(
      13, (index) => RowData(index, 'Value for no. $index'));

  @override
  DataRow? getRow(int index) {
    final currentRowData = lastDetails!.rows[index];
    return DataRow(cells: [
      DataCell(Row(
        children: [
          Container(
            width: 29,
            height: 29,
            decoration: BoxDecoration(
                color: Color(0xFFE9B201),
                borderRadius: BorderRadius.circular(999)),
          ),
          HorizontalSpacing(),
          MediumText(
            'Bitmain Antminer E9 (3Gh)',
            color: DocColors.gray,
            fontSize: FontSizes.xs,
          ),
        ],
      )),

      //Release
      DataCell(
        MediumText(
          'Coming soon',
          color: DocColors.white,
          fontSize: FontSizes.xs,
        ),
      ),

      //Hashrate
      DataCell(Row(
        children: [
          MediumText(
            '3',
            color: DocColors.white,
            fontSize: FontSizes.xs,
          ),
          MediumText(
            ' Gh/s',
            color: DocColors.gray,
            fontSize: FontSizes.xs,
          ),
        ],
      )),

      //Power
      DataCell(Row(
        children: [
          MediumText(
            '2556',
            color: DocColors.white,
            fontSize: FontSizes.xs,
          ),
          MediumText(
            ' W',
            color: DocColors.gray,
            fontSize: FontSizes.xs,
          ),
        ],
      )),

      //Noise
      DataCell(Row(
        children: [
          MediumText(
            '75',
            color: DocColors.white,
            fontSize: FontSizes.xs,
          ),
          MediumText(
            ' db',
            color: DocColors.gray,
            fontSize: FontSizes.xs,
          ),
        ],
      )),

      //Algo
      DataCell(
        MediumText(
          "EtHash",
          color: DocColors.gray,
          fontSize: FontSizes.s,
        ),
      ),

      //Profitability
      DataCell(Row(
        children: [
          MediumText(
            '\$231.85',
            color: DocColors.green,
            fontSize: FontSizes.xs,
          ),
          MediumText(
            '/yearly',
            color: DocColors.gray,
            fontSize: FontSizes.xs,
          ),
        ],
      )),

      //Link
      DataCell(BasicButton(
        width: 66,
        height: 29,
        onPressed: () {},
        text: "Visit",
        baseColor: DocColors(Color(0xFF39383D)),
      ))
    ]);
  }

  @override
  int get selectedRowCount => 0;

  @override
  Future<RemoteDataSourceDetails<RowData>> getNextPage(
      NextPageRequest pageRequest) async {
    return RemoteDataSourceDetails(
      data.length,
      data
          .skip(pageRequest.offset)
          .take(pageRequest.pageSize)
          .toList(), //again in a real world example you would only get the right amount of rows
    );
  }
}
