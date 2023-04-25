import 'package:flutter_application_7/constants.dart';
import 'package:flutter_application_7/models/Account.dart';
import 'package:flutter_application_7/screens/accounts/address/components/updateAddress.dart';
import 'package:flutter_application_7/screens/accounts/user_info/TTTK.dart';
import 'package:flutter/material.dart';


class BodyDC extends StatelessWidget {
  final List<Account> account;

  const BodyDC({Key? key,required this.account}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 40),
        const Divider(height: 5, color: Colors.black),
        Column(
          children: List.generate(1, (index) {
            return Row(
              children: [
                Expanded(child: Icon(Icons.place, size: 60)),
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    child: Column(
                      children: [
                         Text(
                          account[0].fullname,
                          style: TextStyle(fontWeight: FontWeight.bold,fontFamily: kFontFamily),
                        ),
                         Text(account[0].phone,style: TextStyle(fontFamily: kFontFamily)),
                        Text(account[0].address,style: TextStyle(fontFamily: kFontFamily))
                      ],
                    ),
                  ),
                ),
                
                 Expanded(
                   child: TextButton(
                     onPressed: (){
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>DDCScreen(account: account) ));
                     },
                    child: Text("Chỉnh sửa",
                    
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.orange),
                    ),
                                 ),
                 ),
              ],
            );
          }),
        ),
        const Divider(height: 5, color: Colors.black),
      ],
    );
  }
}
