part of 'change_paswword_cubit.dart';

class ChangePasswordState extends Equatable {
  final StringResponse? stringResponse;
  final String? failure;
  final RequestState changePasswordRequestState;

  const ChangePasswordState({
    this.stringResponse,
    this.changePasswordRequestState = RequestState.loading,
    this.failure = "",
  });

  ChangePasswordState copyWith({
    StringResponse? stringResponse,
    String? failure,
    RequestState? changePasswordRequestState,
  }) {
    return ChangePasswordState(
      failure: failure ?? this.failure,
      changePasswordRequestState:
      changePasswordRequestState ?? this.changePasswordRequestState,
      stringResponse: stringResponse ?? this.stringResponse,
    );
  }

  @override
  List<Object> get props => [
    changePasswordRequestState,
    failure!,
    stringResponse ?? StringResponse(statuscode: 0, result: "")
  ];
}

class ChangePasswordInitial extends ChangePasswordState {}

class ChangePasswordSuccess extends ChangePasswordState {
  final StringResponse stringResponse;

  const ChangePasswordSuccess({
    required this.stringResponse,
  });
}

class ChangePasswordLoading extends ChangePasswordState {}

class ChangePasswordRefresh extends ChangePasswordState {}

class ChangePasswordFailure extends ChangePasswordState {
  final String failure;

  const ChangePasswordFailure({
    required this.failure,
  });
}
