import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/api/cart.dart';
import 'package:flutter_application_7/models/Product.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../constants.dart';
class ItemCard extends StatelessWidget {
  final Product? product;
  final Function()? press;
  
  final int accountId;
  const ItemCard({
    Key? key,
    this.product,
    this.press,
    
    required this.accountId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return GestureDetector(
      onTap: press,
      child: Container(
        height: 150,

        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 3),
            borderRadius: BorderRadius.circular(12)),
        //color: Color.fromRGBO(200, 226, 177, 0.8) ,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 200,
              child: Column(
                children: [
                  SizedBox(
                    height: 166,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(kDefaultPaddin / 4),
                          height: 120,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: imageHost + product!.imageUrl,
                            fit: BoxFit.fill,
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) => Container(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            product!.name,
                            style: TextStyle(
                              fontFamily: kFontFamily,
                              color: kTextColor,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Giá : " + product!.price.toString() + "đ",
                    style: TextStyle(
                      fontFamily: kFontFamily,
                      color:Colors.amberAccent,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15 ),
              child: Container(
                width: 160,
                height: 32,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: <Widget>[
                        ElevatedButton(
                          style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(kBackgroundColor),
                    ),
                          onPressed: () async{
                             
                              Map<String, String> data = {
                                '_productId': product!.id.toString(),
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
                                 backgroundColor: Colors.yellowAccent,
                                 textColor: Colors.white,
                                 );
                              }
                               
                            
                          },
                          child: Row(
                            children: [
                              Text(
                                "Thêm vào giỏ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                          padding:
                              const EdgeInsets.only(left: kDefaultPaddin / 4),
                          child: Icon(
                            Icons.shopping_cart,
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
                            ],
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
}