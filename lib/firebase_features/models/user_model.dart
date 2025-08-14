class UserModel {
  final String name;
  final String password;
  final String id;
  UserModel({
    required this.name,
    required this.password,
    required this.id
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      password: map['description'] ?? '',
      id: map['id'] ?? ''
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'password': password,
      'id': id
    };
  }
}
