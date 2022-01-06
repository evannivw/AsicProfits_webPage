import 'package:asic_miner_website/Admin%20Pages/Main%20page/AdminMain.dart';
import 'package:asic_miner_website/BasicWidgets/ButtonWidgets/BasicButton.dart';
import 'package:asic_miner_website/BasicWidgets/CardWidgets/CardWidget.dart';
import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/PageWidget/page_widget.dart';
import 'package:asic_miner_website/BasicWidgets/Scene%20controller/SceneController.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/VerticalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Text%20field/BasicTextField.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Bold_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/FontSizes.dart';
import 'package:flutter/material.dart';

class AdminLogin extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return _AdminLogin();
  }

}

class _AdminLogin extends PageWidget<AdminLogin>
{
  @override
  double get maxWidth => 400;
  @override
  Widget desktopView() {
    return Container(
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      child: CardWidget(
        width: 400,
        height: 360,
        padding: EdgeInsets.all(25),
        color: DocColors(Colors.white.withOpacity(0.05)),
        child: Column(
          children: [
            BoldText("Login",fontSize: FontSizes(35),),
            VerticalSpacing(height: 40,),
            BasicTextField(hintText: "Email",),
            VerticalSpacing(),
            Divider(thickness: 0.25,color: DocColors.gray.getValue(),),
            VerticalSpacing(),
            BasicTextField(hintText: "Password",),
            VerticalSpacing(height: 40,),
            BasicButton(
              onPressed: (){
                SceneController.pushAndRemoveUntil(context, nextPage: AdminMain());
              },
              width: 132,
              height: 36,
              baseColor: DocColors.blue,
              text: "Login",
            ),
          ],
        ),
      ),
    );
  }
  
}