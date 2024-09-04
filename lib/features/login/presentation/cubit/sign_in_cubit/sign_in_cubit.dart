import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/features/login/domain/usecases/sign_in_with_email_password_usecase.dart';
import 'package:spotify_app/features/login/presentation/cubit/sign_in_cubit/sign_in_state.dart';


class SignInCubit extends Cubit<SignInStates> {
  final SignInWithEmailAndPasswordUseCase signInWithEmailAndPasswordUseCase;

  SignInCubit({required this.signInWithEmailAndPasswordUseCase})
      : super(SignInInitial());

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    emit(SignInLoadingState());
    final eitherFailureOrUserEntity = await signInWithEmailAndPasswordUseCase
        .call(email: email, password: password);
    eitherFailureOrUserEntity.fold((failure) {
      emit(SignInFailureState(message: failure.message));
    }, (user) {
      emit(SignInSuccessState(userEntity: user));
    });
  }
}
