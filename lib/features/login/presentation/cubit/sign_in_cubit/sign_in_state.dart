import '../../../domain/entities/user_entity.dart';

class SignInStates {}

final class SignInInitial extends SignInStates {}

final class SignInLoadingState extends SignInStates {}

final class SignInSuccessState extends SignInStates {
  final UserEntity userEntity;

  SignInSuccessState({required this.userEntity});
}

final class SignInFailureState extends SignInStates {
  final String message;

  SignInFailureState({required this.message});

}
