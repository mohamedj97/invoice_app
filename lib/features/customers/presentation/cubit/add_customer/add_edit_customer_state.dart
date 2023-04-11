part of 'add_edit_customer_cubit.dart';

class AddEditCustomerState extends Equatable {
  final AddCustomerResponse? addCustomerResponse;
  final BoolResponse? boolResponse;
  final String? failure;
  final RequestState? addCustomerRequestState;
  final RequestState? editCustomerRequestState;

  const AddEditCustomerState({
    this.addCustomerResponse,
    this.editCustomerRequestState,
    this.boolResponse,
    this.addCustomerRequestState = RequestState.loading,
    this.failure = "",
  });
  AddEditCustomerState copyWith({
    AddCustomerResponse? addCustomerResponse,
    BoolResponse? boolResponse,
    String? failure,
    RequestState? addCustomerRequestState,
    RequestState? editCustomerRequestState,
  }) {
    return AddEditCustomerState(
      failure: failure ?? this.failure,
      addCustomerRequestState: addCustomerRequestState ?? this.addCustomerRequestState,
      editCustomerRequestState: editCustomerRequestState ?? this.editCustomerRequestState,
      addCustomerResponse: addCustomerResponse ?? this.addCustomerResponse,
      boolResponse: boolResponse ?? this.boolResponse,
    );
  }

  @override
  List<Object?> get props => [
    addCustomerRequestState,
    editCustomerRequestState,
    failure!,
    addCustomerResponse ??
        AddCustomerResponse(statuscode: 0, result: null),
    boolResponse??BoolResponse(result: null, statuscode: 0)
  ];
}

class AddEditCustomerInitial extends AddEditCustomerState {}

class AddEditCustomerSuccess extends AddEditCustomerState {
  final AddCustomerResponse? addCustomerResponse;
  final BoolResponse? boolResponse;
  const AddEditCustomerSuccess({
    this.addCustomerResponse,
    this.boolResponse,
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