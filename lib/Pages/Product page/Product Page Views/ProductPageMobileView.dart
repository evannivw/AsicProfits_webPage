import 'package:asic_miner_website/BasicWidgets/ButtonWidgets/BasicButton.dart';
import 'package:asic_miner_website/BasicWidgets/CardWidgets/CardWidget.dart';
import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/Scene%20controller/SceneController.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/HorizontalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/VerticalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Bold_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Custom_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/FontSizes.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/Fonts.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Medium_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Regular_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Semi_BoldText.dart';
import 'package:asic_miner_website/Helpers/WindowHelper.dart';
import 'package:asic_miner_website/Models/HostingFacilitiesModel.dart';
import 'package:asic_miner_website/Models/MinableCoinModel.dart';
import 'package:asic_miner_website/Models/MinerModel.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Bottom%20Widgets/BotonInfoWidget.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Bottom%20Widgets/WeeklyAsicWidget2.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Buying%20Options/BuyingOpportunitiesWidget.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Chart/CustomChart.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Icon%20Widget/SVGWidgets.dart';
import 'package:flutter/material.dart';

import 'MiningPoolsCard.dart';
import 'WhereToBuyCard.dart';

class ProductPageMobileView extends StatefulWidget
{
  ProductPageMobileView({@required currentMiner, @required currentHostingFacilities});

  final MinerModel currentMiner = MinerModel();
  final List<HostingFacilitiesModel> currentHostingFacilities = [];

  @override
  State<StatefulWidget> createState() {
    return _ProductPageMobileView();
  }
  
}

class _ProductPageMobileView extends State<ProductPageMobileView>
{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        mainView(),
        
