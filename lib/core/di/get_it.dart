import 'package:get_it/get_it.dart';
import 'package:spotify_app/features/login/domain/repo/auth_repo.dart';
import 'package:spotify_app/features/login/domain/usecases/sign_in_with_email_password_usecase.dart';
import 'package:spotify_app/features/login/domain/usecases/sign_up_with_email_and_password_usecase.dart';
import 'package:spotify_app/features/login/presentation/cubit/sign_in_cubit/sign_in_cubit.dart';
import '../../features/login/data/auth_repo_impl/auth_repo_impl.dart';
import '../../features/login/presentation/cubit/sign_up_cubit/sign_up_cubit.dart';

class ServiceLocator {
  static GetIt di = GetIt.instance;

  static void initGetIt() {
    //register auth Repo
    di.registerLazySingleton<AuthRepo>(() => AuthRepoImpl());

    //register SignUp UseCase
    di.registerLazySingleton<SignUpWithEmailAndPasswordUseCase>(
        () => SignUpWithEmailAndPasswordUseCase(authRepo: di<AuthRepo>()));

    //Register SignUP Cubit
    di.registerFactory(() => SignUpCubit(
        signUpWithEmailAndPasswordUseCase:
            di<SignUpWithEmailAndPasswordUseCase>()));

    //register SignIn UseCase
    di.registerLazySingleton<SignInWithEmailAndPasswordUseCase>(
        () => SignInWithEmailAndPasswordUseCase(authRepo: di<AuthRepo>()));

    //Register SignUp Cubit
    di.registerFactory(() => SignInCubit(
        signInWithEmailAndPasswordUseCase:
            di<SignInWithEmailAndPasswordUseCase>()));
  }
}
