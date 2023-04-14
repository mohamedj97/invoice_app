import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:invoice_app/core/api/base_api_response.dart';
import '../../../../core/error/failure.dart';
import '../repositories/company_registration_repository.dart';

class UploadLogoUseCase {
  final CompanyRegistrationRepository companyRegistrationRepository;

  UploadLogoUseCase({
    required this.companyRegistrationRepository,
  });

  Future<Either<Failure, BoolResponse>> call(FormData  logo, {required int id}) async {
    return await companyRegistrationRepository.uploadLogo(logo, id: id);
  }
}
