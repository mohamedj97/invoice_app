part of 'roles_cubit.dart';

class RolesState extends Equatable {
  final GetRolesResponse? getRolesResponse;
  final GetSingleRoleResponse? getSingleRoleResponse;
  final String? failure;
  final RequestState? getRolesRequestState;
  final RequestState? getSingleRoleRequestState;

  const RolesState({
    this.getRolesResponse,
    this.getSingleRoleResponse,
    this.getRolesRequestState = RequestState.loading,
    this.getSingleRoleRequestState = RequestState.loading,
    this.failure = "",
  });
  RolesState copyWith({
    GetRolesResponse? getRolesResponse,
    GetSingleRoleResponse? getSingleRoleResponse,
    String? failure,
    RequestState? getRolesRequestState,
    RequestState? getSingleRoleRequestState,
  }) {
    return RolesState(
      failure: failure ?? this.failure,
      getRolesRequestState: getRolesRequestState ?? this.getRolesRequestState,
      getSingleRoleRequestState: getSingleRoleRequestState ?? this.getSingleRoleRequestState,
      getRolesResponse: getRolesResponse ?? this.getRolesResponse,
      getSingleRoleResponse: getSingleRoleResponse ?? this.getSingleRoleResponse,
    );
  }

  @override
  List<Object?> get props => [
    getRolesRequestState,
    getSingleRoleRequestState,
    failure!,
    getRolesResponse ??
        GetRolesResponse(statuscode: 0, result: null),
    getSingleRoleResponse ??
        GetSingleRoleResponse(statuscode: 0, result: null),
  ];
}

class RolesInitial extends RolesState {}

class RolesSuccess extends RolesState {
  final GetRolesResponse? getRolesResponse;
  final GetSingleRoleResponse? getSingleRoleResponse;
  const RolesSuccess({
    this.getRolesResponse,
    this.getSingleRoleResponse,
  });
}

class RolesLoading extends RolesState {}

class RolesRefresh extends RolesState {}

class RolesFailure extends RolesState {
  final String failure;
  const RolesFailure({
    required this.failure,
  });
}