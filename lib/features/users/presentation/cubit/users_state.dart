part of 'users_cubit.dart';

class UsersState extends Equatable {
  final GetUsersResponse? getUsersResponse;
  final GetSingleUserResponse? getSingleUserResponse;
  final String? failure;
  final RequestState? getUsersRequestState;
  final RequestState? getSingleUserRequestState;

  const UsersState({
    this.getUsersResponse,
    this.getSingleUserResponse,
    this.getUsersRequestState = RequestState.loading,
    this.getSingleUserRequestState = RequestState.loading,
    this.failure = "",
  });
  UsersState copyWith({
    GetUsersResponse? getUsersResponse,
    GetSingleUserResponse? getSingleUserResponse,
    String? failure,
    RequestState? getUsersRequestState,
    RequestState? getSingleUserRequestState,
  }) {
    return UsersState(
      failure: failure ?? this.failure,
      getUsersRequestState: getUsersRequestState ?? this.getUsersRequestState,
      getSingleUserRequestState: getSingleUserRequestState ?? this.getSingleUserRequestState,
      getUsersResponse: getUsersResponse ?? this.getUsersResponse,
      getSingleUserResponse: getSingleUserResponse ?? this.getSingleUserResponse,
    );
  }

  @override
  List<Object?> get props => [
    getUsersRequestState,
    getSingleUserRequestState,
    failure!,
    getSingleUserResponse ??
        GetSingleUserResponse(statuscode: 0, result: null),
  ];
}

class UsersInitial extends UsersState {}

class UsersSuccess extends UsersState {
  final GetUsersResponse? getUsersResponse;
  final GetSingleUserResponse? getSingleUserResponse;
  const UsersSuccess({
    this.getUsersResponse,
    this.getSingleUserResponse,
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