import 'package:get_it/get_it.dart';
import 'package:invoice_app/features/auth/domain/use_cases/register_usecase.dart';
import 'package:invoice_app/features/auth/domain/use_cases/validate_code_usecase.dart';
import 'package:invoice_app/features/auth/presentation/cubit/register/register_cubit.dart';
import 'package:invoice_app/features/customers/data/data_sources/customers_remote_data_source.dart';
import 'package:invoice_app/features/customers/data/repositories/customers_repository_impl.dart';
import 'package:invoice_app/features/customers/domain/repositories/customers_repository.dart';
import 'package:invoice_app/features/customers/domain/use_cases/add_customer_use_case.dart';
import 'package:invoice_app/features/customers/domain/use_cases/edit_customer_use_case.dart';
import 'package:invoice_app/features/customers/presentation/cubit/add_customer/add_edit_customer_cubit.dart';
import 'package:invoice_app/features/customers/presentation/cubit/get_customers/get_customers_cubit.dart';
import 'package:invoice_app/features/invoices/data/data_sources/invoices_remote_data_source.dart';
import 'package:invoice_app/features/invoices/data/repositories/invoices_repository_impl.dart';
import 'package:invoice_app/features/invoices/domain/repositories/invoices_repository.dart';
import 'package:invoice_app/features/invoices/domain/use_cases/add_invoice_use_case.dart';
import 'package:invoice_app/features/invoices/domain/use_cases/edit_single_invoice_use_case.dart';
import 'package:invoice_app/features/invoices/domain/use_cases/get_invoice_types_use_case.dart';
import 'package:invoice_app/features/invoices/domain/use_cases/get_invoices_use_case.dart';
import 'package:invoice_app/features/invoices/domain/use_cases/get_single_invoice_use_case.dart';
import 'package:invoice_app/features/invoices/presentation/cubit/add_invoice/add_invoice_cubit.dart';
import 'package:invoice_app/features/invoices/presentation/cubit/get_invoices/get_invoices_cubit.dart';
import 'package:invoice_app/features/products/domain/use_cases/add_product_usecase.dart';
import 'package:invoice_app/features/products/domain/use_cases/edit_product_use_case.dart';
import 'package:invoice_app/features/products/domain/use_cases/get_types_use_case.dart';
import 'package:invoice_app/features/products/presentation/cubit/add_edit_product_cubit.dart';
import 'package:invoice_app/features/products/presentation/cubit/get_item_types_cubit.dart';
import 'package:invoice_app/features/products/presentation/cubit/get_products_cubit.dart';
import 'package:invoice_app/features/profile/domain/repositories/profile_repository.dart';
import 'package:invoice_app/features/profile/domain/use_cases/change_password_usecase.dart';
import 'package:invoice_app/features/profile/domain/use_cases/get_profile_use_case.dart';
import 'package:invoice_app/features/profile/presentation/cubit/change_paswword_cubit.dart';
import 'package:invoice_app/features/profile/presentation/cubit/get_profile_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/api/api_repo.dart';
import 'features/auth/data/data_sources/local_data_sources/auth_local_data_source.dart';
import 'features/auth/data/data_sources/remote_data_sources/auth_remote_data_source.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/domain/use_cases/login_usecase.dart';
import 'features/auth/domain/use_cases/resend_code_usecase.dart';
import 'features/auth/presentation/cubit/login/login_cubit.dart';
import 'features/auth/presentation/cubit/validate_code/validate_code_cubit.dart';
import 'features/company_registration/data/data_sources/remote_data_source/company_registration_remote_data_source.dart';
import 'features/company_registration/data/repositories/comapny_registration_repository_impl.dart';
import 'features/company_registration/domain/repositories/company_registration_repository.dart';
import 'features/company_registration/domain/use_cases/get_company_lookups_usecase.dart';
import 'features/company_registration/domain/use_cases/register_company_usecase.dart';
import 'features/company_registration/presentation/cubit/company_register_cubit.dart';
import 'features/customers/domain/use_cases/get_customer_types_use_case.dart';
import 'features/customers/domain/use_cases/get_customers_use_case.dart';
import 'features/customers/presentation/cubit/get_customer_types/get_customer_types_cubit.dart';
import 'features/invoices/presentation/cubit/get_types/get_invoice_types_cubit.dart';
import 'features/products/data/data_sources/products_remote_data_source.dart';
import 'features/products/data/repositories/products_repository_impl.dart';
import 'features/products/domain/repositories/products_repositories.dart';
import 'features/products/domain/use_cases/get_products_use_case.dart';
import 'features/profile/data/data_sources/profile_remote_data_source.dart';
import 'features/profile/data/repositories/profile_repository_impl.dart';
import 'features/statistics/data/data_sources/submitted_invoices_remote_data_sources.dart';
import 'features/statistics/data/repositories/submitted_invoices_repository_impl.dart';
import 'features/statistics/domain/repositories/submited_invoices_repository.dart';
import 'features/statistics/domain/use_cases/get_recieved_invoices_use_case.dart';
import 'features/statistics/domain/use_cases/get_submitted_invoices_use_case.dart';
import 'features/statistics/presentation/cubit/get_submitted_invoices_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
//! Features - posts

