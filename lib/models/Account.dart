
import 'package:flutter/material.dart';
class Account {
  late final String address , fullname , phone , avt , username , password , email ,sex ;
  late final int id ,status ;
  
   Account(
      { required this.id,
     required this.username,
     required this.password,
      required this.phone,
      required this.avt,
      required this.status,
     required this.fullname,
     required this.address,
     required this.email,
     required this.sex,
      });
Account.fromJson(Map<String, dynamic> json) : 
    id = json['id'],
    username  = json['username'],
    password = json['password'],
    email = json['email'],
    address = json['address'],
    status = json['status'],
    phone = json['phone'],
    avt = json['avt'],
    sex = json['sex'],
     fullname= json['fullname'];
    
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['password'] = this.password;
    data['email'] = this.email;
    data['address'] = this.address;
    data['status'] = this.status;
    data['phone'] = this.phone;
    data['fullname'] = this.fullname;
    data['sex'] = this.sex;
    data['avt'] = this.avt;
    return data;
  }
}

