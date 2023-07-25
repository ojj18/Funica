class SpecialOfferModel {
  String? discount;
  String? deals;
  String? desc;
  String? image;

  SpecialOfferModel({this.discount, this.deals, this.desc, this.image});
  SpecialOfferModel.fromJson(Map<String, dynamic> json) {
    discount = json['discount'];
    deals = json['deals'];
    desc = json['desc'];
    image = json['image'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['discount'] = discount;
    data['deals'] = deals;
    data['desc'] = desc;
    data['image'] = image;
    return data;
  }
}
