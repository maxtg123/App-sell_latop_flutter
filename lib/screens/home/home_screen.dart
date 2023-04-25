import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/api/cart.dart';
import 'package:flutter_application_7/api/sanpham.dart';
import 'package:flutter_application_7/constants.dart';
import 'package:flutter_application_7/models/Account.dart';
import 'package:flutter_application_7/models/Cart.dart';
import 'package:flutter_application_7/models/Product.dart';
import 'package:flutter_application_7/screens/accounts/user_info/TTCN.dart';
import 'package:flutter_application_7/screens/blog/blog.dart';
import 'package:flutter_application_7/screens/details/details_screen.dart';
import 'package:flutter_application_7/screens/home/components/body.dart';
import 'package:flutter_application_7/screens/cart/cart_shop.dart';
import 'package:flutter_application_7/screens/notify/notify.dart';
import 'package:flutter_application_7/screens/accounts/user_info/TTTK.dart';
import 'package:provider/provider.dart';

import 'components/customSearch.dart';

class HomeScreen extends StatefulWidget {
  final List<Account> account;
 
  HomeScreen({Key? key , required this.account}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}
  class _HomeScreenState extends State<HomeScreen> {
   
  int pageIndex =0;
  @override
  Widget build(BuildContext context) {
    
     
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: buildAppBar(context),
      body: Body(account: widget.account,),
      bottomNavigationBar: buildBottomNavigationBar(context),
    );

  }
  AnimatedBuilder buildAnimation(Widget widget , var animation) {
    return AnimatedBuilder(
      child: widget,
      animation:animation ,
      builder: (context , child){
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(1, 0),
            end: Offset(0,0),
            ).animate(animation),
            child: child,
          );
      },
      );
  }

  BottomNavigationBar buildBottomNavigationBar(BuildContext context ) {
    return BottomNavigationBar(
      selectedItemColor: Colors.lightGreen,
      backgroundColor: kBackgroundColor,
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      onTap: (index){
        
        Navigator.push(
          context,
           PageRouteBuilder(
             pageBuilder: (context ,animation ,second){
              
               if(index == 1)
               {
               return TTCNScreen(account:widget.account,animation: animation,);
               }
                          
               return buildAnimation(widget, animation);

             },
           ),
        );
      },
      
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Trang chủ",
            backgroundColor: kTextColor),       
        BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 14,
              backgroundImage: CachedNetworkImageProvider(
                     imageHost + widget.account[0].avt,
                     errorListener: () => Container(color: Colors.amber,), 

                  ),
            ),
            label: "Tài khoản"),
      ],
    );
  }

  AppBar buildAppBar(BuildContext context ) {
    return AppBar(
      title: Text(
        "TPT Store",
        style: TextStyle(fontFamily:kFontFamily, color: kTextColor, fontWeight: FontWeight.bold , fontSize: 18),
      ),
      elevation: 0,
      backgroundColor:kBackgroundColor,
      leading: Container(
        
        child: Icon(Icons.phone_android_sharp,size: 30,color: kTextColor,),

      ),
      actions: <Widget>[
        
                IconButton(
                          splashRadius: 20,
                            icon: const Icon(
                              Icons.search,
                              color: kTextColor,
                            ),
                            onPressed: (){
                              showSearch(context: context,
                               delegate: CustomSearch(widget.account[0].id),
                               );
                            },
                          ),  
              IconButton(
                splashRadius: 20,
                onPressed: ()async { 
                  Map<String, String> data2 = {
                 '_accountId': widget.account[0].id.toString(),
                   };
                   var Cartapi = Provider.of<Cartaccount>(context, listen: false);

                  List<Cart> ListCartByAPI = await Cartapi.GetListCart(data2);
                  Navigator.push(
                  context,
                   MaterialPageRoute(
                     builder: (context) => CartShop(accounts: widget.account,carts: ListCartByAPI,),
                     ),
                  );
                },
                icon: const Icon(
                  Icons.shopping_cart,
                  size: 30.0,
                  color: kTextColor,
                ),
              ),
      ],
    );
    
  }
}


