part of 'users_cubit.dart';

class UsersState extends Equatable {
  final GetUsersResponse? getUsersResponse;
  final String? failure;
  final RequestState? getUsersRequestState;

  const UsersState({
    this.getUsersResponse,
    this.getUsersRequestState = RequestState.loading,
    this.failure = "",
  });
  UsersState copyWith({
    GetUsersResponse? getUsersResponse,
    String? failure,
    RequestState? getUsersRequestState,
  }) {
    return UsersState(
      failure: failure ?? this.failure,
      getUsersRequestState: getUsersRequestState ?? this.getUsersRequestState,
      getUsersResponse: getUsersResponse ?? this.getUsersResponse,
    );
  }

  @override
  List<Object?> get props => [
    getUsersRequestState,
    failure!,
    getUsersResponse ??
        GetUsersResponse(statuscode: 0, result: null),
  ];
}

class UsersInitial extends UsersState {}

class UsersSuccess extends UsersState {
  final GetUsersResponse? getUsersResponse;
  const UsersSuccess({
    this.getUsersResponse,
  });
}

class UsersLoading extends UsersState {}

class UsersRefresh extends UsersState {}

class UsersFailure extends UsersState {
  final String failure;
  const UsersFailure({
    required this.failure,
  });
}