import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_7/screens/accounts/user_info/TTTK.dart';
import 'package:flutter_application_7/models/Account.dart';
import 'package:provider/provider.dart';

import '../../../../api/account.dart';

class DMK extends StatefulWidget {
  final List<Account> account;
  const DMK({Key? key, required this.account}) : super(key: key);
  @override
  _DMKState createState() => _DMKState();
}

class _DMKState extends State<DMK> {
  TextEditingController textEditingController = new TextEditingController();
  TextEditingController text1EditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    var Accountapi = Provider.of<AccountReQuest>(context, listen: false);
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(15),
          child: TextField(
            controller: textEditingController,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Mật khẩu hiện tại',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15),
          child: TextField(
            controller: text1EditingController,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Mật khẩu mới',
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
              print(AccountUpdate.length);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          TTTKScreen(account: AccountUpdate)));
            },
            child: Text('Thay đổi'),
          ),
        )
      ],
    );
  }

  Future capnhat() async {
    Map<String, String> data1 = {
      '_accountId': widget.account[0].id.toString(),
    };
    String password = await AccountReQuest.getpass(data1);

    if (textEditingController.text.compareTo(password) == 0) {
      Map<String, String> data = {
        '_password': text1EditingController.text,
        '_accountId': widget.account[0].id.toString(),
      };
      var checkupdate = await AccountReQuest.updatepass(data);
    } else {
      text1EditingController.clear;
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Thông báo'),
          content: Text("Mật khẩu hiện tại không đúng !"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }
}
