class TableModel {
  int? id;
  String? image;
  String? name;
  String? star;
  String? sold;
  String? price;

  TableModel({
    this.id,
    this.image,
    this.name,
    this.star,
    this.sold,
    this.price,
  });

  TableModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    star = json['star'];
    sold = json['sold'];
    price = json['price'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['image'] = image;
    data['name'] = name;
    data['star'] = star;
    data['sold'] = sold;
    data['price'] = price;
    return data;
  }
}
