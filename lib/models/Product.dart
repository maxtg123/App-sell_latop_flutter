class Product {
  int? id;
  late String name;
  late String description;
  int? price;
  int? quantity;
  int? status;
  late String screen;
  late String ram;
  late String rom;
  late String pin;
  late String imageUrl;
  int? providerId;

  Product(
      {this.id,
      required this.name,
      required this.description,
      this.price,
      this.quantity,
      this.status,
      required this.screen,
      required this.ram,
      required this.rom,
      required this.pin,
      required this.imageUrl,
      this.providerId});

  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        price = json['price'],
        quantity = json['quantity'],
        status = json['status'],
        screen = json['screen'],
        ram = json['ram'],
        rom = json['rom'],
        pin = json['pin'],
        imageUrl = json['imageUrl'],
        providerId = json['providerId'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['status'] = this.status;
    data['screen'] = this.screen;
    data['ram'] = this.ram;
    data['rom'] = this.rom;
    data['pin'] = this.pin;
    data['imageUrl'] = this.imageUrl;
    data['providerId'] = this.providerId;
    return data;
  }
}
