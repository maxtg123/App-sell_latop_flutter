import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/constants.dart';
import 'package:flutter_application_7/models/InvoiceDetail.dart';
class DetailItem extends StatelessWidget {
  InvoiceDetail detail;
   DetailItem({
    Key? key,
    required this.detail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(children: [
        SizedBox(
          height: 5,
        ),
        Container(
          child: Row(children: [
            Expanded(
              child: Container(
                color: Colors.amberAccent,
                width: 200,
                height: 90,
                child: CachedNetworkImage(
                                imageUrl:  imageHost +detail.imageUrl,
                                fit: BoxFit.cover,
                                placeholder: (context , url ) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context , url , error) => Container(
                                  color: Colors.white,
                                ),
                              ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(right: 10 ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      constraints: BoxConstraints(maxWidth: 300),
                      child: Text(
                        detail.name,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        maxLines: 1,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Text(
                      "Số lượng: " + detail.quantity.toString(),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "Giá: " +detail.price.toString()+"đ",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.orange,
                      ),
                    ),
                    Text(
                      "Thành tiền: " +(detail.price*detail.quantity).toString()+"đ",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ]),
        ),
        SizedBox(
          height: 5,
        )
      ])
      );
  }
}