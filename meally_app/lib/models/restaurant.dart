class Restaurant {
  int restaurantId;
  String name;
  String address;
  String photo;
  Coordinate coordinate;

  Restaurant(
      {this.restaurantId,
      this.name,
      this.address,
      this.photo,
      this.coordinate});

  Restaurant.fromJson(Map<String, dynamic> json) {
    restaurantId = json['restaurantId'];
    name = json['name'];
    address = json['address'];
    photo = json['photo'];
    coordinate = json['coordinate'] != null
        ? new Coordinate.fromJson(json['coordinate'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['restaurantId'] = this.restaurantId;
    data['name'] = this.name;
    data['address'] = this.address;
    data['photo'] = this.photo;
    if (this.coordinate != null) {
      data['coordinate'] = this.coordinate.toJson();
    }
    return data;
  }
}

class Coordinate {
  double latitude;
  double longitude;

  Coordinate({this.latitude, this.longitude});

  Coordinate.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}
