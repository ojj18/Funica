class FunctionModel {
  String? icon;
  String? label;

  FunctionModel({
    this.icon,
    this.label,
  });

  FunctionModel.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    label = json['label'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['icon'] = icon;
    data['label'] = label;

    return data;
  }
}
