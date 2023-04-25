import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_7/api/account.dart';
import 'package:flutter_application_7/api/invoice.dart';
import 'package:flutter_application_7/api/sanpham.dart';
import 'package:flutter_application_7/constants.dart';
import 'package:flutter_application_7/screens/welcome/welcome_screen.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_application_7/screens/login_register/login/login_screen.dart';

import 'package:provider/provider.dart';

import 'api/cart.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => NetWorkReQuest(),
      ),
      ChangeNotifierProvider(
        create: (context) => AccountReQuest(),
      ),
      ChangeNotifierProvider(
        create: (context) => InvoiceReQuest(),
      ),
      ChangeNotifierProvider(
        create: (context) => Cartaccount(),
      )
    ],
    child: const MyApp(),
    
  ));
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
    //..customAnimation = CustomAnimation();
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
     
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        primarySwatch: Colors.blue,
      ),
      home: WelcomeScreeen(),
        builder: EasyLoading.init(),
    );
  }
}
