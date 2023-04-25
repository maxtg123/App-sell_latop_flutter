import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_7/api/sanpham.dart';
import 'package:flutter_application_7/constants.dart';
import 'package:flutter_application_7/api/account.dart';
import 'package:flutter_application_7/models/Account.dart';
import 'package:flutter_application_7/screens/home/home_screen.dart';
import 'package:flutter_application_7/screens/login_register/register/registerpage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Timer? _timer;
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  var _usernameErr = "Tài khoản không hợp lệ";
  var _passErr = "Mật khẩu phải trên 6 ký tự";
  var _usernameInvalid = false;
  var _passwordInvalid = false;

  bool showPass1 = true;

  @override
  void initState() {
    
    super.initState();
     EasyLoading.addStatusCallback((status) {
      print('EasyLoading Status $status');
      if (status == EasyLoadingStatus.dismiss) {
        _timer?.cancel();
      }
    });
   
  }
  @override
  Widget build(BuildContext context) {
    _showSnackBarMsg(BuildContext context)
  {
    final  snackBar = SnackBar(
      content: Text('Message is restored!')
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }
    Size size = MediaQuery.of(context).size;
    var productapi = Provider.of<NetWorkReQuest>(context, listen: false);
    productapi.ProductByDate();
    productapi.fetchProducts();
    productapi.ProductHot();
    productapi.ProductBestSeller();
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: Text(
                    'WELCOME TO TPTSTORE',
                    style: TextStyle(
                        color: kTextColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  width: 500,
                  height: 220,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/logo_store.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: kTextColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      TextField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Nhập Email",
                          errorText: _usernameInvalid ? _usernameErr : null,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        obscureText: showPass1,
                        controller: passwordController,
                        decoration: InputDecoration(
                            errorText: _passwordInvalid ? _passErr : null,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    showPass1 = !showPass1;
                                    print('$showPass1');
                                  });
                                },
                                icon: const Icon(Icons.visibility)),
                            border: const OutlineInputBorder(),
                            labelText: "Nhập mật khẩu"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 50,
                        width: 400,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                Colors.lightGreen.withOpacity(0.7),
                              ),
                            ),
                            onPressed: () {
                              SigninClick();
                              Login();
                            },
                            child: const Text(
                              "Đăng Nhập",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()),
                          );
                        },
                        child: const Text(
                          'Tạo tài khoản mới ',
                          style: TextStyle(
                            color: kTextColor,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Quên mật khẩu ',
                          style: TextStyle(
                            color: kTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );

  }

  Future Login() async {
    Map<String, String> data = {
      '_username': usernameController.text,
      '_password': passwordController.text,
    };
    List<Account> res = await AccountReQuest.login(data);
    
    if (res.length == 1) {
      
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen(
                    account: res,
                  )),
          (route) => false);
     
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Thông báo'),
          content: Text("Sai tên tài khoản hoặc mật khẩu! Vui lòng nhập lại."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  void SigninClick() {
    setState(() {
      if (usernameController.text.length < 6) {
        _usernameInvalid = true;
      } else {
        _usernameInvalid = false;
      }

      if (passwordController.text.length < 6) {
        _passwordInvalid = true;
      } else {
        _passwordInvalid = false;
      }
    });
  }
  
}
