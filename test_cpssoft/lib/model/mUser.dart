class User {
  String? name;
  String? address;
  String? email;
  String? phoneNumber;
  String? city;
  String? id;
  String? error;
  User(
      {this.name = "",
      this.address = "",
      this.id = "",
      this.city = "",
      this.email = "",
      this.phoneNumber = "",
      this.error = ""});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      address: json['address'],
      id: json['id'],
      name: json['name'],
      city: json['city'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    // data['id'] = this.id;
    data['name'] = this.name;
    data['city'] = this.city;
    data['phoneNumber'] = this.phoneNumber;
    data['email'] = this.email;
    return data;
  }

  User.withError(String errorMessage) {
    error = errorMessage;
  }
}
