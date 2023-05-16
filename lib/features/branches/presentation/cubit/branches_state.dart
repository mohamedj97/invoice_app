part of 'branches_cubit.dart';

class BranchesState extends Equatable {
  final GetBranchesResponse? getBranchesResponse;
  final String? failure;
  final RequestState? getBranchesRequestState;

  const BranchesState({
    this.getBranchesResponse,
    this.getBranchesRequestState = RequestState.loading,
    this.failure = "",
  });
  BranchesState copyWith({
    GetBranchesResponse? getBranchesResponse,
    String? failure,
    RequestState? getBranchesRequestState,
  }) {
    return BranchesState(
      failure: failure ?? this.failure,
      getBranchesRequestState: getBranchesRequestState ?? this.getBranchesRequestState,
      getBranchesResponse: getBranchesResponse ?? this.getBranchesResponse,
    );
  }

  @override
  List<Object?> get props => [
    getBranchesRequestState,
    failure!,
    getBranchesResponse ??
        GetBranchesResponse(statuscode: 0, result: null),
  ];
}

class BranchesInitial extends BranchesState {}

class BranchesSuccess extends BranchesState {
  final GetBranchesResponse? getBranchesResponse;
  const BranchesSuccess({
    this.getBranchesResponse,
  });
}

class BranchesLoading extends BranchesState {}

class BranchesRefresh extends BranchesState {}

class BranchesFailure extends BranchesState {
  final String failure;
  const BranchesFailure({
    required this.failure,
  });
}