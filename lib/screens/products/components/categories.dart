import 'package:flutter/material.dart';
import 'package:flutter_application_7/models/Account.dart';
import 'package:flutter_application_7/models/Product.dart';

import '../../../constants.dart';
import '../products_screen.dart';
class Categories extends StatefulWidget {
  final int selected;
  final List<Account> account;
  final List<Product> product;
  const Categories(
      {Key? key,
      required this.selected,
      required this.account,
      required this.product})
      : super(key: key);
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ["Tất cả", "Iphone", "Samsung", "Xiaomi", "Oppo"];

  @override
  Widget build(BuildContext context) {
    int selectedIndex = widget.selected;
    return Container(
      height: 30,
      width: 100.0  *categories.length ,
      child: Padding(
        padding: const EdgeInsets.only(left: 28),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategories(
              index, selectedIndex, context, widget.account, widget.product),
        ),
      ),
    );
  }

  Widget buildCategories(int index, int selectedIndex, BuildContext context,
      var account, var product) {
    return Container(
     
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
          var categories = "";
          if (index == 0) {
            categories = "Tất cả";
          } else if (index == 1) {
            categories = "Iphone";
          } else if (index == 2) {
            categories = "Samsung";
          } else if (index == 3) {
            categories = "Xiaomi";
          } else if (index == 4) {
            categories = "Oppo";
          }
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ProductsScreen(
                      providerId: index,
                      Categories: categories,
                      selected: selectedIndex,
                      account: account,
                      product: product,
                    )),
          );
        },
        child: Container(
          width: 70,
          height: 50,
          decoration: BoxDecoration(
              color: selectedIndex == index ? Colors.amberAccent : kBackgroundColor,
              border: Border.all(color:Colors.white , width:1  ),
              ),
          alignment: Alignment.center,
          child: Text(
            categories[index],
            style: TextStyle(
              color: selectedIndex == index ? Colors.black : Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
   
}
