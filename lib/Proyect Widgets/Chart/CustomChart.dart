import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/VerticalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/FontSizes.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/Fonts.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ChartData {
  ChartData({this.x, this.y});
  DateTime? x;
  double? y;
}

class CustomChart extends StatefulWidget {
  CustomChart({
    this.listaData = const [],
    this.useSmallChart = false,
  });
  bool useSmallChart;
  List<ChartData> listaData;
  @override
  State<StatefulWidget> createState() {
    return _CustomChart();
  }
}

class _CustomChart extends State<CustomChart> {
  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
          backgroundColor: DocColors.transparent.getValue(),
          borderData: FlBorderData(
              border:
                  Border.all(color: DocColors.gray.getValue(), width: 0.25)),
          gridData: FlGridData(
            getDrawingHorizontalLine: (value) =>
                FlLine(color: DocColors.gray.getValue(), strokeWidth: 0.25),
            getDrawingVerticalLine: (value) =>
                FlLine(color: DocColors.gray.getValue(), strokeWidth: 0.25),
          ),
          titlesData: FlTitlesData(
              topTitles: SideTitles(showTitles: false),
              rightTitles: SideTitles(showTitles: false),
              leftTitles: SideTitles(
                showTitles: true,
                margin: widget.useSmallChart ? 2 : 10,
                interval: 10,
                getTextStyles: (context, value) => GoogleFonts.getFont(
                  Fonts.medium.getValue(),
                  color: widget.useSmallChart
                      ? DocColors.white.getValue()
                      : DocColors.gray.getValue(),
                  fontWeight: Fonts.medium.getWeight(),
                  fontSize: FontSizes.xs.getValue(),
                  height: 1.55,
                ),
              ),
              bottomTitles: SideTitles(
                showTitles: true,
                margin: widget.useSmallChart ? 2 : 10,
                interval: 100000000,
                getTitles: (value) {
                  var date = DateTime.fromMillisecondsSinceEpoch(value.round());
                  String formattedDate = DateFormat('MMM').format(date);
                  return formattedDate;
                },
                getTextStyles: (context, value) => GoogleFonts.getFont(
                  Fonts.medium.getValue(),
                  color: widget.useSmallChart
                      ? DocColors.white.getValue()
                      : DocColors.gray.getValue(),
                  fontWeight: Fonts.medium.getWeight(),
                  fontSize: FontSizes.xs.getValue(),
                  height: 1.55,
                ),
              )),
          lineTouchData: LineTouchData(
            handleBuiltInTouches: false,
            touchTooltipData: LineTouchTooltipData(
              tooltipBgColor: DocColors.transparent.getValue(),
              showOnTopOfTheChartBoxArea: false,
            ),
          ),
          lineBarsData: [
            LineChartBarData(
                isCurved: false,
                colors: [DocColors.green.getValue()],
                barWidth: 1,
                isStrokeCapRound: true,
                dotData: FlDotData(show: false),
                shadow:
                    Shadow(blurRadius: 4, color: DocColors.green.getValue()),
                spots: getList())
          ]),
      swapAnimationDuration: Duration(milliseconds: 150),
      swapAnimationCurve: Curves.linear,
    );
  }

  List<FlSpot> getList() {
    List<FlSpot> lista = [];
    if (widget.listaData.isNotEmpty) {
      lista.add(
          FlSpot((widget.listaData[0].x!.millisecondsSinceEpoch - 200000), 0));
    }
    for (int i = 0; i < widget.listaData.length; i++) {
      lista.add(FlSpot(
          (widget.listaData[i].x!.millisecondsSinceEpoch + (i * 10)).toDouble(),
          (widget.listaData[i].y!) + (i * 0.000001)));
    }
    //print("Lista flspot: " + lista.toString());
    return lista;
  }

  static _createSampleData() {
    final data = [
      ChartData(x: DateTime(2017, 9, 19), y: 5),
      ChartData(x: DateTime(2017, 9, 26), y: 25),
      ChartData(x: DateTime(2017, 10, 3), y: 105),
      ChartData(x: DateTime(2017, 10, 10), y: 75),
    ];
  }
}
