
import '../network/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;
  const ServerException({required this.errorMessageModel});
}

class CacheException implements Exception {
  final String message;
  const CacheException({required this.message});
}
