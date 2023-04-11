part of 'add_edit_product_cubit.dart';

class AddEditProductState extends Equatable {
  final AddProductResponse? addProductResponse;
  final BoolResponse? boolResponse;
  final String? failure;
  final RequestState? addProductRequestState;
  final RequestState? editProductRequestState;

  const AddEditProductState({
    this.addProductResponse,
    this.boolResponse,
    this.addProductRequestState = RequestState.loading,
    this.editProductRequestState = RequestState.loading,
    this.failure = "",
  });
  AddEditProductState copyWith({
    AddProductResponse? addProductResponse,
    BoolResponse? boolResponse,
    String? failure,
    RequestState? addProductRequestState,
    RequestState? editProductRequestState,
  }) {
    return AddEditProductState(
      failure: failure ?? this.failure,
      addProductRequestState: addProductRequestState ?? this.addProductRequestState,
      editProductRequestState: editProductRequestState ?? this.editProductRequestState,
      addProductResponse: addProductResponse ?? this.addProductResponse,
      boolResponse: boolResponse ?? this.boolResponse,
    );
  }

  @override
  List<Object?> get props => [
    addProductRequestState,
    editProductRequestState,
    failure!,
    addProductResponse ??
        AddProductResponse(statuscode: 0, result: null),
    boolResponse ??
        BoolResponse(statuscode: 0, result: null),
  ];
}

class AddEditProductInitial extends AddEditProductState {}

class AddEditProductSuccess extends AddEditProductState {
  final AddProductResponse? addProductResponse;
  final BoolResponse? boolResponse;
  const AddEditProductSuccess({
     this.addProductResponse,
     this.boolResponse,
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