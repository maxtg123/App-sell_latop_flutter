
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_7/constants.dart';
import 'package:flutter_application_7/models/Account.dart';
import 'package:flutter_application_7/screens/blog/blog.dart';
import 'package:flutter_application_7/screens/home/home_screen.dart';
import 'package:flutter_application_7/screens/notify/notify.dart';
import 'components/body.dart';
 
class TTCNScreen extends StatelessWidget {
  final Animation<double> animation;
  final List<Account> account; 
  TTCNScreen({Key? key ,required this.account ,required this.animation}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: buildAppBar(),
      body: buildAnimation(Body(account: account,)),
      bottomNavigationBar: buildBottomNavigationBar(context , account),
    );
  }

  AnimatedBuilder buildAnimation(Widget widget) {
    return AnimatedBuilder(
      child: widget,
      animation: animation,
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
}

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: kBackgroundColor,
    centerTitle: true,
    title: Text("Tài khoản"),
  );
}

BottomNavigationBar buildBottomNavigationBar(BuildContext context , var account ) {
    return BottomNavigationBar(
      selectedItemColor: Colors.lightGreen,
      backgroundColor: kBackgroundColor,
      currentIndex: 1,
      type: BottomNavigationBarType.fixed,
      onTap: (index){
       
        Navigator.push(
          context,
           PageRouteBuilder(
             pageBuilder: (context ,animation ,second){
             
               if(index == 0)
               {
                 return HomeScreen(account:account,);
               }
               return TTCNScreen(account: account, animation: animation);

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
              backgroundImage:CachedNetworkImageProvider(
                     imageHost + account[0].avt,
                     errorListener: () => Container(color: Colors.amber,), 

                  ),
            ),
            label: "Tài khoản"),
      ],
    );
  }
