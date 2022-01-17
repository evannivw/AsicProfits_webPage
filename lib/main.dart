import 'dart:convert';

import 'package:asic_miner_website/Admin%20Pages/Add%20Hosting%20Page/AddHostingPage.dart';
import 'package:asic_miner_website/Admin%20Pages/Add%20Miner%20Page/AddMinerPage.dart';
import 'package:asic_miner_website/Admin%20Pages/Admin%20Calculator/AdminCalculator.dart';
import 'package:asic_miner_website/Admin%20Pages/Admin%20Calculator/Views/AdminCalculatorTopWidget.dart';
import 'package:asic_miner_website/Admin%20Pages/Login/AdminLogin.dart';
import 'package:asic_miner_website/Admin%20Pages/Main%20page/AdminMain.dart';
import 'package:asic_miner_website/BasicWidgets/ButtonWidgets/BasicButton.dart';
import 'package:asic_miner_website/BasicWidgets/CardWidgets/CardWidget.dart';
import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/CustomLoading/CustomLoading.dart';
import 'package:asic_miner_website/BasicWidgets/PageWidget/View_Type.dart';
import 'package:asic_miner_website/BasicWidgets/PageWidget/page_widget.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Black_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Bold_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/FontSizes.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Light_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Medium_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Semi_BoldText.dart';
import 'package:asic_miner_website/Models/MinerModel.dart';
import 'package:asic_miner_website/Pages/Asic%20Profits%20Main/AsicProfitsMain.dart';
import 'package:asic_miner_website/Pages/Contact%20Page/ContactPage.dart';
import 'package:asic_miner_website/Pages/Product%20page/ProductPage.dart';
import 'package:asic_miner_website/Pages/Top%20Widget/Top%20Widget%20Views/SideView.dart';
import 'package:asic_miner_website/Pages/Top%20Widget/TopWidget.dart';
import 'package:asic_miner_website/Pages/Vendors%20Page/VendorsPage.dart';
import 'package:asic_miner_website/TabPage%20View/TabPageView.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  await configureApp();
  runApp(const MyApp());
}

Future configureApp() async {
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyDcDUL-wHDQwgPBWjbZOf_JMwReR9ETj5w",
        authDomain: "asic-profits.firebaseapp.com",
        projectId: "asic-profits",
        storageBucket: "asic-profits.appspot.com",
        messagingSenderId: "208024299912",
        appId: "1:208024299912:web:ba15bbc1fef8f3f3a5b23d"),
  );
  //setUrlStrategy(PathUrlStrategy());
  /*await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyDcDUL-wHDQwgPBWjbZOf_JMwReR9ETj5w",
        authDomain: "asic-profits.firebaseapp.com",
        projectId: "asic-profits",
        storageBucket: "asic-profits.appspot.com",
        messagingSenderId: "208024299912",
        appId: "1:208024299912:web:ba15bbc1fef8f3f3a5b23d"),
  );*/
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String url = Uri.base.toString();
    print("URL: " + url);
    //print("Miner model: "+jsonEncode(MinerModel()).toString());
    return MaterialApp(
      title: 'ASIC Profits',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: kDebugMode
          ? AdminMain()
          : url.toLowerCase().contains("admin")
              ? AdminLogin()
              : const TabPageView(title: "ASIC Profits main"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends PageWidget<MyHomePage> {
  DocColors color = DocColors.transparent;
  DocColors textColor = DocColors.white;
  @override
  Widget desktopView() {
    return Row(
      children: [
        BasicButton(
          baseColor: color,
          textColor: textColor,
          onPressed: () {
            print("button");
            setState(() {
              color = DocColors.blue;
              textColor = DocColors.red;
            });
          },
        )
      ],
    );
  }
}
