import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_7/models/Invoice.dart';
import 'package:flutter_application_7/models/InvoiceDetail.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import '../models/Cart.dart';
import 'package:flutter_application_7/constants.dart';

class InvoiceReQuest extends ChangeNotifier{
static List<Invoice> parseInvoice(String response) { 
   var  parsed = json.decode(response) as List<dynamic>;
   return parsed.map<Invoice>((json) => Invoice.fromJson(json)).toList(); 
}

  List<Invoice> invoices = [];
  int? countDetail ;
  List<InvoiceDetail> invoiceDetails = [];
  

 



static _setHeader() => {
  'Content-type' : 'application/json; charset=utf-8',
  'Accept' : 'application/json'
};
static Future<bool> createInvoice (var data) async {
  
  var url = host + "invoice/newInvoice";
   http.Response response = await  http.post(Uri.parse(url),
   headers: _setHeader(),
   body: jsonEncode(data));
   if (response.statusCode == 200) { 
     EasyLoading.showSuccess('Thanh toán thành công!');
         
     print(response.statusCode);
      EasyLoading.dismiss();
     return true;
   } else {
     print(response.statusCode);
     return false;
    
   } 
  
}
static Future<String> getInvoiceId (var data)async{
  String invoiceId;
  var url = host + "invoice/getInvoiceId";
   http.Response response = await  http.post(Uri.parse(url),
   headers: _setHeader(),
   body: jsonEncode(data));
   if (response.statusCode == 200) { 
     dynamic jsondata = json.decode(response.body);
     dynamic id = jsondata["id"];
     invoiceId = id.toString();
     return invoiceId;
   } else {
     throw Exception('khong thanh cong');
    
   } 
}

static Future<bool> detroyInvoice (var data)async{
  
  var url = host + "invoice/huyDonHang";
   http.Response response = await  http.post(Uri.parse(url),
   headers: _setHeader(),
   body: jsonEncode(data));
   if (response.statusCode == 200) { 
    return true;
   } else {
     throw Exception('khong thanh cong');
    
   } 
}
static Future<bool> repuchaseInvoice (var data)async{
  
  var url = host + "invoice/mualaiDonHang";
   http.Response response = await  http.post(Uri.parse(url),
   headers: _setHeader(),
   body: jsonEncode(data));
   if (response.statusCode == 200) { 
    return true;
   } else {
     throw Exception('khong thanh cong');
    
   } 
}
static Future<void> addInvoiceDetail (var data) async {
  print(data);
  var url = host + "invoiceDetail/newInvoiceDetail";
   http.Response response = await  http.post(Uri.parse(url),
   headers: _setHeader(),
   body: jsonEncode(data));
   print(response.statusCode);
   if (response.statusCode == 200) { 
     print("them thanh cong");
   } else {
     throw Exception('khong thanh cong');
    
   } 
}

 Future<List<Invoice>> getInvoiceListByAccountId (var data) async {
  List<Invoice> invoices1 = [];
  var url = host + "invoice/getListInvoiceByAccountId";
   http.Response response = await  http.post(Uri.parse(url),
   headers: _setHeader(),
   body: jsonEncode(data));
   print(response.statusCode);
   if (response.statusCode == 200) { 
     dynamic jsondata = json.decode(response.body);
     dynamic data = jsondata["data"];
     
     data.forEach((i){
        invoices1.add(Invoice.fromJson(i));
     });
    return invoices1;
   } else {
     throw Exception('khong thanh cong');
    
   } 
   
}

 Future<void> getInvoiceDetail (var data  ) async {
  List<InvoiceDetail> invoiceDetails1 = [];
  var count;
  String url = host + "invoiceDetail/getListInvoiceDetail";
   var response = await http.post(Uri.parse(url),
   headers: _setHeader(),
   body: jsonEncode(data));
   if(response.statusCode == 200)
   {
     dynamic jsondata = json.decode(response.body);
     dynamic data = jsondata["data"];
      count = jsondata["count"];
     data.forEach((i){
       invoiceDetails1.add(InvoiceDetail.fromJson(i));
     });
     
    
     
   }
   else
   {
     print(response.body);
     throw Exception("Fail");
   }
   invoiceDetails = invoiceDetails1;
    countDetail = count;
    notifyListeners();
}


}