import 'package:ai_connect/features/user/data/models/user_model.dart';

class UserEntity {
  final String? id;
  final String? name;
  final String? email;
  final String? photoUrl;
  final String? phone;
  final DateTime? createdAt;
  final String? token;

  UserEntity({
    this.id,
    this.name,
    this.email,
    this.photoUrl,
    this.phone,
    this.createdAt,
    this.token,
  });

  get toModel => UserModel(
      id: id,
      name: name,
      email: email,
      photoUrl: photoUrl,
      phone: phone,
      createdAt: createdAt);
}
