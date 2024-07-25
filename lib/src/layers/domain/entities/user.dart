class User {
  String? id;
  String? token;
  String name;
  String email;
  int phone;
  int cpf;
  String? password;

  User({
    required this.name,
    required this.email,
    required this.phone,
    required this.cpf,
    required this.password,
    this.id,
    this.token,
  });

  User.empty()
      : name = '',
        email = '',
        phone = 0,
        cpf = 0;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'objectId': id,
      'name': name,
      'username': email,
      'email': email,
      'phone': phone,
      'cpf': cpf,
      'password': password,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        id: map['objectId'],
        name: map['name'],
        email: map['email'],
        phone: map['phone'],
        cpf: map['cpf'],
        password: map['password'],
        token: map['sessionToken']);
  }
}
