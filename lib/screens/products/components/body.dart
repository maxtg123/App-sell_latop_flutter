import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/api/cart.dart';
import 'package:flutter_application_7/api/sanpham.dart';
import 'package:flutter_application_7/constants.dart';
import 'package:flutter_application_7/models/Account.dart';
import 'package:flutter_application_7/models/Product.dart';
import 'package:flutter_application_7/screens/cart/cart_shop.dart';
import 'package:flutter_application_7/screens/details/details_screen.dart';
import 'package:flutter_application_7/screens/products/products_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'categories.dart';
import 'itemCard.dart';

class Body extends StatefulWidget {
  final int Id;
  final String categories;
  final int selected;
  final List<Account> account;
  final List<Product> product;
  const Body(
      {Key? key,
      required this.Id,
      required this.categories,
      required this.selected,
      required this.account,
      required this.product})
      : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var isDescending = false;
  @override
  Widget build(BuildContext context) {
    var productapi = Provider.of<NetWorkReQuest>(context, listen: false);
    productapi.fetchProducts();
    List<Product> productByProviderId = [];
    if (widget.Id == 0) {
      productByProviderId = widget.product;
    } else if (widget.Id == 1) {
      for (var item in widget.product) {
        if (item.providerId == 1) productByProviderId.add(item);
      }
    }
    if (widget.Id == 4) {
      for (var item in widget.product) {
        if (item.providerId == 4) productByProviderId.add(item);
      }
    }
    if (widget.Id == 2) {
      for (var item in widget.product) {
        if (item.providerId == 2) productByProviderId.add(item);
      }
    }
    if (widget.Id == 3) {
      for (var item in widget.product) {
        if (item.providerId == 3) productByProviderId.add(item);
      }
    }

    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Categories(
            selected: widget.selected,
            account: widget.account,
            product: widget.product,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top : 10,),
          child: Container(
            width: 50,
            height: 30,
            decoration: BoxDecoration(
              color: kBackgroundColor,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 5, left: 170),
              child: Text(
                widget.categories,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 30,
                child: Icon(Icons.filter_list_outlined),
              ),
              ElevatedButton(
                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          kBackgroundColor),
                                ),
                onPressed: () {
                  setState(() {
                    isDescending = !isDescending;
                  });
                  print(isDescending);
                },
                child: Row(
                  children: [
                    Text(
                      isDescending ? "Giá giảm dần" : "Giá tăng dần",
                    ),
                    Icon(Icons.compare_arrows)
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 260,
          height:  40.0 * productapi.products.length,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 10.0, vertical: kDefaultPaddin),
            child: FutureBuilder(
              future: productapi.fetchProducts(),
              builder: (context, AsyncSnapshot snapshot) {
                return GridView.builder(
                    shrinkWrap: true,
                    itemCount: productByProviderId.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: kDefaultPaddin / 4,
                      crossAxisSpacing: kDefaultPaddin / 4,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (context, index) {
                      final sortItem = isDescending
                          ? productByProviderId.reversed.toList()
                          : productByProviderId;
                      return ItemCard(
                        product: sortItem[index],
                       
                        press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                    accountId: widget.account[0].id,
                                    product: sortItem[index],
                                  )),
                        ),
                        accountId: widget.account[0].id,
                      );
                    });
              },
            ),
          ),
        ),
      ],
    );
  }

  
}



