class AppUser {
  String? id;
  String? email;
  String? password;
  String? name;
  // String? imageUrl;
  String? phone;

  AppUser({this.email, this.name, this.id, this.password,  this.phone});

  AppUser.fromJson(Map<String, dynamic>? json, id) {
    id = this.id;
    email = json!['email'];
    name = json['name'];
    // imageUrl = json['imageUrl'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['name'] = this.name;
    // data['imageUrl'] = this.imageUrl;
    data['phone'] = this.phone;
    return data;
  }
}
