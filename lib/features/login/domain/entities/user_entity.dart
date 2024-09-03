class UserEntity {
  final String userID;
  final String? name;
  final String email;

  UserEntity({
    required this.userID,
    this.name,
    required this.email,
  });

  factory UserEntity.fromFirebaseUser(UserEntity user) {
    return UserEntity(
      userID: user.userID,
      name: user.name ?? '',
      email: user.email,
    );
  }
}
