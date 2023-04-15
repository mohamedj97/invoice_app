part of 'add_invoice_cubit.dart';

class AddInvoiceState extends Equatable {
  final GetSingleInvoiceResponse? getSingleInvoiceResponse;
  final BoolResponse? boolResponse;
  final String? failure;
  final RequestState addInvoiceRequestState;

  const AddInvoiceState({
    this.getSingleInvoiceResponse,
    this.boolResponse,
    this.addInvoiceRequestState = RequestState.loading,
    this.failure = "",
  });

  AddInvoiceState copyWith({
    GetSingleInvoiceResponse? getSingleInvoiceResponse,
    BoolResponse? boolResponse,
    String? failure,
    RequestState? addInvoiceRequestState,
  }) {
    return AddInvoiceState(
      failure: failure ?? this.failure,
      addInvoiceRequestState:
      addInvoiceRequestState ?? this.addInvoiceRequestState,
      getSingleInvoiceResponse: getSingleInvoiceResponse ?? this.getSingleInvoiceResponse,
      boolResponse: boolResponse ?? this.boolResponse,
    );
  }

  @override
  List<Object> get props => [
    addInvoiceRequestState,
    failure!,
    getSingleInvoiceResponse ?? GetSingleInvoiceResponse(statuscode: 0, result: null),
    boolResponse ?? BoolResponse(statuscode: 0, result: null),
  ];
}

class AddInvoiceInitial extends AddInvoiceState {}

class AddInvoiceSuccess extends AddInvoiceState {
  final GetSingleInvoiceResponse? getSingleInvoiceResponse;
  final BoolResponse? boolResponse;

  const AddInvoiceSuccess({
    this.getSingleInvoiceResponse,
    this.boolResponse,
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
