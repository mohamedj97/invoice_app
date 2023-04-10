import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:invoice_app/core/api/base_api_response.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/requests/company_register_request_model.dart';
import '../../data/models/responses/get_company_lookups_response_model.dart';

abstract class CompanyRegistrationRepository {
  Future<Either<Failure, IntResponse>> registerCompany(
      {required CompanyRegisterRequestModel companyRegisterRequest, required int userId});

  Future<Either<Failure, GetCompanyLookupsResponse>> getCompanyLookups({required int userId});
  Future<Either<Failure, BoolResponse>> uploadLogo(File logo,{required int id});
}
