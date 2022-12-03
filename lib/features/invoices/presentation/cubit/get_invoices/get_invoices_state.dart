part of 'get_invoices_cubit.dart';

class GetInvoicesState extends Equatable {
  final GetInvoicesResponse? getInvoicesResponse;
  final String? failure;
  final RequestState getInvoicesRequestState;

  const GetInvoicesState({
    this.getInvoicesResponse,
    this.getInvoicesRequestState = RequestState.loading,
    this.failure = "",
  });

  GetInvoicesState copyWith({
    GetInvoicesResponse? getInvoicesResponse,
    String? failure,
    RequestState? getInvoicesRequestState,
  }) {
    return GetInvoicesState(
      failure: failure ?? this.failure,
      getInvoicesRequestState:
          getInvoicesRequestState ?? this.getInvoicesRequestState,
      getInvoicesResponse: getInvoicesResponse ?? this.getInvoicesResponse,
    );
  }

  @override
  List<Object> get props => [
        getInvoicesRequestState,
        failure!,
        getInvoicesResponse ?? GetInvoicesResponse(statuscode: 0, result: null)
      ];
}

class GetInvoicesInitial extends GetInvoicesState {}

class GetInvoicesSuccess extends GetInvoicesState {
  final GetInvoicesResponse getInvoicesResponse;

  const GetInvoicesSuccess({
    required this.getInvoicesResponse,
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
