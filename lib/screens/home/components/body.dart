import 'package:flutter/material.dart';
import 'package:flutter_application_7/api/cart.dart';
import 'package:flutter_application_7/api/invoice.dart';
import 'package:flutter_application_7/constants.dart';
import 'package:flutter_application_7/models/Account.dart';
import 'package:flutter_application_7/models/Product.dart';
import 'package:flutter_application_7/api/sanpham.dart';
import 'package:flutter_application_7/screens/details/details_screen.dart';
import 'package:flutter_application_7/screens/products/components/itemCard.dart';
import 'package:flutter_application_7/screens/products/products_screen.dart';
import 'package:flutter_application_7/screens/products/components/body.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  final List<Account> account;

  const Body({Key? key, required this.account}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    var productapi = Provider.of<NetWorkReQuest>(context, listen: false);
    List<Product> productbyAPI = productapi.products;
    productapi.fetchProducts();
    productapi.ProductByDate();
    var Cartapi = Provider.of<Cartaccount>(context, listen: false);
    Map<String, String> data2 = {
      '_accountId': widget.account[0].id.toString(),
    };
    Cartapi.GetListCart(data2);

    var invoiceapi = Provider.of<InvoiceReQuest>(context, listen: false);
    Map<String, String> data = {
      '_accountId': widget.account[0].id.toString(),
    };
    invoiceapi.getInvoiceListByAccountId(data);

    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin / 2),
          child: Container(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPaddin / 4),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductsScreen(
                                providerId: 1,
                                Categories: "Iphone",
                                selected: 1,
                                account: widget.account,
                                product: productbyAPI,
                              )),
                    ),
                    child: Container(
                      width: 50,
                      height: 30,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/icons/icon_iphone.png"),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPaddin / 4),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductsScreen(
                                providerId: 3,
                                Categories: "Xiaomi",
                                selected: 3,
                                account: widget.account,
                                product: productbyAPI,
                              )),
                    ),
                    child: Container(
                      width: 50,
                      height: 30,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/icons/icon_xiaomi.png"),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPaddin / 4),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductsScreen(
                                providerId: 2,
                                Categories: "Samsung",
                                selected: 2,
                                account: widget.account,
                                product: productbyAPI,
                              )),
                    ),
                    child: Container(
                      width: 50,
                      height: 30,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/icons/icon_samsung.png"),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPaddin / 4),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductsScreen(
                                providerId: 4,
                                Categories: "Oppo",
                                selected: 2,
                                account: widget.account,
                                product: productbyAPI,
                              )),
                    ),
                    child: Container(
                      width: 50,
                      height: 30,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/icons/icon_oppo.png"),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: size.height * 7 / 10,
          width: size.width,
          child: PageView(
            scrollDirection: Axis.horizontal,
            pageSnapping: true,
            children: [
              Container(
                height: 500,
                width: 400,
                child: ListView(
                  children: [
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: kDefaultPaddin,
                              horizontal: kDefaultPaddin),
                          child: Text(
                            'Sản phẩm  mới nhất',
                            style: TextStyle(
                              fontFamily: kFontFamily,
                              color: kTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Container(
                              height: 35,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          kBackgroundColor),
                                ),
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductsScreen(
                                            providerId: 0,
                                            Categories: "Tất cả",
                                            selected: 0,
                                            account: widget.account,
                                            product: productbyAPI,
                                          )),
                                ),
                                child: Text(
                                  "Xem tất cả",
                                  style: TextStyle(
                                    fontFamily: kFontFamily,
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    FutureBuilder(
                        future: productapi.ProductByDate(),
                        builder: (context, AsyncSnapshot snapshot) {
                          return Container(
                            width: 100.0 * productapi.productByDate.length,
                            height: 150.0 * productapi.productByDate.length,
                            child: GridView.builder(
                              shrinkWrap: true,
                              itemCount: 3, //productapi.productByDate.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: kDefaultPaddin / 4,
                                crossAxisSpacing: kDefaultPaddin / 4,
                                childAspectRatio: 0.8,
                              ),
                              itemBuilder: (context, index) => ItemCard(
                                product: productapi.productByDate[index],
                                press: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailsScreen(
                                            accountId: widget.account[0].id,
                                            product:
                                                productapi.productByDate[index],
                                          )),
                                ),
                                accountId: widget.account[0].id,
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ),
              Container(
                height: 500,
                width: 100,
                child: ListView(
                  children: [
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: kDefaultPaddin,
                              horizontal: kDefaultPaddin),
                          child: Text(
                            'Sản phẩm  nổi bật',
                            style: TextStyle(
                              fontFamily: kFontFamily,
                              color: kTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Container(
                              height: 35,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.lightGreen),
                                ),
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductsScreen(
                                            providerId: 0,
                                            Categories: "Tất cả sản phẩm",
                                            selected: 0,
                                            account: widget.account,
                                            product: productbyAPI,
                                          )),
                                ),
                                child: Text(
                                  "Xem tất cả",
                                  style: TextStyle(
                                    fontFamily: kFontFamily,
                                    color: kTextColor,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    FutureBuilder(
                        future: productapi.ProductHot(),
                        builder: (context, AsyncSnapshot snapshot) {
                          return Container(
                            width: 100.0 * productapi.hotProducts.length,
                            height: 73.0 * productapi.hotProducts.length,
                            child: GridView.builder(
                              
                              itemCount: productapi.hotProducts.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: kDefaultPaddin / 4,
                                crossAxisSpacing: kDefaultPaddin / 4,
                                childAspectRatio: 0.75,
                              ),
                              itemBuilder: (context, index) => ItemCard(
                                product: productapi.hotProducts[index],
                                press: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailsScreen(
                                            accountId: widget.account[0].id,
                                            product:
                                                productapi.hotProducts[index],
                                          )),
                                ),
                                accountId: widget.account[0].id,
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ),
              Container(
                height: 500,
                width: 400,
                child: ListView(
                  children: [
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: kDefaultPaddin,
                              horizontal: kDefaultPaddin),
                          child: Text(
                            'Sản phẩm  bán chạy',
                            style: TextStyle(
                              fontFamily: kFontFamily,
                              color: kTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Container(
                              height: 35,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.lightGreen),
                                ),
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductsScreen(
                                            providerId: 0,
                                            Categories: "Tất cả sản phẩm",
                                            selected: 0,
                                            account: widget.account,
                                            product: productbyAPI,
                                          )),
                                ),
                                child: Text(
                                  "Xem tất cả",
                                  style: TextStyle(
                                    fontFamily: kFontFamily,
                                    color: kTextColor,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    FutureBuilder(
                        future: productapi.ProductBestSeller(),
                        builder: (context, AsyncSnapshot snapshot) {
                          return Container(
                            width: 100.0 * productapi.bestSellerProducts.length,
                            height: 73.0 * productapi.bestSellerProducts.length,
                            child: GridView.builder(
                              
                              itemCount: productapi.bestSellerProducts.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: kDefaultPaddin / 4,
                                crossAxisSpacing: kDefaultPaddin / 4,
                                childAspectRatio: 0.75,
                              ),
                              itemBuilder: (context, index) => ItemCard(
                                product: productapi.bestSellerProducts[index],
                                press: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailsScreen(
                                            accountId: widget.account[0].id,
                                            product:
                                                productapi.bestSellerProducts[index],
                                          )),
                                ),
                                accountId: widget.account[0].id,
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
        
      ],
    );
  }
}
