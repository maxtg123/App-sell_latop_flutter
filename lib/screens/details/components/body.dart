import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/models/Product.dart';
import 'package:flutter_application_7/constants.dart';
class Body extends StatelessWidget {
  final Product product;

  const Body({Key? key, required this.product}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children:<Widget> [
          SizedBox(
            width: size.width,
            height: 250,
            child: Container(
              child: AspectRatio(
                aspectRatio: 1,
                child: CachedNetworkImage(
                            imageUrl:  imageHost + product.imageUrl,
                            fit: BoxFit.fill,
                            placeholder: (context , url ) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context , url , error) => Container(
                              color: Colors.white,
                            ),
                          ),
                ),
            ),
          ),
          Container(          
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              color: kBackgroundColor,
            ),
            child: ListView(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                   padding: EdgeInsets.only(top: kDefaultPaddin , left: kDefaultPaddin),
                   child: Text(
                    product.name,
                     style: TextStyle(
                       color:  kTextColor,
                       fontSize: 20,
                       
                     ),
                   ),
                 ),
                 Padding(
                   padding: EdgeInsets.only(top: kDefaultPaddin/2 , bottom: kDefaultPaddin , left: kDefaultPaddin),
                   child: Text(
                     "Giá: "+ product.price.toString() + "đ",
                     style: TextStyle(
                       color:  Color.fromRGBO(255, 0, 0, 0.7),
                       fontSize: 20,
                       
                     ),
                   ),
                 ),
                Padding(
                   padding: EdgeInsets.only(top: kDefaultPaddin/2 , bottom: kDefaultPaddin , left: kDefaultPaddin/2 , right: kDefaultPaddin/2),
                   child: Container(
                     width: 400,
                     decoration: BoxDecoration(
                       color: kDetailColor.withOpacity(0.5),
                     ),
                     child: Center(
                       child: Text(
                         "Cấu hình "+ product.name,
                         style: TextStyle(
                           color:  kTextColor,
                           fontSize: 15,
                           
                         ),
                       ),
                     ),
                   ),
                 ),
                  Padding(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin/2 ,vertical: kDefaultPaddin/2),
                  child: Row(
                  children:<Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: kDefaultPaddin),
                      child: Container(
                        width: 150,
                        decoration: BoxDecoration(
                          color: kDetailColor.withOpacity(0.5),
                        ),
                        child: Center(
                          child: Text(
                            "Thương hiệu: ",
                            style: TextStyle(
                              color: kTextColor,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 200,
                      decoration: BoxDecoration(
                        color: kDetailColor.withOpacity(0.2),
                      ),
                      child: Text(
                        product.providerId.toString(),
                        style: TextStyle(
                            color: kTextColor,
                            fontSize: 18.0,
                          ),
                      ),
                    ),
                  ], 
                  ),
                  ),
                  Padding(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin/2 , vertical: kDefaultPaddin/2),
                  child: Row(
                  children:<Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right : kDefaultPaddin),
                      child: Container(
                        width: 150,
                        decoration: BoxDecoration(
                          color: kDetailColor.withOpacity(0.5),
                        ),
                        child: Center(
                          child: Text(
                            "RAM: ",
                            style: TextStyle(
                              color: kTextColor,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 200,
                      decoration: BoxDecoration(
                        color: kDetailColor.withOpacity(0.2),
                      ),
                      child: Text(
                        product.ram,
                        style: TextStyle(
                            color: kTextColor,
                            fontSize: 18.0,
                          ),
                      ),
                    ),
                  ], 
                  ),
                  ),
                  Padding(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin/2 , vertical: kDefaultPaddin/2),
                  child: Row(
                  children:<Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right : kDefaultPaddin),
                      child: Container(
                        width: 150,
                        decoration: BoxDecoration(
                          color: kDetailColor.withOpacity(0.5),
                        ),
                        child: Center(
                          child: Text(
                            "ROM: ",
                            style: TextStyle(
                              color: kTextColor,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 200,
                      decoration: BoxDecoration(
                        color: kDetailColor.withOpacity(0.2),
                      ),
                      child: Text(
                        product.rom,
                        style: TextStyle(
                            color: kTextColor,
                            fontSize: 18.0,
                          ),
                      ),
                    ),
                  ], 
                  ),
                  ),
                  Padding(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin/2 , vertical: kDefaultPaddin/2),
                  child: Row(
                  children:<Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right : kDefaultPaddin),
                      child: Container(
                        width:150 ,
                        decoration: BoxDecoration(
                          color: kDetailColor.withOpacity(0.5),
                        ),
                        child: Center(
                          child: Text(
                            "Màn hình: ",
                            style: TextStyle(
                              color: kTextColor,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 200,
                      decoration: BoxDecoration(
                        color: kDetailColor.withOpacity(0.2),
                      ),
                      child: Text(
                        product.screen,
                        style: TextStyle(
                            color: kTextColor,
                            fontSize: 18.0,
                          ),
                      ),
                    ),
                  ], 
                  ),
                  ),
                  Padding(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin/2 , vertical: kDefaultPaddin/2),
                  child: Row(
                  children:<Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right : kDefaultPaddin),
                      child: Container(
                        width: 150,
                        decoration: BoxDecoration(
                          color: kDetailColor.withOpacity(0.5),
                        ),
                        child: Center(
                          child: Text(
                            "Pin: ",
                            style: TextStyle(
                              color: kTextColor,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 200,
                      decoration: BoxDecoration(
                        color: kDetailColor.withOpacity(0.2),
                      ),
                      child: Text(
                        product.pin,
                        style: TextStyle(
                            color: kTextColor,
                            fontSize: 18.0,
                          ),
                      ),
                    ),
                  ], 
                  ),
                  ),
                  Padding(
                    padding:EdgeInsets.all(kDefaultPaddin),
                    child: Text(
                      product.description,
                      style: TextStyle(
                        fontSize: 16,
                        color: kTextLightColor,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}
