import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final int statusCode;
  final String statusMessage;
  final bool isSuccess;

  const ErrorMessageModel({
    required this.statusCode,
    required this.statusMessage,
    required this.isSuccess,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      statusCode: json['status_code'] as int,
      statusMessage: json['status_message'] as String,
      isSuccess: json['success'] as bool,
    );
  }

  @override
  List<Object> get props => [
        statusCode,
        statusMessage,
        isSuccess,
      ];
}
