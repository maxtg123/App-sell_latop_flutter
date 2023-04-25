import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_7/api/invoice.dart';
import 'package:flutter_application_7/models/Account.dart';
import 'package:flutter_application_7/screens/accounts/user_info/TTTK.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../api/account.dart';
import '../../../../constants.dart';

class BodyTK extends StatefulWidget {
  final List<Account> account;

  const BodyTK({Key? key, required this.account}) : super(key: key);
  @override
  _BodyTKState createState() => _BodyTKState();
}

class _BodyTKState extends State<BodyTK> {
  List<Account> AccountList = [];
  PickedFile? _imageFile;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    var Accountapi = Provider.of<AccountReQuest>(context, listen: false);
    
    void takephoto() async {
      final _imageFile = await _picker.getImage(source: ImageSource.gallery);
      print( _imageFile!.path);
      Map<String, String> data = {
                          "_accountId":widget.account[0].id.toString(),              
                        };
                        var res = await Accountapi.postdata(
                          data,
                            _imageFile == null ? null : _imageFile);
                        if (res == "Thành công") {
                          
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      TTTKScreen(account: widget.account)));
                        } else {
                          print("Thất bại");
                        }
      
    }

    return ListView(
      children: <Widget>[
        SizedBox(
          child: GestureDetector(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  height: 150,
                  width: 150,
                  child: CachedNetworkImage(
                    imageUrl: imageHost + widget.account[0].avt,
                    fit: BoxFit.fill,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                    top: 125,
                    right: 130,
                    child: InkWell(
                      onTap: () async {
                        takephoto();
                        
                      },
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.black87,
                        size: 28.0,
                      ),
                    ))
              ],
            ),
          ),
        ),
        SizedBox(height: 40),
        InkWell(
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => DTScreen(account: widget.account)));
          },
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                Text("Tên"),
                Spacer(),
                Text(widget.account[0].fullname),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
        ),
        SizedBox(height: 40),
        InkWell(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                Text("Tên đăng nhập"),
                Spacer(),
                Text(widget.account[0].username),
              ],
            ),
          ),
        ),
        SizedBox(height: 40),
        InkWell(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                Text("Giới tính"),
                Spacer(),
                Text(widget.account[0].sex),
              ],
            ),
          ),
        ),
        SizedBox(height: 40),
        InkWell(
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => SDTScreen(account: widget.account)));
          },
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                Text("Số điện thoại"),
                Spacer(),
                Text(widget.account[0].phone),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
        ),
        SizedBox(height: 40),
        InkWell(
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        EmailScreen(account: widget.account)));
          },
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                Text("Email"),
                Spacer(),
                Text(widget.account[0].email),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
        ),
        SizedBox(height: 40),
        InkWell(
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => DMKScreen(account: widget.account)));
          },
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                Text("Thiết lập mật khẩu"),
                Spacer(),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
