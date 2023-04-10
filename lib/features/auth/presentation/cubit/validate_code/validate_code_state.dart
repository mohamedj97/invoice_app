part of 'validate_code_cubit.dart';

class ValidateCodeState extends Equatable {
  final ValidateCodeResponse? validateCodeResponse;
  final RegisterResponse? registerResponse;
  final String? failure;
  final RequestState? validateCodeRequestState;
  final RequestState? resendCodeRequestState;

  const ValidateCodeState({
    this.registerResponse,
    this.validateCodeResponse,
    this.validateCodeRequestState = RequestState.loading,
    this.resendCodeRequestState = RequestState.loading,
    this.failure = "",
  });
  ValidateCodeState copyWith({
    ValidateCodeResponse? validateCodeResponse,
    RegisterResponse? registerResponse,
    String? failure,
    RequestState? validateCodeRequestState,
    RequestState? resendCodeRequestState,
  }) {
    return ValidateCodeState(
      failure: failure ?? this.failure,
      validateCodeRequestState: validateCodeRequestState ?? this.validateCodeRequestState,
      resendCodeRequestState: resendCodeRequestState ?? this.resendCodeRequestState,
      validateCodeResponse: validateCodeResponse ?? this.validateCodeResponse,
      registerResponse: registerResponse ?? this.registerResponse,
    );
  }

  @override
  List<Object?> get props => [
    validateCodeRequestState,
    resendCodeRequestState,
    failure!,
    validateCodeResponse ??
        ValidateCodeResponse(statuscode: 0, result: null),
    registerResponse ??
        RegisterResponse(statuscode: 0, result: null)
  ];
}

class ValidateCodeInitial extends ValidateCodeState {}

class ValidateCodeSuccess extends ValidateCodeState {
  final ValidateCodeResponse? validateCodeResponse;
  final RegisterResponse? registerResponse;
  const ValidateCodeSuccess({
     this.validateCodeResponse,
     this.registerResponse,
  });
}

class ValidateCodeLoading extends ValidateCodeState {}

class ValidateCodeFailure extends ValidateCodeState {
  final String failure;
  const ValidateCodeFailure({
    required this.failure,
  });
}
