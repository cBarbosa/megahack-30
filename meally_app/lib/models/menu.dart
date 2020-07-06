class Menu {
  int mealId;
  String name;
  String code;
  String description;
  double price;
  String photo;

  Menu(
      {this.mealId,
      this.name,
      this.code,
      this.description,
      this.price,
      this.photo});

  Menu.fromJson(Map<String, dynamic> json) {
    mealId = json['mealId'];
    name = json['name'];
    code = json['code'];
    description = json['description'];
    price = json['price'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mealId'] = this.mealId;
    data['name'] = this.name;
    data['code'] = this.code;
    data['description'] = this.description;
    data['price'] = this.price;
    data['photo'] = this.photo;
    return data;
  }
}
