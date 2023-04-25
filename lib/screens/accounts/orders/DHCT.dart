import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_7/api/invoice.dart';
import 'package:flutter_application_7/constants.dart';
import 'package:flutter_application_7/models/Account.dart';
import 'package:flutter_application_7/models/Invoice.dart';
import 'package:flutter_application_7/models/InvoiceDetail.dart';
import 'package:flutter_application_7/screens/accounts/orders/InvoiceDetail.dart';
import 'package:provider/provider.dart';

class DHCTScreen extends StatefulWidget {
  final List<Account> account;
  final List<Invoice> invoices;

  const DHCTScreen({Key? key, required this.account, required this.invoices})
      : super(key: key);

  @override
  _DHCTScreenState createState() => _DHCTScreenState();
}

class _DHCTScreenState extends State<DHCTScreen> {
  @override
  Widget build(BuildContext context) {
    var invoiceapi = Provider.of<InvoiceReQuest>(context, listen: false);

    List<Invoice> ListInvoice = widget.invoices;

    List<Invoice> listInvoiceBy0 = [];
    List<Invoice> listInvoiceBy1 = [];
    List<Invoice> listInvoiceBy2 = [];
    List<Invoice> listInvoiceBy3 = [];
    List<Invoice> listInvoiceBy4 = [];

    for (var item in ListInvoice) {
      if (item.status == 0) {
        listInvoiceBy0.add(item);
      }
      if (item.status == 1) {
        listInvoiceBy1.add(item);
      }
      if (item.status == 2) {
        listInvoiceBy2.add(item);
      }
      if (item.status == 3) {
        listInvoiceBy3.add(item);
      }
      if (item.status == 4) {
        listInvoiceBy4.add(item);
      }
    }

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: kBackgroundColor.withOpacity(1),
        appBar: buildAppBar(),
        body: backgrountInvoiceScreen(
            TabBarView(children: [
              ListView(children: [
                for (var item in listInvoiceBy0)
                  Column(
                    children: [
                      invoice('Hủy đơn', context, item, widget.account),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  )
              ]),
              ListView(children: [
                for (var item in listInvoiceBy1)
                  Column(
                    children: [
                      invoice('Hủy đơn', context, item, widget.account),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  )
              ]),
              ListView(children: [
                for (var item in listInvoiceBy2)
                  Column(
                    children: [
                      invoice('Hủy đơn', context, item, widget.account),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  )
              ]),
              ListView(children: [
                for (var item in listInvoiceBy3)
                  Column(
                    children: [
                      invoice('Đánh giá', context, item, widget.account),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  )
              ]),
              ListView(children: [
                for (var item in listInvoiceBy4)
                  Column(
                    children: [
                      invoice('Mua lại', context, item, widget.account),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  )
              ]),
            ]),
            context),
      ),
    );
  }
}

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.lightGreen,
    centerTitle: true,
    title: Text("Đơn hàng của tôi"),
    bottom: const TabBar(
      isScrollable: true,
      indicatorColor: Colors.white,
      tabs: [
        Tab(text: 'Chờ xác nhận'),
        Tab(text: 'Đang vận chuyển'),
        Tab(text: 'Đang giao'),
        Tab(text: 'Đã giao'),
        Tab(text: 'Đã hủy')
      ],
    ),
  );
}

Widget backgrountInvoiceScreen(TabBarView lb, context) {
  return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Stack(children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.greenAccent,
                    Colors.yellowAccent,
                    Colors.blueAccent,
                  ]),
            ),
            child: lb,
          ),
        ]),
      ));
}

Widget invoice(
    String button, BuildContext context, Invoice invoice, List<Account> acc) {
  return InkWell(
    onTap: () {
      var invoiceapi = Provider.of<InvoiceReQuest>(context, listen: false);
      Map<String, String> data = {
        '_invoiceId': invoice.id.toString(),
      };
      invoiceapi.getInvoiceDetail(data).whenComplete(() => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => InvoiceDetailScreen(
                    invoiceId: invoice.id,
                    account: acc,
                  ))));
    },
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(children: [
        SizedBox(
          height: 10,
        ),
        Row(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: 300),
                child: Text(
                  "#HD" + invoice.id.toString(),
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  maxLines: 1,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          )
        ]),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.black45))),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  invoice.date.toString(),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'Tổng thanh toán : ' + invoice.subtotal.toString(),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.bottomRight,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.black45))),
          child: ElevatedButton(
            child: Text(
              button,
              style: const TextStyle(
                fontSize: 16.0,
                fontFamily: kFontFamily,
                fontWeight: FontWeight.w600,
              ),
            ),
            onPressed: () async {
              if (button == 'Hủy đơn') {
                Map<String, String> data5 = {
                  '_invoiceId': invoice.id.toString(),
                };
                bool check = await InvoiceReQuest.detroyInvoice(data5);
                if (check == true) {
                  var invoiceapi =
                      Provider.of<InvoiceReQuest>(context, listen: false);
                  Map<String, String> data = {
                    '_accountId': acc[0].id.toString(),
                  };
                  List<Invoice> invoiceListByAPI =
                      await invoiceapi.getInvoiceListByAccountId(data);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DHCTScreen(account: acc, invoices: invoiceListByAPI),
                    ),
                  );
                }
              } else {
                Map<String, String> data5 = {
                  '_invoiceId': invoice.id.toString(),
                };
                bool check = await InvoiceReQuest.repuchaseInvoice(data5);
                if (check == true) {
                  var invoiceapi =
                      Provider.of<InvoiceReQuest>(context, listen: false);
                  Map<String, String> data = {
                    '_accountId': acc[0].id.toString(),
                  };
                  List<Invoice> invoiceListByAPI =
                      await invoiceapi.getInvoiceListByAccountId(data);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DHCTScreen(account: acc, invoices: invoiceListByAPI),
                    ),
                  );
                }
              }
            },
          ),
        ),
      ]),
    ),
  );
}
