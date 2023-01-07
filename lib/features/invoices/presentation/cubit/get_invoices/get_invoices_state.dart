part of 'get_invoices_cubit.dart';

class GetInvoicesState extends Equatable {
  final GetInvoicesResponse? getInvoicesResponse;
  final GetSingleInvoiceResponse? getSingleInvoiceResponse;
  final String? failure;
  final RequestState getInvoicesRequestState;

  const GetInvoicesState({
    this.getInvoicesResponse,
    this.getSingleInvoiceResponse,
    this.getInvoicesRequestState = RequestState.loading,
    this.failure = "",
  });

  GetInvoicesState copyWith({
    GetInvoicesResponse? getInvoicesResponse,
    GetSingleInvoiceResponse? getSingleInvoiceResponse,
    String? failure,
    RequestState? getInvoicesRequestState,
  }) {
    return GetInvoicesState(
      failure: failure ?? this.failure,
      getInvoicesRequestState: getInvoicesRequestState ?? this.getInvoicesRequestState,
      getSingleInvoiceResponse: getSingleInvoiceResponse ?? this.getSingleInvoiceResponse,
      getInvoicesResponse: getInvoicesResponse ?? this.getInvoicesResponse,
    );
  }

  @override
  List<Object> get props => [
        getInvoicesRequestState,
        failure!,
        getSingleInvoiceResponse ?? GetSingleInvoiceResponse(statuscode: 0, result: null),
        getInvoicesResponse ?? GetInvoicesResponse(statuscode: 0, result: null)
      ];
}

class GetInvoicesInitial extends GetInvoicesState {}

class GetInvoicesSuccess extends GetInvoicesState {
  final GetInvoicesResponse? getInvoicesResponse;
  final GetSingleInvoiceResponse? getSingleInvoiceResponse;

  const GetInvoicesSuccess({
     this.getInvoicesResponse,
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
