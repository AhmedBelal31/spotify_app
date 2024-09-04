import 'package:dartz/dartz.dart';
import 'package:spotify_app/core/errors/failure.dart';
import 'package:spotify_app/features/login/domain/repo/auth_repo.dart';
import '../entities/user_entity.dart';

class SignInWithEmailAndPasswordUseCase {
  AuthRepo authRepo;

  SignInWithEmailAndPasswordUseCase({required this.authRepo});

  Future<Either<Failure, UserEntity>> call(
      {required String email, required String password}) async {
    return await authRepo.signInWithEmailAndPassword(
        email: email, password: password);
  }
}
