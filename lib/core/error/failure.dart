import 'package:equatable/equatable.dart';

import '../api/base_api_response.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure({required this.message});
  @override
  List<Object> get props => [message];
}

class FailureResponse extends BaseAPIResponse {
  FailureResponse({
    required super.statuscode,
    super.message,
    // required this.result,
  });
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message});
}

class CacheFailure extends Failure {
  const CacheFailure({required super.message});
}
