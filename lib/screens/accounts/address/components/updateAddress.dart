import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_7/api/account.dart';
import 'package:flutter_application_7/constants.dart';
import 'package:flutter_application_7/screens/accounts/address/DCCT.dart';
import 'package:flutter_application_7/screens/accounts/user_info/TTTK.dart';
import 'package:flutter_application_7/models/Account.dart';
import 'package:provider/provider.dart';

class DDCScreen extends StatelessWidget {
  final List<Account> account;

  const DDCScreen({Key? key, required this.account}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: buildAppBar(),
      body: DDC(account: account),
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

class DDC extends StatefulWidget {
  final List<Account> account;
  const DDC({Key? key, required this.account}) : super(key: key);
  @override
  _DDCState createState() => _DDCState();
}

class _DDCState extends State<DDC> {
  TextEditingController textEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    var Accountapi = Provider.of<AccountReQuest>(context, listen: false);

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(15),
          child: TextField(
            controller: textEditingController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Nhập địa chỉ',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: ElevatedButton(
            onPressed: () async {
              capnhat();
              Map<String, String> data1 = {
                '_accountId': widget.account[0].id.toString(),
              };
              List<Account> AccountUpdate =
                  await Accountapi.getListAccount(data1);
             
              Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context)=> DCCTScreen(account: AccountUpdate)));
            },
            child: Text('Thay đổi'),
          ),
        )
      ],
    );
  }

  Future capnhat() async {
    Map<String, String> data = {
      '_address': textEditingController.text,
      '_accountId': widget.account[0].id.toString(),
    };
    print(widget.account[0].id.toString());
    print(textEditingController.text);
    var checkupdate = await AccountReQuest.updateAddress(data);
  }
}
