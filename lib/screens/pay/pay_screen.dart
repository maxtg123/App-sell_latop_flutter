import 'package:flutter/material.dart';
import 'package:flutter_application_7/api/invoice.dart';
import 'package:flutter_application_7/models/Account.dart';
import 'package:flutter_application_7/models/Cart.dart';
import 'package:flutter_application_7/screens/home/home_screen.dart';
import 'package:flutter_application_7/screens/pay/components/body.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../constants.dart';
import 'package:flutter_application_7/models/Cart.dart';
import 'components/body.dart';

class PayScreen extends StatelessWidget {
  final List<Account> account;
  final subtotal;
  final List<Cart> carts;
  const PayScreen({Key? key, required this.account, required this.carts, required this.subtotal})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    print(subtotal);
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(
        subToTal: subtotal,
        account: account ,
        carts: carts,
      ),
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(
          color: kBackgroundColor.withOpacity(1),
          border: Border.all(color: Colors.lightGreen, width: 1),
        ),
        child: Row(
          children: [
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: kDefaultPaddin,
                  ),
                  child: Text.rich(
                    TextSpan(
                      text: "Thành tiền: ",
                      children: [
                        TextSpan(
                          text: subtotal.toString(),
                          style: TextStyle(
                            color: Color.fromRGBO(255, 0, 0, 0.7),
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: kDefaultPaddin,
                  ),
                  child: Text.rich(
                    TextSpan(
                      text: "Phí giao hàng: ",
                      children: [
                        TextSpan(
                          text: "24.000đ",
                          style: TextStyle(
                            color: Color.fromRGBO(255, 0, 0, 0.7),
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: kDefaultPaddin,
                  ),
                  child: Text.rich(
                    TextSpan(
                      text: "Tổng thanh toán: ",
                      children: [
                        TextSpan(
                          text: (subtotal + 24000).toString(),
                          style: TextStyle(
                            color: Color.fromRGBO(255, 0, 0, 0.7),
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                width: 150,
                height: 40,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(kDetailColor)),
                  onPressed: () {
                    payClick(subtotal,context);
                  },
                  child: Row(
                    children: [
                      Text(
                        "Đặt hàng",
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Icon(
                          Icons.shopping_cart,
                          size: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future payClick(var subtotal,BuildContext context) async {
    Map<String, String> data = {
      '_accountId':account[0].id.toString(),
      '_subtotal': subtotal.toString(),
      '_address' : account[0].address,
    };
    print(subtotal);
    print(account[0].id);
    bool checkCreateInvoice = await InvoiceReQuest.createInvoice(data);
    print(checkCreateInvoice);
    if (checkCreateInvoice == true) {
      
      Map<String, String> data1 = {
        '_accountId': account[0].id.toString(),
      };

      var invoiceId = await InvoiceReQuest.getInvoiceId(data1);
      print("InvoiceId la " + invoiceId);
      for (var cart in carts) {
        Map<String, String> data2 = {
          '_invoiceId': invoiceId,
          '_productId': cart.productId.toString(),
          '_quantity': cart.quantity.toString(),
          '_price': cart.price.toString(),

        };
        InvoiceReQuest.addInvoiceDetail(data2);
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomeScreen(account: account,)), (route) => false);
      }
      
       
    } else {
      print("Khong thanh cong");
    }
  
  }
}

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    title: Center(
      child: Text(
        "Thanh toán",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: kTextColor,
          fontSize: 20,
        ),
      ),
    ),
    backgroundColor: kBackgroundColor,
    elevation: 0,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: kTextColor,
        size: 20.0,
      ),
      onPressed: () => Navigator.pop(context),
    ),
  );
}
