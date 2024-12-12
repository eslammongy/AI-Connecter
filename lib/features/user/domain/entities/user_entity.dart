import 'package:ai_connect/features/user/data/models/user_model.dart';

class UserEntity {
  String? id;
  String? name;
  String? email;
  String? photoUrl;
  String? phone;
  DateTime? createdAt;
  String? token;

  UserEntity({
    this.id,
    this.name,
    this.email,
    this.photoUrl,
    this.phone,
    this.createdAt,
    this.token,
  });

  UserModel get toModel => UserModel(
      id: id,
      name: name,
      email: email,
      photoUrl: photoUrl,
      phone: phone,
      createdAt: createdAt);
}
