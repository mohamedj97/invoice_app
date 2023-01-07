part of 'get_submitted_invoices_cubit.dart';

class GetSubmittedInvoicesState extends Equatable {
  final GetSubmittedInvoiceResponse? getSubmittedInvoiceResponse;
  final String? failure;
  final RequestState getSubmittedInvoicesRequestState;

  const GetSubmittedInvoicesState({
    this.getSubmittedInvoiceResponse,
    this.getSubmittedInvoicesRequestState = RequestState.loading,
    this.failure = "",
  });

  GetSubmittedInvoicesState copyWith({
    GetSubmittedInvoiceResponse? getSubmittedInvoiceResponse,
    String? failure,
    RequestState? getSubmittedInvoicesRequestState,
  }) {
    return GetSubmittedInvoicesState(
      failure: failure ?? this.failure,
      getSubmittedInvoicesRequestState:
      getSubmittedInvoicesRequestState ?? this.getSubmittedInvoicesRequestState,
      getSubmittedInvoiceResponse: getSubmittedInvoiceResponse ?? this.getSubmittedInvoiceResponse,
    );
  }

  @override
  List<Object> get props => [
    getSubmittedInvoicesRequestState,
    failure!,
    getSubmittedInvoiceResponse ?? GetSubmittedInvoiceResponse(statuscode: 0, result: null)
  ];
}

class GetSubmittedInvoicesInitial extends GetSubmittedInvoicesState {}

class GetSubmittedInvoicesSuccess extends GetSubmittedInvoicesState {
  final GetSubmittedInvoiceResponse getSubmittedInvoiceResponse;

  const GetSubmittedInvoicesSuccess({
    required this.getSubmittedInvoiceResponse,
  });
}

class GetSubmittedInvoicesLoading extends GetSubmittedInvoicesState {}

class GetSubmittedInvoicesRefresh extends GetSubmittedInvoicesState {}

class GetSubmittedInvoicesFailure extends GetSubmittedInvoicesState {
  final String failure;

  const GetSubmittedInvoicesFailure({
    required this.failure,
  });
}
