class User {
  int? id;
  String name;
  String email;
  String password;

  User(this.name, this.email, this.password, {this.id});

  User.fromJson(Map<String, dynamic> json) :
      id = json['id'],
      name = json['name'],
      email = json['email'],
      password = json['password'];

}