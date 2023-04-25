import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_7/constants.dart';
import 'package:flutter_application_7/models/Account.dart';
import 'components/bodyDC.dart';

class DCCTScreen extends StatelessWidget {
  final List<Account> account;

  const DCCTScreen({Key? key,required  this.account}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor.withOpacity(1),
      appBar: buildAppBar(),
      body: BodyDC(account: account,),
    );
  }
}

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.lightGreen,
    centerTitle: true,
    title: Text("Địa chỉ của tôi"),
  );
}
