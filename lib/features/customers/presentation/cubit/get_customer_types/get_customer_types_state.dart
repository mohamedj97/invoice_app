part of 'get_customer_types_cubit.dart';

class GetCustomerTypesState extends Equatable {
  final GetCustomerTypesResponse? getCustomerTypesResponse;
  final String? failure;
  final RequestState getCustomerTypesRequestState;

  const GetCustomerTypesState({
    this.getCustomerTypesResponse,
    this.getCustomerTypesRequestState = RequestState.loading,
    this.failure = "",
  });
  GetCustomerTypesState copyWith({
    GetCustomerTypesResponse? getCustomerTypesResponse,
    String? failure,
    RequestState? getCustomerTypesRequestState,
  }) {
    return GetCustomerTypesState(
      failure: failure ?? this.failure,
      getCustomerTypesRequestState: getCustomerTypesRequestState ?? this.getCustomerTypesRequestState,
      getCustomerTypesResponse: getCustomerTypesResponse ?? this.getCustomerTypesResponse,
    );
  }

  @override
  List<Object> get props => [
    getCustomerTypesRequestState,
    failure!,
    getCustomerTypesResponse ??
        GetCustomerTypesResponse(statuscode: 0, result: null)
  ];
}

class GetCustomerTypesInitial extends GetCustomerTypesState {}

class GetCustomerTypesSuccess extends GetCustomerTypesState {
  final GetCustomerTypesResponse getCustomerTypesResponse;
  const GetCustomerTypesSuccess({
    required this.getCustomerTypesResponse,
  });
}

class GetCustomerTypesLoading extends GetCustomerTypesState {}

class GetCustomerTypesRefresh extends GetCustomerTypesState {}

class GetCustomerTypesFailure extends GetCustomerTypesState {
  final String failure;
  const GetCustomerTypesFailure({
    required this.failure,
  });
}