import 'package:dartz/dartz.dart';
import 'package:spotify_app/core/errors/failure.dart';
import '../entities/user_entity.dart';
import '../repo/auth_repo.dart';

class SignUpWithEmailAndPasswordUseCase {
  final AuthRepo authRepo;

  SignUpWithEmailAndPasswordUseCase({required this.authRepo});

  Future<Either<Failure, UserEntity>> call({
    required String name,
    required String email,
    required String password,
  }) async {
    return await authRepo.signUpWithEmailAndPassword(
      name: name,
      email: email,
      password: password,
    );
  }
}
