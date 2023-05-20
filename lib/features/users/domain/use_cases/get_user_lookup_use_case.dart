import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/responses/get_user_lookup_response_model.dart';
import '../repositories/users_repositories.dart';

class GeUserLookupUseCase {
  final UsersRepository usersRepository;
  GeUserLookupUseCase({
    required this.usersRepository,
  });

  Future<Either<Failure, GetUserLookupResponse>> call({required int id}) async {
    return await usersRepository.getCompanyUserLookup(id: id);
  }
}
