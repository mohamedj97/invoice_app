part of 'add_invoice_cubit.dart';

class AddInvoiceState extends Equatable {
  final StringResponse? stringResponse;
  final String? failure;
  final RequestState addInvoiceRequestState;

  const AddInvoiceState({
    this.stringResponse,
    this.addInvoiceRequestState = RequestState.loading,
    this.failure = "",
  });

  AddInvoiceState copyWith({
    StringResponse? stringResponse,
    String? failure,
    RequestState? addInvoiceRequestState,
  }) {
    return AddInvoiceState(
      failure: failure ?? this.failure,
      addInvoiceRequestState:
      addInvoiceRequestState ?? this.addInvoiceRequestState,
      stringResponse: stringResponse ?? this.stringResponse,
    );
  }

  @override
  List<Object> get props => [
    addInvoiceRequestState,
    failure!,
    stringResponse ?? StringResponse(statuscode: 0, result: null)
  ];
}

class AddInvoiceInitial extends AddInvoiceState {}

class AddInvoiceSuccess extends AddInvoiceState {
  final StringResponse stringResponse;

  const AddInvoiceSuccess({
    required this.stringResponse,
  });
}

class AddInvoiceLoading extends AddInvoiceState {}

class AddInvoiceRefresh extends AddInvoiceState {}

class AddInvoiceFailure extends AddInvoiceState {
  final String failure;

  const AddInvoiceFailure({
    required this.failure,
  });
}
