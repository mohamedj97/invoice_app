part of 'get_invoices_cubit.dart';

class GetInvoicesState extends Equatable {
  final GetInvoicesResponse? getInvoicesResponse;
  final GetSingleInvoiceResponse? getSingleInvoiceResponse;
  final BoolResponse? deleteInvoiceResponse;
  final String? failure;
  final RequestState getInvoicesRequestState;
  final RequestState deleteInvoiceRequestState;

  const GetInvoicesState({
    this.getInvoicesResponse,
    this.getSingleInvoiceResponse,
    this.deleteInvoiceResponse,
    this.getInvoicesRequestState = RequestState.loading,
    this.deleteInvoiceRequestState = RequestState.loading,
    this.failure = "",
  });

  GetInvoicesState copyWith({
    GetInvoicesResponse? getInvoicesResponse,
    BoolResponse? deleteInvoiceResponse,
    GetSingleInvoiceResponse? getSingleInvoiceResponse,
    String? failure,
    RequestState? getInvoicesRequestState,
    RequestState? deleteInvoiceRequestState,
  }) {
    return GetInvoicesState(
      failure: failure ?? this.failure,
      getInvoicesRequestState: getInvoicesRequestState ?? this.getInvoicesRequestState,
      deleteInvoiceRequestState: deleteInvoiceRequestState ?? this.deleteInvoiceRequestState,
      getSingleInvoiceResponse: getSingleInvoiceResponse ?? this.getSingleInvoiceResponse,
      getInvoicesResponse: getInvoicesResponse ?? this.getInvoicesResponse,
      deleteInvoiceResponse: deleteInvoiceResponse ?? this.deleteInvoiceResponse,
    );
  }

  @override
  List<Object> get props => [
        getInvoicesRequestState,
        deleteInvoiceRequestState,
        failure!,
        getSingleInvoiceResponse ?? GetSingleInvoiceResponse(statuscode: 0, result: null),
        getSingleInvoiceResponse ?? GetSingleInvoiceResponse(statuscode: 0, result: null),
        deleteInvoiceResponse ?? BoolResponse(statuscode: 0, result: null)
      ];
}

class GetInvoicesInitial extends GetInvoicesState {}

class GetInvoicesSuccess extends GetInvoicesState {
  final GetInvoicesResponse? getInvoicesResponse;
  final BoolResponse? deleteInvoiceResponse;
  final GetSingleInvoiceResponse? getSingleInvoiceResponse;

  const GetInvoicesSuccess({
    this.getInvoicesResponse,
    this.deleteInvoiceResponse,
    this.getSingleInvoiceResponse,
  });
}

class GetInvoicesLoading extends GetInvoicesState {}

class GetInvoicesRefresh extends GetInvoicesState {}

class GetInvoicesFailure extends GetInvoicesState {
  final String failure;

  const GetInvoicesFailure({
    required this.failure,
  });
}
