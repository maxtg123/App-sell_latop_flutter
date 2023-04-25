class InvoiceDetail{
  int invoiceId, quantity , price  , productId; 
  String name , imageUrl , date;
 
  InvoiceDetail(
      {
     required this.invoiceId ,
   
     required this.quantity,
     required this.price,
     required this.productId,
     required this.name,
     required this.imageUrl,
     required this.date,
     
     });

  InvoiceDetail.fromJson(Map<String, dynamic> json) : 
    invoiceId = json['invoiceId'],
     quantity = json['quantity'],                                          
    price = json['price'],
    name = json['name'],
    imageUrl = json['imageUrl'],
    date = json['date'],
   
    productId = json['productId'];

    
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['invoiceId'] = this.invoiceId;
    
    data['quantity'] = this.quantity;
    data['productId'] = this.productId;
    data['name'] = this.name;
    data['date'] = this.date;
    
    data['imageUrl'] = this.imageUrl;

    return data;
  }
}