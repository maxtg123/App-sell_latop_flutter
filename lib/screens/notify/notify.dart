import 'package:flutter/material.dart';
import 'package:flutter_application_7/constants.dart';

class NotiFy extends StatefulWidget {
  const NotiFy({Key? key}) : super(key: key);

  @override
  _NotiFyState createState() => _NotiFyState();
}

class _NotiFyState extends State<NotiFy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(229, 255, 204, 0.5),
        appBar: AppBar(
          title: const Text('Thông báo', style: TextStyle(color: Colors.black)),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
              onPressed: () =>Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
        ),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
              children: List.generate(5, (index) {
            return Container(
              margin: const EdgeInsets.only(top: 10),
              decoration: const BoxDecoration(
                  border: Border(
                      top: BorderSide(width: 2, color: Colors.black),
                      left: BorderSide(width: 2, color: Colors.black),
                      bottom: BorderSide(width: 2, color: Colors.black),
                      right: BorderSide(width: 2, color: Colors.black))),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2, bottom: 2),
                    child: SizedBox(
                      width: 150,
                      height: 80,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications,
                            color: Colors.black,
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const SizedBox(
                    height: 80,
                    width: 200,
                    child: Text(
                        'Em không là nàng thơ Anh cũng không còn là nhạc sĩ mộng mơ Tình này nhẹ như gió Lại trĩu lên tim ta những vết hằn',
                        style: TextStyle(color: kTextColor)),
                  )
                ],
              ),
            );
          })),
        ));
  }
}
