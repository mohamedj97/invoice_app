part of 'get_invoice_types_cubit.dart';

class GetInvoiceTypesState extends Equatable {
  final GetInvoiceTypesResponse? getInvoiceTypesResponse;
  final String? failure;
  final RequestState getInvoiceTypesRequestState;

  const GetInvoiceTypesState({
    this.getInvoiceTypesResponse,
    this.getInvoiceTypesRequestState = RequestState.loading,
    this.failure = "",
  });
  GetInvoiceTypesState copyWith({
    GetInvoiceTypesResponse? getInvoiceTypesResponse,
    String? failure,
    RequestState? getInvoiceTypesRequestState,
  }) {
    return GetInvoiceTypesState(
      failure: failure ?? this.failure,
      getInvoiceTypesRequestState: getInvoiceTypesRequestState ?? this.getInvoiceTypesRequestState,
      getInvoiceTypesResponse: getInvoiceTypesResponse ?? this.getInvoiceTypesResponse,
    );
  }

  @override
  List<Object> get props => [
    getInvoiceTypesRequestState,
    failure!,
    getInvoiceTypesResponse ??
        GetInvoiceTypesResponse(statuscode: 0, result: null)
  ];
}

class GetInvoiceTypesInitial extends GetInvoiceTypesState {}

class GetInvoiceTypesSuccess extends GetInvoiceTypesState {
  final GetInvoiceTypesResponse getInvoiceTypesResponse;
  const GetInvoiceTypesSuccess({
    required this.getInvoiceTypesResponse,
  });
}

class GetInvoiceTypesLoading extends GetInvoiceTypesState {}

class GetInvoiceTypesRefresh extends GetInvoiceTypesState {}

class GetInvoiceTypesFailure extends GetInvoiceTypesState {
  final String failure;
  const GetInvoiceTypesFailure({
    required this.failure,
  });
}