import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify_app/core/errors/exceptions.dart';
import '../../../../core/consts/database_end_points.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/models.dart';

class AuthRepoImpl implements AuthRepo {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      var credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      var user = UserModel.fromFirebaseUser(credential.user!);
      return right(user);
    } on FirebaseAuthException catch (exception) {
      log('FirebaseAuthException in SignInWithEmailAndPassword: ${exception.code} : Code is : ${exception.message}');
      CustomException customException = _handleFirebaseAuthException(exception);
      return left(ServerFailure(customException.message));
    } catch (e) {
      log('Error on AuthRepoImpl signInWithEmailAndPassword: $e');

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      var credential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      var user = UserModel.fromFirebaseUser(credential.user!);

      await saveUserData(
        user: UserEntity(email: email, name: name, userID: user.userID),
      );
      return right(user);
    } on FirebaseAuthException catch (exception) {
      log('FirebaseAuthException in createUserWithEmailAndPassword: ${exception.code} : Code is : ${exception.message}');
      CustomException customException = _handleFirebaseAuthException(exception);
      return left(ServerFailure(customException.message));
    } catch (e) {
      log('Error on AuthRepoImpl createUserWithEmailAndPassword: $e');
      return left(ServerFailure(e.toString()));
    }
  }

  CustomException _handleFirebaseAuthException(
      FirebaseAuthException exception) {
    switch (exception.code) {
      case 'user-not-found':
        return CustomException(message: 'User with this email not found.');
      case 'weak-password':
        return CustomException(message: 'Password is too weak.');
      case 'email-already-in-use':
        return CustomException(message: 'this email is already in use.');
      case 'invalid-email':
        return CustomException(message: 'Invalid email.');
      case 'operation-not-allowed':
        return CustomException(
            message: 'Operation not allowed. Please try again later.');
      case 'network-request-failed':
        return CustomException(
            message: 'Please check your internet connection.');
      case 'user-disabled':
        return CustomException(message: 'User is disabled.');
      case 'wrong-password':
        return CustomException(
            message: 'Incorrect Email Or password. Please try again.');
      case 'invalid-credential':
        return CustomException(
            message: 'Incorrect Email Or password. Please try again.');
      default:
        return CustomException(message: 'An error occurred. Please try again.');
    }
  }

  @override
  Future<void> saveUserData({required UserEntity user}) async {
    fireStore.collection(userCollection).add(
          UserEntity.toMap(user: user),
        );
  }
}
