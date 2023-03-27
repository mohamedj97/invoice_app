part of 'validate_code_cubit.dart';

class ValidateCodeState extends Equatable {
  final ValidateCodeResponse? validateCodeResponse;
  final String? failure;
  final RequestState validateCodeRequestState;

  const ValidateCodeState({
    this.validateCodeResponse,
    this.validateCodeRequestState = RequestState.loading,
    this.failure = "",
  });
  ValidateCodeState copyWith({
    ValidateCodeResponse? validateCodeResponse,
    String? failure,
    RequestState? validateCodeRequestState,
  }) {
    return ValidateCodeState(
      failure: failure ?? this.failure,
      validateCodeRequestState: validateCodeRequestState ?? this.validateCodeRequestState,
      validateCodeResponse: validateCodeResponse ?? this.validateCodeResponse,
    );
  }

  @override
  List<Object> get props => [
    validateCodeRequestState,
    failure!,
    validateCodeResponse ??
        ValidateCodeResponse(statuscode: 0, result: null)
  ];
}

class ValidateCodeInitial extends ValidateCodeState {}

class ValidateCodeSuccess extends ValidateCodeState {
  final ValidateCodeResponse validateCodeResponse;
  const ValidateCodeSuccess({
    required this.validateCodeResponse,
  });
}

class ValidateCodeLoading extends ValidateCodeState {}

class ValidateCodeFailure extends ValidateCodeState {
  final String failure;
  const ValidateCodeFailure({
    required this.failure,
  });
}
