part of 'add_customer_cubit.dart';

class AddCustomerState extends Equatable {
  final AddCustomerResponse? addCustomerResponse;
  final String? failure;
  final RequestState addCustomerRequestState;

  const AddCustomerState({
    this.addCustomerResponse,
    this.addCustomerRequestState = RequestState.loading,
    this.failure = "",
  });
  AddCustomerState copyWith({
    AddCustomerResponse? addCustomerResponse,
    String? failure,
    RequestState? addCustomerRequestState,
  }) {
    return AddCustomerState(
      failure: failure ?? this.failure,
      addCustomerRequestState: addCustomerRequestState ?? this.addCustomerRequestState,
      addCustomerResponse: addCustomerResponse ?? this.addCustomerResponse,
    );
  }

  @override
  List<Object> get props => [
    addCustomerRequestState,
    failure!,
    addCustomerResponse ??
        AddCustomerResponse(statuscode: 0, result: null)
  ];
}

class AddCustomerInitial extends AddCustomerState {}

class AddCustomerSuccess extends AddCustomerState {
  final AddCustomerResponse addCustomerResponse;
  const AddCustomerSuccess({
    required this.addCustomerResponse,
  });
}

class AddCustomerLoading extends AddCustomerState {}

class AddCustomerRefresh extends AddCustomerState {}

class AddCustomerFailure extends AddCustomerState {
  final String failure;
  const AddCustomerFailure({
    required this.failure,
  });
}