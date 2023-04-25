import 'package:flutter/material.dart';
import 'package:flutter_application_7/api/sanpham.dart';
import 'package:flutter_application_7/models/Product.dart';
import 'package:flutter_application_7/screens/details/details_screen.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
class CustomSearch extends SearchDelegate {
   final int accountId;

  CustomSearch(this.accountId);
  @override
  List<Widget>? buildActions(BuildContext context) {
    
    return [
      IconButton(
        onPressed: (){
          query ="";
        },
         icon: const Icon(Icons.clear),
         ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: (){
        close(context, null);
      }, 
      icon: const Icon(Icons.arrow_back),
      );
  }

  @override
  Widget buildSuggestions(BuildContext context ,  ) {
    var productapi = Provider.of<NetWorkReQuest> (context ,
     listen: false );
      
    List<Product> matchQuery = [];
    for(var item in  productapi.products)
    {
      if(item.name.toLowerCase().contains(query.toLowerCase()))
      {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context , index) {
        var result = matchQuery[index];
        return ListTile(
          title :TextButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder:(context)=>DetailsScreen(product: matchQuery[index] , accountId: accountId, ),
                ),
              );
            },
            child: Text(
              result.name,
              style: TextStyle(
                fontSize: 17,
                color:  kTextColor,
              ),
              ),
          )
        );
      }
      );
  }
  
  @override
  Widget buildResults(BuildContext context) {
     var productapi = Provider.of<NetWorkReQuest> (context ,
     listen: false );
     List<Product> matchQuery = [];
    for(var item in  productapi.products)
    {
      if(item.name.toLowerCase().contains(query.toLowerCase()))
      {
        matchQuery.add(item);
      }
    }
   return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context , index) {
        var result = matchQuery[index];
        return ListTile(
          title : TextButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder:(context)=>DetailsScreen(product: matchQuery[index] , accountId: accountId,),
                ),
              );
            },
            child: Text(
              result.name,
              style: TextStyle(
                fontSize: 20,
                
              ),
            ),
          )
        );
      }
      );
  }
}