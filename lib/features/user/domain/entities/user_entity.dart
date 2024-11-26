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
}
