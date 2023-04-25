import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_7/api/invoice.dart';
import 'package:flutter_application_7/models/Account.dart';
import 'package:flutter_application_7/models/InvoiceDetail.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import 'detailItem.dart';

class InvoiceDetailScreen extends StatelessWidget {
  final List<Account> account;
  final int  invoiceId;
 
  const InvoiceDetailScreen({Key? key, required this.invoiceId  , required this.account}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  int subtotal = 0;
    var invoiceapi = Provider.of<InvoiceReQuest>(context, listen: false);
     Map<String, String> data = {
      '_invoiceId': invoiceId.toString(),
    };
   /* invoiceapi.getInvoiceDetail(data); */
    List<InvoiceDetail> invoiceDetails = invoiceapi.invoiceDetails;
   
    for (var item in invoiceDetails) {
      subtotal = subtotal+ (item.quantity * item.price);
    }
  List<int> test = [1,2,3,4];
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          "Thông tin đơn hàng",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: kBackgroundColor,
      ),
      body: 
          ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                    ),
                    child: Text(
                      'Người bán đang chuẩn bị hàng/đang giao..',
                      overflow: TextOverflow.clip,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Icon(
                            Icons.place,
                            size: 20,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              account[0].address,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                            Text(
                              account[0].fullname,
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black54),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),

                        FutureBuilder(
                future: invoiceapi.getInvoiceDetail(data),
                builder: (context, AsyncSnapshot snapshot){
                   return SizedBox(
                     height: invoiceDetails.length * 120,
                     child: ListView(
                       children: [
                         for (var item in invoiceDetails)
                       Column(
                      children: [
                        DetailItem(detail: item,),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                  )
                       ],
                     ),
                   );
                }),
                  Container(
                    padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                    decoration: BoxDecoration(color: Colors.white),
                    child: Text(
                      'Địa chỉ',
                      style: TextStyle(fontSize: 20, color: Colors.black54),
                      overflow: TextOverflow.clip,
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border(top: BorderSide(color: Colors.black45))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Tổng thanh toán:',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                             subtotal.toString()+"đ",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Mã đơn hàng',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.orange,
                                ),),
                                SizedBox(width: 60,),
                            Text(
                              "#HD"+invoiceDetails[0].invoiceId.toString(),
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.orange,
                              ),
                              textAlign: TextAlign.end,
                            )
                          ],
                        ),
                        Row(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10,),
                              child: Text('Thời gian đặt hàng',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.orange,
                                  ),),
                            ),
                                SizedBox(width: 30,),
                            Text(
                              invoiceDetails[0].date,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.orange,
                              ),
                              textAlign: TextAlign.end,
                            )
                          ],
                        ),
                       
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
    );
  }
}



