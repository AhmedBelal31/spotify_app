import '../../domain/entities/user_entity.dart';

abstract class SignUpStates {}

final class SignUpInitialState extends SignUpStates {}

final class SignUpLoadingState extends SignUpStates {}

final class SignUpSuccessState extends SignUpStates {
  final UserEntity userEntity;

  SignUpSuccessState({required this.userEntity});
}

final class SignUpFailureState extends SignUpStates {
  final String message;

  SignUpFailureState({required this.message});
}