        //Bottom widgets
        VerticalSpacing(height: 20,),
      ],
    );
  }

  Widget mainView()
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        gpuCardWidget(),
        VerticalSpacing(height: 20,),
        chartWidget(),
        VerticalSpacing(height: 20,),
        gpuData(),
        VerticalSpacing(height: 40,),
        specifications(),
        VerticalSpacing(height: 40,),
        minableCoins(),
        VerticalSpacing(height: 40,),
        algorithmsWidget(),
        VerticalSpacing(height: 40,),
        hostingFacilities(widget.currentHostingFacilities),
        VerticalSpacing(height: 60,),
        whereToBuyWidget(),
      ],
    );
  }

  Widget hostingFacilities(List<HostingFacilitiesModel> hostings)
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BoldText("Hosting Facilities",fontSize:  FontSizes(18),),
        VerticalSpacing(height: 20,),
        CardWidget(
          height: null,
          color: DocColors(Colors.white.withOpacity(0.03)),
          margin: EdgeInsets.zero,
          padding: EdgeInsets.only(top:10,bottom: 10,left:7.5,right: 7.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              for(var hosting in hostings)
              CardWidget(
                color: DocColors.transparent,
                margin: EdgeInsets.zero,
                height: 56,
                width: 518,
                hoverColor: DocColors(Colors.white.withOpacity(0.03)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
    
                    //Place
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MediumText(hosting.namePlace,fontSize: FontSizes(11),),
                        MediumText("${hosting.nameState}, ${hosting.nameCountry}",fontSize: FontSizes(11),color: DocColors.gray,),
                      ],
                    ),
    
                    //Price
                    Row(children: [
                      MediumText("Price",fontSize: FontSizes(8),color: DocColors.gray,),
                      HorizontalSpacing(width: 2,),
                      MediumText("\$${hosting.price} / kWh",fontSize: FontSizes(10),color: DocColors.green,),
                    ],),
    
                    //Available
                    Row(children: [
                      Container(
                        width: 13,
                        height: 13,
                        child: 
                        hosting.status.toLowerCase().contains("available") ?
                        SVGWidgets.checkIcon:
                        SVGWidgets.thumbDownIcon,
                      ),
                      HorizontalSpacing(width: 5,),
                      MediumText(hosting.status,color: DocColors.gray,fontSize: FontSizes(10),),
                    ],),
    
                      
                  ],
                ),
              )
            
            ],
          ),
        ),
      ],
    );
  }

  Widget whereToBuyWidget()
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BoldText("Where to buy",fontSize:  FontSizes(18),),
        VerticalSpacing(height: 20,),

        Theme(
          data: Theme.of(context)
            .copyWith(
              dividerColor: Color(0xFF707070),
            ),
          child: Container(
            width: SceneController.currentMaxWidth,
            child: DataTable(
              dividerThickness: 0.25,
              horizontalMargin: 0,
              columns: [
                DataColumn(label: MediumText("Sellers",fontSize: FontSizes(12),color: DocColors(Colors.white.withOpacity(0.3)),)),
                DataColumn(label: MediumText("Price",fontSize: FontSizes(12),color: DocColors(Colors.white.withOpacity(0.3)),)),
                DataColumn(label: MediumText("Availability",fontSize: FontSizes(12),color: DocColors(Colors.white.withOpacity(0.3)),)),
              ],
              rows: List<DataRow>.generate(widget.currentMiner.whereToBuyList.length, (int index){
                  var seller = widget.currentMiner.whereToBuyList[index];
                  return DataRow(
                    cells: [
                      DataCell(
                        MediumText(seller.nameSeller,fontSize: FontSizes.xs,),
                      ),
                      DataCell(
                        MediumText("\$${seller.price}", fontSize: FontSizes.xs,),
                      ),
                      DataCell(
                        Row(
                          children: [
                            MediumText(seller.available,
                              color: 
                              seller.available.toLowerCase().contains("in stock") ?
                              DocColors.green : DocColors.green,
                              fontSize: FontSizes.xs,
                            ),
                            HorizontalSpacing(),
                            Icon(Icons.arrow_forward_ios_rounded,color: DocColors.white.getValue(),size: 13,)
                          ],
                        ),
                      )
                    ]
                  );
              })
            ),
          ),
        ),
        VerticalSpacing(height: 20,),
        BasicButton(
            onPressed: (){},
            width: null,
            height: 29,
            splashColor: DocColors.black,
            child: MediumText("See more",fontSize: FontSizes.s,color: DocColors(Color(0xFF5192FE)),)
          ),
      ],
    );
  }
  //Image, name, description of the gpu
  Widget gpuCardWidget()
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CardWidget(
          width: null,
          height: 177,
          color: DocColors(Color(0xFF2B2B2F)),
          margin: EdgeInsets.zero,
          child: Container(
            width: 241,
            height: 150,
            child: Image.asset('assets/images/miner.png'),
          ),
        ),
        VerticalSpacing(),
        BoldText(widget.currentMiner.model,fontSize: FontSizes.xl,),
        CustomText("Model Antminer E9 (3Gh) from Bitmain mining EtHash algorithm with a maximum hashrate of 3Gh/s for a power consumption of 2556W.",
          color: DocColors.gray,
          fontFamily: Fonts.medium,
          maxLines: 4,
        ),
      ],
    );
  }
  
  //Chart of the data of GPU
  Widget chartWidget()
  {
    return Container(
      height: 150,
      child: CustomChart(),
    );
  }
  
  //income,Electricity and profit data
  Widget gpuData()
  {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gpuChartSpecs([
            MediumText("Time:",fontSize: FontSizes.xs,color: DocColors(Colors.white.withOpacity(0.3)),),
            MediumText("/day",fontSize: FontSizes.xs,color: DocColors(Colors.white.withOpacity(0.3)),),
            MediumText("/month",fontSize: FontSizes.xs,color: DocColors(Colors.white.withOpacity(0.3)),),
            MediumText("/year",fontSize: FontSizes.xs,color: DocColors(Colors.white.withOpacity(0.3)),),
          ],margin: 0),
          gpuChartSpecs([
            MediumText("Income:",fontSize: FontSizes.s,),
            MediumText("\$218.86/day",fontSize: FontSizes.xs,),
            MediumText("\$6,565.66/month",fontSize: FontSizes.xs,),
            MediumText("\$78,787.92/year",fontSize: FontSizes.xs,),
          ]),
    
          gpuChartSpecs([
            MediumText("Electricity:"),
            MediumText("-\$11.66/day",color: DocColors.red,fontSize: FontSizes.xs,),
            MediumText("-\$349.66/month",color: DocColors.red,fontSize: FontSizes.xs,),
            MediumText("-\$4,195.93/year",color: DocColors.red,fontSize: FontSizes.xs,),
          ]),
    
          gpuChartSpecs([
            MediumText("Profit:"),
            MediumText("\$207.20/day",color: DocColors.green,fontSize: FontSizes.xs,),
            MediumText("\$6,565.66/month",color: DocColors.green,fontSize: FontSizes.xs,),
            MediumText("\$74,591.99/year",color: DocColors.green,fontSize: FontSizes.xs,),
          ],borderColor: DocColors.green),
        ],
      ),
    );
  }

  //specifications of the GPU
  Widget specifications()
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BoldText("Specifications",fontSize: FontSizes.xl,),
        VerticalSpacing(height: 20,),
        specsText("Manufacturer", "Bitmain"),
        specsText("Model", "Antminer E9 (3Gh)"),
        specsText("Release", "Coming soon",color: DocColors.green,useContainer: true),
        specsText("Size", "195 x 290 x 400mm"),
        specsText("Weight", "14200g"),
        specsText("Noise level", "75db"),
        specsText("Fan(s)", "4"),
        specsText("Power", "2556W",icon: SVGWidgets.powerIcon),
        specsText("Voltage", "12V"),
        specsText("Interface", "Ethernet"),
        specsText("Temperature", "5 - 45 °C",icon: SVGWidgets.temperatureIcon),
        specsText("Humidity", "5 - 95 %"),
      ],
    );
  }

  //list of minable coins of the current GPU
  Widget cloudMining()
  {
    return ExpansionTile(
      initiallyExpanded: true,
      title: BoldText("Cloud Mining",fontSize: FontSizes(18),),
      iconColor: DocColors.white.getValue(),
      tilePadding: EdgeInsets.zero,
      collapsedIconColor: DocColors.white.getValue(),
      children: [
        Container(
          margin: EdgeInsets.only(top:10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              cloudMiningCard(),
              cloudMiningCard(),
              cloudMiningCard(),
            ],
          ),
        ),
      ],
    );
  }
  
  Widget cloudMiningCard()
  {
    return CardWidget(
      margin: EdgeInsets.only(top:10,bottom: 10),
      padding: EdgeInsets.only(left:20,right: 20),
      color: DocColors(Color(0xFF2B2B2F)),
      width: SceneController.currentMaxWidth-50,
      height: 50,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          width: SceneController.currentMaxWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 62,height: 14,
                color: DocColors.red.getValue(),
              ),
              HorizontalSpacing(),
              Row(children: [
                for(var coin in widget.currentMiner.minableCoinList)
                coinWidget(coin,size: 32,margin: 5),
              ],),
              HorizontalSpacing(),
              BasicButton(
                onPressed: (){
                  WindowHelper().openInNewTab(widget.currentMiner.visitLink);
                },
                width: 66,
                height: 29,
                padding: EdgeInsets.zero,
                baseColor: DocColors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MediumText("Visit",color: DocColors(Color(0xFF5192FE)),),
                    HorizontalSpacing(width: 5,),
                    SVGWidgets.linkIcon,
        
                  ],
              ),
            )
            ],
          ),
        ),
      ),
    );
  }

  //list of minable coins of the current GPU
  Widget minableCoins()
  {
    return ExpansionTile(
      title: BoldText("Minable Coins",fontSize:  FontSizes(18),),
      initiallyExpanded: true,
      iconColor: DocColors.white.getValue(),
      tilePadding: EdgeInsets.zero,
      collapsedIconColor: DocColors.white.getValue(),
      children: [
        Container(
          margin: EdgeInsets.only(top:10,bottom: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                for(var coin in widget.currentMiner.minableCoinList)
                coinWidget(coin),
                
              ],
            ),
          ),
        ),
      ],
    );
  }

  //Coin of the minable coins section
  Widget coinWidget(MinableCoinModel coin,{double size = 41,double margin = 10})
  {
    return Container(
      width: size,
      height: size,
      margin: EdgeInsets.only(left:margin,right: margin),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFF333336),
        borderRadius: BorderRadius.circular(999)
      ),
      child: Image.network(
        coin.imageURL,
        fit: BoxFit.contain,
      ),
    );
  }
  
  //Current algorithm supported by GPU
  Widget algorithmsWidget()
  {
    return Column(
      children: [
        ExpansionTile(
          title: BoldText("Algorithms",fontSize:  FontSizes(18),),
          initiallyExpanded: true,
          iconColor: DocColors.white.getValue(),
          tilePadding: EdgeInsets.zero,
          collapsedIconColor: DocColors.white.getValue(),
          childrenPadding: EdgeInsets.only(top:20),
          children: [
            CardWidget(
              color: DocColors(Color(0xFF2B2B2F)),
              padding: EdgeInsets.all(20),
              height: null,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SemiBoldText("Algorythm",color: DocColors.gray,fontSize: FontSizes.xs,),
                      VerticalSpacing(height: 20,),
                      SemiBoldText("Hashrate",color: DocColors.gray,fontSize: FontSizes.xs,),
                      VerticalSpacing(height: 20,),
                      SemiBoldText("Consumption",color: DocColors.gray,fontSize: FontSizes.xs,),
                      VerticalSpacing(height: 20,),
                      SemiBoldText("Efficiency",color: DocColors.gray,fontSize: FontSizes.xs,),
                      VerticalSpacing(height: 20,),
                      SemiBoldText("Profitability",color: DocColors.gray,fontSize: FontSizes.xs,),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MediumText(widget.currentMiner.algo,fontSize: FontSizes.xs,),
                      VerticalSpacing(height: 20,),
                      MediumText(widget.currentMiner.hashrate+widget.currentMiner.hashrateUnits,fontSize: FontSizes.xs,),
                      VerticalSpacing(height: 20,),
                      MediumText(widget.currentMiner.power+"W",fontSize: FontSizes.xs,),
                      VerticalSpacing(height: 20,),
                      MediumText("0.852j/Mh",fontSize: FontSizes.xs,),
                      VerticalSpacing(height: 20,),
                      MediumText("\$168.39",fontSize: FontSizes.xs,color: DocColors.green,),
                    ],
                  ),
                  
                  HorizontalSpacing(width: 20,),
                ],
              ),
            ),
          ],
        )
        
      ],
    );
  }

  //GPU chart specs [income, Electricity, profit]
  Widget gpuChartSpecs(List<Widget> widgetList,{DocColors borderColor = DocColors.black,double margin= 5})
  {
    return CardWidget(
      height: 34,
      margin: EdgeInsets.only(top:margin,bottom: margin),
      color: DocColors.black,
      borderColor: borderColor,
      padding: EdgeInsets.only(left:15,right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for(var widget in widgetList)
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 95,maxWidth: 124),
            child: widget,
          )
        ],
      ),
    );
  }
  
  //Specifications texts 
  Widget specsText(String title, String value,{DocColors color = DocColors.white, Widget? icon,bool useContainer = false })
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        VerticalSpacing(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width/2.2,
              child: MediumText(title+":",color: DocColors.gray,),
            ),
            
            Container(
              width: MediaQuery.of(context).size.width/2.2,
              child: Row(
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    child: icon,
                  ),
                  HorizontalSpacing(width: 7.5,),
                  useContainer ?
                  Container(
                    padding: EdgeInsets.only(left:10,right: 10,top:5,bottom: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1D362E),
                      borderRadius: BorderRadius.circular(999)
                    ),
                    child: MediumText(value,fontSize: FontSizes.s,color: color,),
                  ):
                  MediumText(value,fontSize: FontSizes.s,color: color,),
                ],
              )
            ),
          ],
        ),
        VerticalSpacing(),
      ],
    );
  }

  //Button to go social link
  Widget gpuCardButton()
  {
    return BasicButton(
      onPressed: (){},
      width: 107,
      height: 33,
      cornerRadius: 5,
      baseColor: DocColors(Color(0xFF2B2B2F)),
      splashColor: DocColors(Color(0xFF38599A)),
      child: Container(width: 15,height: 15,color: DocColors.white.getValue(),),
    );
  }

  //List of Hosting facilities   
  Widget miningPoolsWidget()
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RegularText("Hosting Facilities",fontSize: FontSizes.xl,),
        for(var pool in widget.currentMiner.miningPoolList)
        MiningPoolsCard(miningPool: pool,),
        
      ],
    );
  }

  Widget cardsText(String text)
  {
    return MediumText(text,fontSize: FontSizes.xxs,);
  }

}