import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_7/models/Account.dart';
import 'package:flutter_application_7/screens/accounts/user_info/components/DMK.dart';
import 'package:flutter_application_7/screens/accounts/user_info/components/DT.dart';
import 'package:flutter_application_7/screens/accounts/user_info/components/Email.dart';
import 'package:flutter_application_7/screens/accounts/user_info/components/SDT.dart';
import 'components/bodytk.dart';
import 'package:flutter_application_7/constants.dart';

class TTTKScreen extends StatelessWidget {
  final List<Account> account;

  const TTTKScreen({Key? key, required this.account}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: buildAppBar(),
      body: BodyTK(
        account: account,
      ),
    );
  }
}
class DTScreen extends StatelessWidget {
  final List<Account> account;

  const DTScreen({Key? key, required this.account}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: buildAppBar(),
      body: DT(
        account: account,
      ),
    );
  }
}

class SDTScreen extends StatelessWidget {
  final List<Account> account;

  const SDTScreen({Key? key, required this.account}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: buildAppBar(),
      body: SDT(
        account: account,
      ),
    );
  }
}

class EmailScreen extends StatelessWidget {
  final List<Account> account;

  const EmailScreen({Key? key, required this.account}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: buildAppBar(),
      body: Email(
        account: account,
      ),
    );
  }
}

class DMKScreen extends StatelessWidget {
  final List<Account> account;

  const DMKScreen({Key? key, required this.account}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: buildAppBar(),
      body: DMK(
        account: account,
      ),
    );
  }
}


AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.lightGreen,
    centerTitle: true,
    title: Text('Sửa hồ sơ'),
    actions: <Widget>[],
  );
}
