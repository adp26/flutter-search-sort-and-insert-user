class City {
  String? name;

  String? id;
  String? error;
  City({this.name = "", this.id = "", this.error = ""});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['name'] = this.name;

    return data;
  }

  City.withError(String errorMessage) {
    error = errorMessage;
  }
}
