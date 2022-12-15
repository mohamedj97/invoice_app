part of 'get_item_types_cubit.dart';

class GetItemTypesState extends Equatable {
  final GetItemTypesResponse? getItemTypesResponse;
  final String? failure;
  final RequestState getItemTypesRequestState;

  const GetItemTypesState({
    this.getItemTypesResponse,
    this.getItemTypesRequestState = RequestState.loading,
    this.failure = "",
  });
  GetItemTypesState copyWith({
    GetItemTypesResponse? getItemTypesResponse,
    String? failure,
    RequestState? getItemTypesRequestState,
  }) {
    return GetItemTypesState(
      failure: failure ?? this.failure,
      getItemTypesRequestState: getItemTypesRequestState ?? this.getItemTypesRequestState,
      getItemTypesResponse: getItemTypesResponse ?? this.getItemTypesResponse,
    );
  }

  @override
  List<Object> get props => [
    getItemTypesRequestState,
    failure!,
    getItemTypesResponse ??
        GetItemTypesResponse(statuscode: 0, result: null)
  ];
}

class GetItemTypesInitial extends GetItemTypesState {}

class GetItemTypesSuccess extends GetItemTypesState {
  final GetItemTypesResponse getItemTypesResponse;
  const GetItemTypesSuccess({
    required this.getItemTypesResponse,
  });
}

class GetItemTypesLoading extends GetItemTypesState {}

class GetItemTypesRefresh extends GetItemTypesState {}

class GetItemTypesFailure extends GetItemTypesState {
  final String failure;
  const GetItemTypesFailure({
    required this.failure,
  });
}