// Bloc

  sl.registerLazySingleton(() => LoginCubit(sl(), sl()));
  sl.registerLazySingleton(() => CompanyRegisterCubit(sl(),sl()));
  sl.registerLazySingleton(() => ValidateCodeCubit(sl(), sl()));
  sl.registerLazySingleton(() => RegisterCubit(sl(), sl()));
  sl.registerLazySingleton(() => GetInvoicesCubit(sl(), sl()));
  sl.registerLazySingleton(() => GetInvoiceTypesCubit(sl()));
  sl.registerLazySingleton(() => AddInvoiceCubit(sl(), sl()));
  sl.registerLazySingleton(() => GetCustomersCubit(sl()));
  sl.registerLazySingleton(() => AddEditCustomerCubit(sl(), sl()));
  sl.registerLazySingleton(() => GetCustomerTypesCubit(sl()));
  sl.registerLazySingleton(() => GetProductsCubit(sl()));
  sl.registerLazySingleton(() => GetProfileCubit(sl()));
  sl.registerLazySingleton(() => ChangePasswordCubit(sl()));
  sl.registerLazySingleton(() => AddEditProductCubit(sl(), sl()));
  sl.registerLazySingleton(() => GetItemTypesCubit(sl()));
  sl.registerLazySingleton(() => GetSubmittedInvoicesCubit(sl(), sl()));
  //

//   sl.registerFactory(() => CreateUpdateDeletePostCubit(
//         createPostUseCase: sl(),
//         updatePostUseCase: sl(),
//         deletePostUseCase: sl(),
//       ));

// Usecases
//
  sl.registerLazySingleton(() => LoginUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => RegisterUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => ValidateCodeUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => ResendCodeUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => GetInvoicesUseCase(invoicesRepository: sl()));
  sl.registerLazySingleton(() => EditSingleInvoiceUseCase(invoicesRepository: sl()));
  sl.registerLazySingleton(() => GetSingleInvoiceUseCase(invoicesRepository: sl()));
  sl.registerLazySingleton(() => GetInvoiceTypesUseCase(invoicesRepository: sl()));
  sl.registerLazySingleton(() => AddInvoiceUseCase(invoicesRepository: sl()));
  sl.registerLazySingleton(() => GetCustomersUseCase(customersRepository: sl()));
  sl.registerLazySingleton(() => GetProductsUseCase(productsRepository: sl()));
  sl.registerLazySingleton(() => AddProductUseCase(productsRepository: sl()));
  sl.registerLazySingleton(() => EditProductUseCase(productsRepository: sl()));
  sl.registerLazySingleton(() => AddCustomerUseCase(customersRepository: sl()));
  sl.registerLazySingleton(() => GetCustomerTypesUseCase(customersRepository: sl()));
  sl.registerLazySingleton(() => EditCustomerUseCase(customersRepository: sl()));
  sl.registerLazySingleton(() => GetItemTypesUseCase(productsRepository: sl()));
  sl.registerLazySingleton(() => GetProfileUseCase(profileRepository: sl()));
  sl.registerLazySingleton(() => ChangePasswordUseCase(profileRepository: sl()));
  sl.registerLazySingleton(() => GetReceivedInvoiceUseCase(submittedInvoicesRepository: sl()));
  sl.registerLazySingleton(() => GetSubmittedInvoiceUseCase(submittedInvoicesRepository: sl()));
  sl.registerLazySingleton(() => RegisterCompanyUseCase(companyRegistrationRepository: sl()));
  sl.registerLazySingleton(() => GetCompanyLookupsUseCase(companyRegistrationRepository: sl()));

// Repository

  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton<CompanyRegistrationRepository>(() => CompanyRegistrationRepositoryImpl(sl()));
  sl.registerLazySingleton<InvoicesRepository>(() => InvoicesRepositoryImpl(sl()));
  sl.registerLazySingleton<CustomersRepository>(() => CustomersRepositoryImpl(sl()));
  sl.registerLazySingleton<ProductsRepository>(() => ProductsRepositoryImpl(sl()));
  sl.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl(sl()));
  sl.registerLazySingleton<SubmittedInvoicesRepository>(() => SubmittedInvoicesRepositoryImpl(sl()));

// Datasources

  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(apiRepo: sl()));
  sl.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSourceImpl(sharedPreferences: sl()));

  sl.registerLazySingleton<InvoicesRemoteDataSource>(() => InvoicesRemoteDataSourceImpl(apiRepo: sl()));

  sl.registerLazySingleton<CompanyRegistrationRemoteDataSource>(
      () => CompanyRegistrationRemoteDataSourceImpl(apiRepo: sl()));

  sl.registerLazySingleton<CustomersRemoteDataSource>(() => CustomersRemoteDataSourceImpl(apiRepo: sl()));

  sl.registerLazySingleton<ProductsRemoteDataSource>(() => ProductsRemoteDataSourceImpl(apiRepo: sl()));

  sl.registerLazySingleton<ProfileRemoteDataSource>(() => ProfileRemoteDataSourceImpl(apiRepo: sl()));

  sl.registerLazySingleton<SubmittedInvoicesRemoteDataSource>(
      () => SubmittedInvoicesRemoteDataSourceImpl(apiRepo: sl()));

//! Core

//   sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

//! External

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => APIRepository.internal());
//   sl.registerLazySingleton(() => InternetConnectionChecker());
}
