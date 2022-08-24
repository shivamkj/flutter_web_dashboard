class UserAuth {
  String email;
  String password;

  UserAuth({
    required this.email,
    required this.password,
  });

  UserAuth.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        password = json['password'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}

class UserDetails extends UserAuth {
  UserDetails({
    required this.name,
    required super.email,
    required super.password,
    required this.city,
  });

  String name;
  String city;

  UserDetails.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        city = json['city'],
        super(email: json['email'], password: json['password']);

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['city'] = city;
    return data;
  }
}
