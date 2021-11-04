
class Order {
  late final String id;
  late final bool isActive;
  late final String price;
  late final String company;
  late final String picture;
  late final String buyer;
  late final List<String> tags;
  late final String status;
  late final String registered;

  Order({
    required this.id,
    required this.isActive,
    required this.price,
    required this.company,
    required this.picture,
    required this.buyer,
    required this.tags,
    required this.status,
    required this.registered,
  });

  static Order empty = Order(
    id: "",
    isActive: false,
    price: "0.0",
    company: "",
    picture: "",
    buyer: "",
    tags: [],
    status: "",
    registered: "",
  );

  Order copyWith({id, isActive, price, company, picture, buyer, tags, status, registered}) => Order(
        id: id ?? this.id,
        isActive: isActive ?? this.isActive,
        price: price ?? this.price,
        company: company ?? this.company,
        picture: picture ?? this.picture,
        buyer: buyer ?? this.buyer,
        tags: tags ?? this.tags,
        status: status ?? this.status,
        registered: registered ?? this.registered,
      );

  Order.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    isActive = json["isActive"];
    price = json["price"].toString().replaceFirst("\$", "").replaceAll(",", "");
    company = json["company"];
    picture = json["picture"];
    buyer = json["buyer"];
    tags = json["tags"]?.cast<String>();
    status = json["status"];
    registered = json["registered"];
  }
}
