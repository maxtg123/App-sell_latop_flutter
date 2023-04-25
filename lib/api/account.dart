import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import '../models/Account.dart';
import 'package:flutter_application_7/constants.dart';
import 'package:http_parser/http_parser.dart';

class AccountReQuest extends ChangeNotifier {
  static List<Account> parseProducts(String response) {
    var parsed = json.decode(response) as List<dynamic>;
    return parsed.map<Account>((json) => Account.fromJson(json)).toList();
  }

  static Future<List<Account>> login(var data) async {
    List<Account> acc = [];
    String url = host + "account/login";
    var response = await http.post(Uri.parse(url),
        headers: _setHeader(), body: jsonEncode(data));
    EasyLoading.show(status: 'loading...');
    if (response.statusCode == 200) {
      EasyLoading.showSuccess('Đăng nhập thành công!');
      dynamic jsondata = json.decode(response.body);
      dynamic data = jsondata["data"];

      data.forEach((i) {
        acc.add(Account.fromJson(i));
      });
      EasyLoading.dismiss();
      return acc;
    } else {
      
      throw Exception("Fail");
    }
  }

  static Future SingUp(var data) async {
    String url = host + "account/signup";
    var response = await http.post(Uri.parse(url),
        headers: _setHeader(), body: jsonEncode(data));
    if (response.statusCode == 200) {
      return 'Success';
    } else {
      print(response.body);
      throw Exception("Fail");
    }
  }

  static _setHeader() => {
        'Content-type': 'application/json; charset=utf-8',
        'Accept': 'application/json'
      };
  static Future<String> getListUsername(var data) async {
    String username;
    var url = host + "account/getListUsername";
    http.Response response = await http.post(Uri.parse(url),
        headers: _setHeader(), body: jsonEncode(data));
    if (response.statusCode == 200) {
      dynamic jsondata = json.decode(response.body);
      dynamic data = jsondata["data"];
      username = data;
      print(username);
      return username;
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }

  static Future updatename(var data) async {
    var url = host + "account/updatefullname";
    http.Response response = await http.post(Uri.parse(url),
        headers: _setHeader(), body: jsonEncode(data));
    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed');
    }
  }

  static Future updateSDT(var data) async {
    var url = host + "account/updatephonenumber";
    http.Response response = await http.post(Uri.parse(url),
        headers: _setHeader(), body: jsonEncode(data));
    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed');
    }
  }

  static Future updatemail(var data) async {
    var url = host + "account/updatemail";
    http.Response response = await http.post(Uri.parse(url),
        headers: _setHeader(), body: jsonEncode(data));
    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed');
    }
  }

  static Future updatepass(var data) async {
    var url = host + "account/updatepassword";
    http.Response response = await http.post(Uri.parse(url),
        headers: _setHeader(), body: jsonEncode(data));

    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed');
    }
  }
  static Future updateAddress(var data) async {
    var url = host + "account/updateAddress";
    http.Response response = await http.post(Uri.parse(url),
        headers: _setHeader(), body: jsonEncode(data));

    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed');
    }
  }

  static Future<String> getpass(var data) async {
    String pass;
    var url = host + "account/getpassword";
    http.Response response = await http.post(Uri.parse(url),
        headers: _setHeader(), body: jsonEncode(data));
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);
      var data = jsondata["data"];
      pass = data.toString();
      print(pass);
      return pass;
    } else {
      throw Exception('Failed');
    }
  }

  Future<List<Account>> getListAccount(var data) async {
    List<Account> account1 = [];
    print(data);
    var url = host + "account/getAccountById";
    http.Response response = await http.post(Uri.parse(url),
        headers: _setHeader(), body: jsonEncode(data));
    if (response.statusCode == 200) {
      dynamic jsondata = json.decode(response.body);
      dynamic data = jsondata["data"];
      data.forEach((i) {
        account1.add(Account.fromJson(i));
      });
      print("Status code update " + response.statusCode.toString());
      print("so tai khoan " + account1.length.toString());
      return account1;
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
    
  }

  Future postdata(Map<String, String> data, PickedFile? image) async {
    var url = host + 'account/updateAVT';
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers.addAll(_setHeaderFIle());
    request.fields.addAll(data);
    if (image != null) {
      request.files.add(await http.MultipartFile.fromPath(
          '_hinhanh', image.path,
          contentType: MediaType('image', 'jpg')));
    }
    var response = await request.send();
    print(response.statusCode);
    if (response.statusCode == 200) {
      return "Thành công";
    } else {
      return "Thất bại";
    }
  }
  _setHeaderFIle() =>
    {'Content-Type': 'application/json; charset=utf-8,image/jpg'};
}
