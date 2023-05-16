part of 'roles_cubit.dart';

class RolesState extends Equatable {
  final GetRolesResponse? getRolesResponse;
  final String? failure;
  final RequestState? getRolesRequestState;

  const RolesState({
    this.getRolesResponse,
    this.getRolesRequestState = RequestState.loading,
    this.failure = "",
  });
  RolesState copyWith({
    GetRolesResponse? getRolesResponse,
    String? failure,
    RequestState? getRolesRequestState,
  }) {
    return RolesState(
      failure: failure ?? this.failure,
      getRolesRequestState: getRolesRequestState ?? this.getRolesRequestState,
      getRolesResponse: getRolesResponse ?? this.getRolesResponse,
    );
  }

  @override
  List<Object?> get props => [
    getRolesRequestState,
    failure!,
    getRolesResponse ??
        GetRolesResponse(statuscode: 0, result: null),
  ];
}

class RolesInitial extends RolesState {}

class RolesSuccess extends RolesState {
  final GetRolesResponse? getRolesResponse;
  const RolesSuccess({
    this.getRolesResponse,
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