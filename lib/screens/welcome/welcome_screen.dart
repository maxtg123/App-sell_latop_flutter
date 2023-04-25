import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_7/constants.dart';
import 'package:flutter_application_7/screens/login_register/login/login_screen.dart';
class WelcomeScreeen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                
                child: Text(
                  "Welcome to",
                  style: TextStyle(
                    fontFamily: 'sen',
                    fontSize: 42,
                    color:  Colors.white,
                    fontWeight: FontWeight.bold
                  ),

                  ),
                ),
                ),

  
            Expanded(
              child:Container(    
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.greenAccent , Colors.yellowAccent ,] 
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 90 , top : 25),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'TPT',
                        style: TextStyle(
                          fontSize: 70,
                          fontFamily: 'sen',
                          color: Colors.greenAccent,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            BoxShadow(
                                color:  Colors.black38,
                                offset: Offset(3,6),
                                
                            ),
                          ]                         
                          ),
                        ),
                    ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: Container(
                        child: Text(
                          
                          'Store',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 40,
                            fontFamily: 'sen',
                            color: Colors.white,
                            fontWeight: FontWeight.bold ,
                            shadows: [
                            BoxShadow(
                                color:  Colors.black38,
                                offset: Offset(3,6),
                                
                            ),
                            ],                   
                            ),
                          ),
                      ),
                    ),
                ],
                  ),
                ),
              ),
              
            Expanded(
              child:RawMaterialButton(
                fillColor: Colors.greenAccent,
                shape: CircleBorder(),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage())),
                child: Icon(
                  Icons.navigate_next,
                  color: Colors.white,
                  size: 30,
                ),
                ),
                ),

          ],
        ),
      ),
    );
  }
}