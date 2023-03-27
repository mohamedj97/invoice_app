import 'package:equatable/equatable.dart';

class ValidateCodeResponseData extends Equatable {
  late String Email;
  late String Username;

  ValidateCodeResponseData({
    required this.Username,
    required this.Email,
  });

  @override
  List<Object?> get props {
    return [
      Username,
      Email,
    ];
  }
}
