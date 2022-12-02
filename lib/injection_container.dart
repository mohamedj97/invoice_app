import 'package:get_it/get_it.dart';
import 'package:invoice_app/features/customers/data/data_sources/customers_remote_data_source.dart';
import 'package:invoice_app/features/customers/data/repositories/customers_repository_impl.dart';
import 'package:invoice_app/features/customers/domain/repositories/customers_repository.dart';
import 'package:invoice_app/features/customers/domain/use_cases/get_Customers_use_case.dart';
import 'package:invoice_app/features/customers/presentation/cubit/get_customers/get_customers_cubit.dart';
import 'package:invoice_app/features/invoices/data/data_sources/invoices_remote_data_source.dart';
import 'package:invoice_app/features/invoices/data/repositories/invoices_repository_impl.dart';
import 'package:invoice_app/features/invoices/domain/repositories/invoices_repository.dart';
import 'package:invoice_app/features/invoices/domain/use_cases/get_invoices_use_case.dart';
import 'package:invoice_app/features/invoices/presentation/cubit/get_invoices/get_invoices_cubit.dart';
import 'package:invoice_app/features/products/presentation/cubit/get_products_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/api/api_repo.dart';
import 'features/auth/data/data_sources/local_data_sources/auth_local_data_source.dart';
import 'features/auth/data/data_sources/remote_data_sources/auth_remote_data_source.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/domain/use_cases/login_usecase.dart';
import 'features/auth/presentation/cubit/login/login_cubit.dart';
import 'features/products/data/data_sources/products_remote_data_source.dart';
import 'features/products/data/repositories/products_repository_impl.dart';
import 'features/products/domain/repositories/products_repositories.dart';
import 'features/products/domain/use_cases/get_products_use_case.dart';

final sl = GetIt.instance;

Future<void> init() async {
//! Features - posts

// Bloc

  sl.registerLazySingleton(() => LoginCubit(sl(),sl()));
  sl.registerLazySingleton(() => GetInvoicesCubit(sl()));
  sl.registerLazySingleton(() => GetCustomersCubit(sl()));
  sl.registerLazySingleton(() => GetProductsCubit(sl()));
  //

//   sl.registerFactory(() => CreateUpdateDeletePostCubit(
//         createPostUseCase: sl(),
//         updatePostUseCase: sl(),
//         deletePostUseCase: sl(),
//       ));

// Usecases
//
  sl.registerLazySingleton(() => LoginUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => GetInvoicesUseCase(invoicesRepository: sl()));
  sl.registerLazySingleton(() => GetCustomersUseCase(customersRepository: sl()));
  sl.registerLazySingleton(() => GetProductsUseCase(productsRepository: sl()));
//   sl.registerLazySingleton(() => DeletePostUseCase(sl()));
//   sl.registerLazySingleton(() => UpdatePostUseCase(sl()));

// Repository

  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton<InvoicesRepository>(() => InvoicesRepositoryImpl(sl()));
  sl.registerLazySingleton<CustomersRepository>(() => CustomersRepositoryImpl(sl()));
  sl.registerLazySingleton<ProductsRepository>(() => ProductsRepositoryImpl(sl()));

// Datasources

  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(apiRepo: sl()));
  sl.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(sharedPreferences: sl()));


  sl.registerLazySingleton<InvoicesRemoteDataSource>(
          () => InvoicesRemoteDataSourceImpl(apiRepo: sl()));

  sl.registerLazySingleton<CustomersRemoteDataSource>(
          () => CustomersRemoteDataSourceImpl(apiRepo: sl()));

  sl.registerLazySingleton<ProductsRemoteDataSource>(
          () => ProductsRemoteDataSourceImpl(apiRepo: sl()));

//! Core

//   sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

//! External

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => APIRepository.internal());
//   sl.registerLazySingleton(() => InternetConnectionChecker());
}
