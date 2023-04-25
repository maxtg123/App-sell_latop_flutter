import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_7/api/account.dart';
import 'package:flutter_application_7/screens/accounts/user_info/TTTK.dart';
import 'package:flutter_application_7/models/Account.dart';
import 'package:provider/provider.dart';

class DT extends StatefulWidget {
  final List<Account> account;
  const DT({Key? key, required this.account}) : super(key: key);
  @override
  _DTState createState() => _DTState();
}

class _DTState extends State<DT> {
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
              labelText: 'Nhập tên',
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
      '_fullname': textEditingController.text,
      '_accountId': widget.account[0].id.toString(),
    };
    print(widget.account[0].id.toString());
    print(textEditingController.text);
    var checkupdate = await AccountReQuest.updatename(data);
  }
}
