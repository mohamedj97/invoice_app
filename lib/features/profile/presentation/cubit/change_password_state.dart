part of 'change_paswword_cubit.dart';

class ChangePasswordState extends Equatable {
  final BoolResponse? boolResponse;
  final String? failure;
  final RequestState changePasswordRequestState;

  const ChangePasswordState({
    this.boolResponse,
    this.changePasswordRequestState = RequestState.loading,
    this.failure = "",
  });

  ChangePasswordState copyWith({
    BoolResponse? boolResponse,
    String? failure,
    RequestState? changePasswordRequestState,
  }) {
    return ChangePasswordState(
      failure: failure ?? this.failure,
      changePasswordRequestState:
      changePasswordRequestState ?? this.changePasswordRequestState,
      boolResponse: boolResponse ?? this.boolResponse,
    );
  }

  @override
  List<Object> get props => [
    changePasswordRequestState,
    failure!,
    boolResponse ?? BoolResponse(statuscode: 0, result: null)
  ];
}

class ChangePasswordInitial extends ChangePasswordState {}

class ChangePasswordSuccess extends ChangePasswordState {
  final BoolResponse boolResponse;

  const ChangePasswordSuccess({
    required this.boolResponse,
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
