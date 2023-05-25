part of 'roles_cubit.dart';

class RolesState extends Equatable {
  final GetRolesResponse? getRolesResponse;
  final GetSingleRoleResponse? getSingleRoleResponse;
  final GetFeaturesResponse? getFeaturesResponse;
  final String? failure;
  final RequestState? getRolesRequestState;
  final RequestState? getSingleRoleRequestState;
  final RequestState? getFeaturesRequestState;

  const RolesState({
    this.getRolesResponse,
    this.getFeaturesResponse,
    this.getSingleRoleResponse,
    this.getRolesRequestState = RequestState.loading,
    this.getSingleRoleRequestState = RequestState.loading,
    this.getFeaturesRequestState = RequestState.loading,
    this.failure = "",
  });
  RolesState copyWith({
    GetRolesResponse? getRolesResponse,
    GetSingleRoleResponse? getSingleRoleResponse,
    GetFeaturesResponse? getFeaturesResponse,
    String? failure,
    RequestState? getRolesRequestState,
    RequestState? getSingleRoleRequestState,
    RequestState? getFeaturesRequestState
  }) {
    return RolesState(
      failure: failure ?? this.failure,
      getRolesRequestState: getRolesRequestState ?? this.getRolesRequestState,
      getFeaturesRequestState: getFeaturesRequestState ?? this.getFeaturesRequestState,
      getSingleRoleRequestState: getSingleRoleRequestState ?? this.getSingleRoleRequestState,
      getRolesResponse: getRolesResponse ?? this.getRolesResponse,
      getSingleRoleResponse: getSingleRoleResponse ?? this.getSingleRoleResponse,
      getFeaturesResponse: getFeaturesResponse ?? this.getFeaturesResponse,
    );
  }

  @override
  List<Object?> get props => [
    getRolesRequestState,
    getFeaturesRequestState,
    getSingleRoleRequestState,
    failure!,
    getRolesResponse ??
        GetRolesResponse(statuscode: 0, result: null),
    getSingleRoleResponse ??
        GetSingleRoleResponse(statuscode: 0, result: null),
    getFeaturesResponse ??
        GetFeaturesResponse(statuscode: 0, result: null),
  ];
}

class RolesInitial extends RolesState {}

class RolesSuccess extends RolesState {
  final GetRolesResponse? getRolesResponse;
  final GetSingleRoleResponse? getSingleRoleResponse;
  final GetFeaturesResponse? getFeaturesResponse;
  const RolesSuccess({
    this.getRolesResponse,
    this.getFeaturesResponse,
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