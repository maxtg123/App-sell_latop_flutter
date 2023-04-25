import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_7/screens/accounts/user_info/TTTK.dart';
import 'package:flutter_application_7/models/Account.dart';
import 'package:provider/provider.dart';

import '../../../../api/account.dart';

class Email extends StatefulWidget {
  final List<Account> account;
  const Email({Key? key, required this.account}) : super(key: key);
  @override
  _EmailState createState() => _EmailState();
}
class _EmailState extends State<Email> {
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
              labelText: 'Nhập email mới',
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
                context, MaterialPageRoute(builder: (context)=>TTTKScreen(account: AccountUpdate)));
            },
            child: Text('Thay đổi'),
          ),
        )
      ],
    );
  }

  Future capnhat() async {
    Map<String, String> data = {
      '_email': textEditingController.text,
      '_accountId': widget.account[0].id.toString(),
    };
    var checkupdate = await AccountReQuest.updatemail(data);
  }
}
