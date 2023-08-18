part of 'validate_code_cubit.dart';

class ValidateCodeState extends Equatable {
  final ValidateCodeResponse? validateCodeResponse;
  final RegisterResponse? registerResponse;
  final BoolResponse? boolResponse;
  final String? failure;
  final RequestState? validateCodeRequestState;
  final RequestState? resendCodeRequestState;
  final RequestState? deleteUserRequestState;

  const ValidateCodeState({
    this.registerResponse,
    this.boolResponse,
    this.validateCodeResponse,
    this.validateCodeRequestState = RequestState.loading,
    this.resendCodeRequestState = RequestState.loading,
    this.deleteUserRequestState = RequestState.loading,
    this.failure = "",
  });
  ValidateCodeState copyWith({
    ValidateCodeResponse? validateCodeResponse,
    RegisterResponse? registerResponse,
    BoolResponse? boolResponse,
    String? failure,
    RequestState? validateCodeRequestState,
    RequestState? resendCodeRequestState,
    RequestState? deleteUserRequestState,
  }) {
    return ValidateCodeState(
      failure: failure ?? this.failure,
      validateCodeRequestState: validateCodeRequestState ?? this.validateCodeRequestState,
      resendCodeRequestState: resendCodeRequestState ?? this.resendCodeRequestState,
      deleteUserRequestState: deleteUserRequestState ?? this.deleteUserRequestState,
      validateCodeResponse: validateCodeResponse ?? this.validateCodeResponse,
      boolResponse: boolResponse ?? this.boolResponse,
      registerResponse: registerResponse ?? this.registerResponse,
    );
  }

  @override
  List<Object?> get props => [
    validateCodeRequestState,
    resendCodeRequestState,
    deleteUserRequestState,
    failure!,
    validateCodeResponse ??
        ValidateCodeResponse(statuscode: 0, result: null),
    boolResponse ??
        BoolResponse(statuscode: 0, result: null),
    registerResponse ??
        RegisterResponse(statuscode: 0, result: null)
  ];
}

class ValidateCodeInitial extends ValidateCodeState {}

class ValidateCodeSuccess extends ValidateCodeState {
  final ValidateCodeResponse? validateCodeResponse;
  final BoolResponse? boolResponse;
  final RegisterResponse? registerResponse;
  const ValidateCodeSuccess({
     this.validateCodeResponse,
     this.boolResponse,
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
