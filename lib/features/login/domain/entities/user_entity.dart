class UserEntity {
  final String? userID;
  final String? name;
  final String email;
  final String? password;

  UserEntity({this.userID, this.name, required this.email, this.password});

  factory UserEntity.fromFirebaseUser(UserEntity user) {
    return UserEntity(
      userID: user.userID,
      name: user.name ?? '',
      email: user.email,
    );
  }

  static Map<String, dynamic> toMap({required UserEntity user}) {
    return {
      'userID': user.userID,
      'name': user.name,
      'email': user.email,
    };
  }

}
