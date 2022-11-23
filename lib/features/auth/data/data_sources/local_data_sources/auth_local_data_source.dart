// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../../../../core/models/tokens_data.dart';
// import '../../../../../core/repository/disk_repo.dart';
// import '../../../../../core/repository/memory_repo.dart';
// import '../../models/responses/login_response_model.dart';
//
// abstract class AuthLocalDataSource {
//   Future<void> updateTokenData(LoginResponseDataModel? result);
// }
//
// class AuthLocalDataSourceImpl extends AuthLocalDataSource {
//   final SharedPreferences sharedPreferences;
//   AuthLocalDataSourceImpl({
//     required this.sharedPreferences,
//   });
//   @override
//   Future<void> updateTokenData(LoginResponseDataModel? result) async {
//     final tokensData = TokensData.fromLoginResponse(result);
//     MemoryRepo().updateTokensData(tokensData);
//     await DiskRepo().updateTokensData(tokensData);
//   }
// }
