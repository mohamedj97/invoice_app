part of 'add_edit_product_cubit.dart';

class AddEditProductState extends Equatable {
  final AddProductResponse? addProductResponse;
  final StringResponse? stringResponse;
  final String? failure;
  final RequestState addProductRequestState;

  const AddEditProductState({
    this.addProductResponse,
    this.stringResponse,
    this.addProductRequestState = RequestState.loading,
    this.failure = "",
  });
  AddEditProductState copyWith({
    AddProductResponse? addProductResponse,
    StringResponse? stringResponse,
    String? failure,
    RequestState? addProductRequestState,
  }) {
    return AddEditProductState(
      failure: failure ?? this.failure,
      addProductRequestState: addProductRequestState ?? this.addProductRequestState,
      addProductResponse: addProductResponse ?? this.addProductResponse,
      stringResponse: stringResponse ?? this.stringResponse,
    );
  }

  @override
  List<Object> get props => [
    addProductRequestState,
    failure!,
    addProductResponse ??
        AddProductResponse(statuscode: 0, result: null),
    stringResponse ??
        StringResponse(statuscode: 0, result: null),
  ];
}

class AddEditProductInitial extends AddEditProductState {}

class AddEditProductSuccess extends AddEditProductState {
  final AddProductResponse? addProductResponse;
  final StringResponse? stringResponse;
  const AddEditProductSuccess({
     this.addProductResponse,
     this.stringResponse,
  });
}

class AddEditProductLoading extends AddEditProductState {}

class AddEditProductRefresh extends AddEditProductState {}

class AddEditProductFailure extends AddEditProductState {
  final String failure;
  const AddEditProductFailure({
    required this.failure,
  });
}