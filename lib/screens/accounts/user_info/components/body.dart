import 'package:flutter_application_7/api/invoice.dart';
import 'package:flutter_application_7/models/Account.dart';
import 'package:flutter_application_7/models/Invoice.dart';
import 'package:flutter_application_7/screens/accounts/user_info/TTTK.dart';
import 'package:flutter_application_7/screens/accounts/orders/DHCT.dart';
import 'package:flutter_application_7/screens/accounts/address/DCCT.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/screens/login_register/login/login_screen.dart';
import 'package:provider/provider.dart';

import '../../../../api/account.dart';

class Body extends StatelessWidget {
  final List<Account> account;

  const Body({Key? key, required this.account}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var Accountapi = Provider.of<AccountReQuest>(context, listen: false);
    return Column(
      children: <Widget>[
        SizedBox(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 40),
        InkWell(
          onTap: () async {
            Map<String, String> data1 = {
              '_accountId': account[0].id.toString(),
            };
            List<Account> AccountUpdate =
                await Accountapi.getListAccount(data1);
            print(AccountUpdate[0].avt);
            {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TTTKScreen(account: AccountUpdate),
                  ));
            }
            ;
          },
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                Icon(Icons.account_circle, size: 40),
                Text("    Thông tin tài khoản"),
                Spacer(),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
        ),
        SizedBox(height: 40),
        InkWell(
          onTap: ()async {
            var invoiceapi = Provider.of<InvoiceReQuest>(context, listen: false);
          Map<String, String> data = {
          '_accountId': account[0].id.toString(),
           };
            List<Invoice> invoiceListByAPI =await  invoiceapi.getInvoiceListByAccountId(data);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DHCTScreen(
                    invoices: invoiceListByAPI,
                    account: account,
                  ),
                ));
          },
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                Icon(Icons.shopping_cart, size: 40),
                Text("    Đơn hàng của tôi"),
                Spacer(),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
        ),
        SizedBox(height: 40),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DCCTScreen(account: account,),
                ));
          },
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                Icon(Icons.room, size: 40),
                Text("    Địa chỉ của tôi"),
                Spacer(),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
        ),
        SizedBox(height: 40),
        InkWell(
          onTap: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginPage()), (route) => false),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                Icon(Icons.door_back_door_sharp, size: 40),
                Text("Đăng xuất"),
                Spacer(),
                Icon(Icons.arrow_forward_ios),
               
              ],
            ),
          ),
        ),
      ],
    );
  }
}
