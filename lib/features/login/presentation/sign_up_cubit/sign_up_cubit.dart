import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/features/login/domain/entities/user_entity.dart';
import 'package:spotify_app/features/login/domain/usecases/sign_up_with_email_and_password_usecase.dart';
import 'package:spotify_app/features/login/presentation/sign_up_cubit/sign_up_states.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  final SignUpWithEmailAndPasswordUseCase signUpWithEmailAndPasswordUseCase;

  SignUpCubit({required this.signUpWithEmailAndPasswordUseCase})
      : super(SignUpInitialState());

  Future<void> signUpWithEmailAndPassword({required UserEntity user}) async {
    emit(SignUpLoadingState());
    final eitherFailureOrUserEntity = await signUpWithEmailAndPasswordUseCase
        .call(name: user.name!, email: user.email, password: user.password!);
    eitherFailureOrUserEntity.fold((failure) {
      emit(SignUpFailureState(message: failure.message));
    }, (user) {
      emit(SignUpSuccessState(userEntity: user));
    });
  }
}
