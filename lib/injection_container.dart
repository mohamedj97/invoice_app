import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/api/api_repo.dart';
import 'features/auth/data/data_sources/remote_data_sources/auth_remote_data_source.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/domain/use_cases/login_usecase.dart';
import 'features/auth/presentation/cubit/login/login_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
//! Features - posts

// Bloc

  sl.registerLazySingleton(() => LoginCubit(sl()));
  //

//   sl.registerFactory(() => CreateUpdateDeletePostCubit(
//         createPostUseCase: sl(),
//         updatePostUseCase: sl(),
//         deletePostUseCase: sl(),
//       ));

// Usecases
//
  sl.registerLazySingleton(() => LoginUseCase(authRepository: sl()));
//   sl.registerLazySingleton(() => DeletePostUseCase(sl()));
//   sl.registerLazySingleton(() => UpdatePostUseCase(sl()));

// Repository

  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

// Datasources

  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(apiRepo: sl()));
  // sl.registerLazySingleton<AuthLocalDataSource>(
  //     () => AuthLocalDataSourceImpl(sharedPreferences: sl()));

//! Core

//   sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

//! External

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => APIRepository.internal());
//   sl.registerLazySingleton(() => InternetConnectionChecker());
}
