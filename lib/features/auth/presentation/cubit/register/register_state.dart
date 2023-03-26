part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final RegisterResponse? registerResponse;
  final String? failure;
  final RequestState registerRequestState;

  const RegisterState({
    this.registerResponse,
    this.registerRequestState = RequestState.loading,
    this.failure = "",
  });
  RegisterState copyWith({
    RegisterResponse? registerResponse,
    String? failure,
    RequestState? registerRequestState,
  }) {
    return RegisterState(
      failure: failure ?? this.failure,
      registerRequestState: registerRequestState ?? this.registerRequestState,
      registerResponse: registerResponse ?? this.registerResponse,
    );
  }

  @override
  List<Object> get props => [
    registerRequestState,
    failure!,
    registerResponse ??
        RegisterResponse(statuscode: 0, result: null)
  ];
}

class RegisterInitial extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final RegisterResponse registerResponse;
  const RegisterSuccess({
    required this.registerResponse,
  });
}

class RegisterLoading extends RegisterState {}

class RegisterFailure extends RegisterState {
  final String failure;
  const RegisterFailure({
    required this.failure,
  });
}
