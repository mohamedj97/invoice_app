import 'package:invoice_app/features/profile/domain/entities/user_company.dart';
import 'company_role.dart';

class UserInfoData {
  late int userId;
  String? loginId;
  String? userName;
  String? email;
  late List<UserCompany> companies = [];
  late List<CompanyRole> roles = [];

  UserInfoData({
    required this.userId,
    this.loginId,
    this.userName,
    this.email,
    required this.companies,
    required this.roles,
  });

  @override
  List<Object?> get props => [
        userId,
        loginId,
        userName,
        email,
        companies,
        roles,
      ];
}
