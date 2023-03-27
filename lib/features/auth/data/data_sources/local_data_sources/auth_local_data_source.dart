import 'package:invoice_app/features/auth/data/models/responses/register_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/api/models/tokens_data.dart';
import '../../../../../core/api/repository/disk_repo.dart';
import '../../../../../core/api/repository/memory_repo.dart';
import '../../models/responses/login_response_model.dart';

abstract class AuthLocalDataSource {
  Future<void> updateTokenData(LoginResponse? result);
  Future<void> updateUserIdAndValidateTimeAndEmail(RegisterResponse? result);
}

class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  final SharedPreferences sharedPreferences;
  AuthLocalDataSourceImpl({
    required this.sharedPreferences,
  });
  @override
  Future<void> updateTokenData(LoginResponse? result) async {
    final tokensData = TokensData.fromLoginResponse(result!);
    MemoryRepo().updateTokensData(tokensData);
    await DiskRepo().updateTokensData(tokensData);
  }

  @override
  Future<void> updateUserIdAndValidateTimeAndEmail(RegisterResponse? result) async {

    await DiskRepo().updateUserId(result!.result!.userId);
    await DiskRepo().updateValidateTime(result.result!.securityCodeValideTime);
    await DiskRepo().updateEmail(result.result!.email);
  }
}
