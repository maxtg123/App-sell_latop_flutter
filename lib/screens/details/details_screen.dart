import 'package:flutter/material.dart';
import 'package:flutter_application_7/api/cart.dart';
import 'package:flutter_application_7/constants.dart';
import 'package:flutter_application_7/models/Account.dart';
import 'package:flutter_application_7/models/Product.dart';
import 'package:flutter_application_7/screens/details/components/body.dart';
import 'package:flutter_application_7/screens/cart/cart_shop.dart';
import 'package:flutter_application_7/screens/pay/pay_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DetailsScreen extends StatelessWidget{
  final Product product;
  final int accountId;
  const DetailsScreen({Key? key, required this.product , required this.accountId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: buildAppBar(context),
      body: Body(product: product,) ,
      bottomSheet: buildBottomSheet(context),
    );
  }

   buildBottomSheet(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return Container(
      width : size.width,
      color: kBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin*2),
        child: Container(
          width:  150 ,
          height: 50,
          child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(kDetailColor),
                          ),
                          onPressed: ()async{
                             
                              Map<String, String> data = {
                                '_productId': product.id.toString(),
                                '_accountId': accountId.toString()
                              };
                              var checkThem = await NewCartItem(data);
                              if (checkThem == true) {
                              Fluttertoast.showToast(
                                 msg: "Thêm thành công" , 
                                 fontSize : 18,
                                 toastLength: Toast.LENGTH_SHORT,
                                 gravity: ToastGravity.BOTTOM,
                                 timeInSecForIosWeb: 2,
                                 backgroundColor: Colors.amberAccent,
                                 textColor: Colors.white,
                                 );
                              }
                               
                            
                          },
                           child: Padding(
                             padding: const EdgeInsets.only(left: 70),
                             child: Container(
                               width: 250,
                               child: Row(
                                 children: <Widget>[
                                   Text(
                                     "Thêm vào giỏ",
                                     style: TextStyle(
                                       fontSize: 18,
                                       fontFamily: 'Times New Roman',
                                       color: Colors.white,
                                       fontWeight: FontWeight.bold,
                                     ),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.only(left: kDefaultPaddin/2),
                                     child: Icon(
                                       Icons.shopping_cart,
                                       size: 18,
                                       color: Colors.white,
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                           ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kBackgroundColor,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
        color: kTextColor,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      title: Center(
        child: Text(
          product.name,
          style: TextStyle(
            color:  Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      actions: <Widget>[
        
        IconButton(
          icon: Icon(
           Icons.search,
                color: kTextColor,
                size: 20.0,
        ),
        onPressed: (){},
        ),
        IconButton(
          icon: Icon(
           Icons.add_shopping_cart,
                color: kTextColor,
                size: 20.0,
        ),
        onPressed: (){},
        ),
        //SizedBox(width: kDefaultPaddin/ 2)
      ],
    );
  }
}