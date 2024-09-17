import 'package:get_it/get_it.dart';
import 'package:spotify_app/features/home_page/data/repos_impl/get_play_list_repo_impl.dart';
import 'package:spotify_app/features/home_page/domain/repo/get_play_list_repo.dart';
import 'package:spotify_app/features/home_page/domain/usecases/get_songs_use_case.dart';
import 'package:spotify_app/features/login/domain/repo/auth_repo.dart';
import 'package:spotify_app/features/login/domain/usecases/sign_in_with_email_password_usecase.dart';
import 'package:spotify_app/features/login/domain/usecases/sign_up_with_email_and_password_usecase.dart';
import 'package:spotify_app/features/login/presentation/cubit/sign_in_cubit/sign_in_cubit.dart';
import '../../features/home_page/data/repos_impl/get_songs_repo_impl.dart';
import '../../features/home_page/domain/repo/get_songs_repo.dart';
import '../../features/home_page/domain/usecases/get_play_list_use_case.dart';
import '../../features/home_page/presentation/cubit/home_cubit/home_cubit.dart';
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

    //Register GetSongs Repo
    di.registerLazySingleton<GetSongsRepo>(() => GetSongsRepoImpl());

    //Register GetSongs UseCase
    di.registerLazySingleton<GetSongsUseCase>(
        () => GetSongsUseCase(getSongsRepo: di<GetSongsRepo>()));

    //Register GetPlayList Repo
    di.registerLazySingleton<GetPlayListRepo>(() => GetPlayListRepoImpl());

    //Register GetPlayList UseCase
    di.registerLazySingleton<GetPlayListUseCase>(
        () => GetPlayListUseCase(getPlayListRepo: di<GetPlayListRepo>()));

    //Register Home Cubit
    di.registerFactory<HomeCubit>(
      () => HomeCubit(
        getSongsUseCase: di<GetSongsUseCase>(),
        getPlayListUseCase: di<GetPlayListUseCase>(),
      ),
    );
  }
}
