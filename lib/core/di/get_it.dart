import 'package:get_it/get_it.dart';
import 'package:spotify_app/features/login/domain/repo/auth_repo.dart';
import 'package:spotify_app/features/login/domain/usecases/sign_up_with_email_and_password_usecase.dart';
import '../../features/login/data/auth_repo_impl/auth_repo_impl.dart';
import '../../features/login/presentation/sign_up_cubit/sign_up_cubit.dart';

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
  }
}
