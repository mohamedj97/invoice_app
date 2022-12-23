part of 'add_edit_customer_cubit.dart';

class AddEditCustomerState extends Equatable {
  final AddCustomerResponse? addCustomerResponse;
  final StringResponse? stringResponse;
  final String? failure;
  final RequestState addEditCustomerRequestState;

  const AddEditCustomerState({
    this.addCustomerResponse,
    this.stringResponse,
    this.addEditCustomerRequestState = RequestState.loading,
    this.failure = "",
  });
  AddEditCustomerState copyWith({
    AddCustomerResponse? addCustomerResponse,
    StringResponse? stringResponse,
    String? failure,
    RequestState? addEditCustomerRequestState,
  }) {
    return AddEditCustomerState(
      failure: failure ?? this.failure,
      addEditCustomerRequestState: addEditCustomerRequestState ?? this.addEditCustomerRequestState,
      addCustomerResponse: addCustomerResponse ?? this.addCustomerResponse,
      stringResponse: stringResponse ?? this.stringResponse,
    );
  }

  @override
  List<Object> get props => [
    addEditCustomerRequestState,
    failure!,
    addCustomerResponse ??
        AddCustomerResponse(statuscode: 0, result: null),
    stringResponse??StringResponse(result: null, statuscode: 0)
  ];
}

class AddEditCustomerInitial extends AddEditCustomerState {}

class AddEditCustomerSuccess extends AddEditCustomerState {
  final AddCustomerResponse? addCustomerResponse;
  final StringResponse? stringResponse;
  const AddEditCustomerSuccess({
    this.addCustomerResponse,
    this.stringResponse,
  });
}

class AddEditCustomerLoading extends AddEditCustomerState {}

class AddEditCustomerRefresh extends AddEditCustomerState {}

class AddEditCustomerFailure extends AddEditCustomerState {
  final String failure;
  const AddEditCustomerFailure({
    required this.failure,
  });
}