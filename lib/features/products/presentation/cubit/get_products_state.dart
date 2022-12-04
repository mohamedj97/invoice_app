part of 'get_products_cubit.dart';

class GetProductsState extends Equatable {
  final GetProductsResponse? getProductsResponse;
  final String? failure;
  final RequestState getProductsRequestState;

  const GetProductsState({
    this.getProductsResponse,
    this.getProductsRequestState = RequestState.loading,
    this.failure = "",
  });
  GetProductsState copyWith({
    GetProductsResponse? getProductsResponse,
    String? failure,
    RequestState? getProductsRequestState,
  }) {
    return GetProductsState(
      failure: failure ?? this.failure,
      getProductsRequestState: getProductsRequestState ?? this.getProductsRequestState,
      getProductsResponse: getProductsResponse ?? this.getProductsResponse,
    );
  }

  @override
  List<Object> get props => [
    getProductsRequestState,
    failure!,
    getProductsResponse ??
        GetProductsResponse(statuscode: 0, result: null)
  ];
}

class GetProductsInitial extends GetProductsState {}

class GetProductsSuccess extends GetProductsState {
  final GetProductsResponse getProductsResponse;
  const GetProductsSuccess({
    required this.getProductsResponse,
  });
}

class GetProductsLoading extends GetProductsState {}

class GetProductsRefresh extends GetProductsState {}

class GetProductsFailure extends GetProductsState {
  final String failure;
  const GetProductsFailure({
    required this.failure,
  });
}