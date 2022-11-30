part of 'login_cubit.dart';

class LoginState extends Equatable {
  final LoginResponse? loginResponse;
  final String? failure;
  final RequestState loginRequestState;

  const LoginState({
    this.loginResponse,
    this.loginRequestState = RequestState.loading,
    this.failure = "",
  });
  LoginState copyWith({
    LoginResponse? loginResponse,
    String? failure,
    RequestState? loginRequestState,
  }) {
    return LoginState(
      failure: failure ?? this.failure,
      loginRequestState: loginRequestState ?? this.loginRequestState,
      loginResponse: loginResponse ?? this.loginResponse,
    );
  }

  @override
  List<Object> get props => [
        loginRequestState,
        failure!,
        loginResponse ??
            LoginResponse(statuscode: 0, result: null)
      ];
}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginResponse loginResponse;
  const LoginSuccess({
    required this.loginResponse,
  });
}

class LoginLoading extends LoginState {}

class LoginFailure extends LoginState {
  final String failure;
  const LoginFailure({
    required this.failure,
  });
}
