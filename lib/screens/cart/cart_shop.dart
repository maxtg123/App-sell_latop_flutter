import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/api/cart.dart';
import 'package:flutter_application_7/constants.dart';
import 'package:flutter_application_7/models/Account.dart';
import 'package:flutter_application_7/models/Cart.dart';
import 'package:flutter_application_7/screens/pay/pay_screen.dart';
import 'package:provider/provider.dart';

class CartShop extends StatefulWidget {
 final List<Account> accounts;
  final List<Cart> carts;
  const CartShop({Key? key,required this.carts,required this.accounts}) : super(key: key);
  @override
  _CartShopState createState() => _CartShopState();
}

class _CartShopState extends State<CartShop> {
  bool Ncc = false;
  @override
  Widget build(BuildContext context) {
    int subtotal = 0;
    Map<String, String> data = {
      '_accountId': widget.accounts[0].id.toString(),
    };
    var Cartapi = Provider.of<Cartaccount>(context, listen: false);

    
    
   
    for (var item in widget.carts) {
      subtotal = subtotal + (item.price * item.quantity);
    }
   
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Giỏ hàng của tôi ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: kTextColor,
              fontSize: 20,
            ),
          ),
        ),
        backgroundColor: kBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: kTextColor,
            size: 20.0,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: FutureBuilder(
          future: Cartapi.GetListCart(data),
          builder: (context, AsyncSnapshot snapshot) {
            return ListView.builder(
              itemCount: widget.carts.length,
              itemBuilder: (context, index) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPaddin / 4),
                child: CartItem(
                  carts: widget.carts,
                  cart:widget.carts[index],
                  account: widget.accounts,
                ),
              ),
            );
          }),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: Row(
          children: [
        
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Text("Tổng cộng:",style: TextStyle(color: kTextColor , fontSize: 18),),
                        SizedBox(
                          width: 10,
                        ),
                        Text(subtotal.toString() + "đ", style: TextStyle(color: Colors.redAccent , fontSize: 14 ),),
                      ],
                    ),
                   
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: ()async {
                 
                       Map<String, String> data2 = {
                       '_accountId': widget.accounts[0].id.toString(),
                         };
                      Cartapi.GetListCart(data2);
                      List<Cart> cartAPI =await Cartapi.GetListCart(data2);
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PayScreen(
                          account: widget.accounts,
                          carts:cartAPI ,
                          subtotal: subtotal),
                          ),
                );
                },
                child: Text("Thanh toán"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItem extends StatefulWidget {
  const CartItem({
    Key? key,
    required this.cart,
    required this.account,
    required this.carts,
    
  }) : super(key: key);
  final List<Cart> carts;
  final Cart cart;
  final List<Account> account;
  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  bool Ncc = false;
  int count = 0;
  int check = 0;
  
  @override
  void initState() {
    super.initState();
    count = widget.cart.quantity;
    
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.lightGreen, width: 1),
          color: kBackgroundColor,
        ),
        width: 400,
        height: 87,
        child: Row(
          children: <Widget>[
            Container(
              width: 100,
              child: CachedNetworkImage(
                imageUrl: imageHost + widget.cart.imageUrl,
                fit: BoxFit.fill,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => Container(
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    widget.cart.name,
                    style: TextStyle(
                      fontSize: 15,
                      color: kTextColor,
                    ),
                  ),
                  Text(
                    "Giá: " + widget.cart.price.toString()+ "đ",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(255, 0, 0, 0.7),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () async {
                            setState(() {
                              count = count - 1;
                              
                              print(count);
                              
                            });
                            Map<String, String> data = {
                              '_accountId': widget.account[0].id.toString(),
                              '_productId': widget.cart.productId.toString(),
                            };
                            var checkTru = Cartaccount.Updategiamsanpham(data);
                          },
                          icon: const Icon(
                            Icons.remove,
                            size: 15,
                          )),
                      Text(
                        "$count",
                        style: TextStyle(fontSize: 15),
                      ),
                      IconButton(
                          onPressed: () async {
                            setState(() {
                              count++;
                            });
                            Map<String, String> data = {
                              '_accountId': widget.account[0].id.toString(),
                              '_productId': widget.cart.productId.toString(),
                            };
                            var checkCong = Cartaccount.Updatesanpham(data);
                            
                          },
                          icon: const Icon(Icons.add, size: 15)),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: IconButton(
                  onPressed: () async {
                    Map<String, String> data = {
                      '_accountId': widget.account[0].id.toString(),
                      '_productId': widget.cart.productId.toString(),
                    };
                    var checkDelete = await Cartaccount.deletesanpham(data);
                    if (checkDelete = true) {
                      var Cartapi =
                          Provider.of<Cartaccount>(context, listen: false);
                       Map<String, String> data2 = {
                       '_accountId': widget.account[0].id.toString(),
                         };
                      Cartapi.GetListCart(data2);
                      List<Cart> CartAPI =await Cartapi.GetListCart(data2);
                       Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                         CartShop(carts: CartAPI, accounts: widget.account,)));
                  }
                  },
                  icon: const Icon(Icons.delete),
                  iconSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
