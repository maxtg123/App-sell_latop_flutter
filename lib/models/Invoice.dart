import 'package:flutter/material.dart';
import 'package:flutter_application_7/models/InvoiceDetail.dart';
class Invoice {
  int id ,  subtotal, status;
   String date, address;
  
  Invoice(
      {
     required this.id,
     required this.date,
     required this.subtotal,
     required this.status,
     required this.address,
    
     });

  Invoice.fromJson(Map<String, dynamic> json) : 
    id = json['id'],
    date = json['date'],
    subtotal = json['subtotal'], 
    address = json['address'],                                          
    status = json['status'];
    
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['address'] = this.address;
    data['subtotal'] = this.subtotal;
    data['date'] = this.date;
    return data;
  }
}