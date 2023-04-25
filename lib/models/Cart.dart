import 'package:flutter/material.dart';

class Cart {
  final int accountId, productId, quantity, price, id;
  final String name, imageUrl;
  Cart({
    required this.id,
    required this.quantity,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.accountId,
    required this.productId,
   
  });
  Cart.fromJson(Map<String, dynamic> json)
      : accountId = json['accountId'],
        id = json['id'],
        name = json['name'],
        productId = json['productId'],
        quantity = json['quantity'],
        price = json['price'],
     
        imageUrl = json['imageUrl'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accountId'] = this.accountId;
    data['id'] = this.id;
    data['productId'] = this.productId;
    data['productName'] = this.name;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['imageUrl'] = this.imageUrl;
   
    return data;
  }
}
