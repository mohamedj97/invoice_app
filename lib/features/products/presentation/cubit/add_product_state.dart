part of 'add_product_cubit.dart';

class AddProductState extends Equatable {
  final AddProductResponse? addProductResponse;
  final String? failure;
  final RequestState addProductRequestState;

  const AddProductState({
    this.addProductResponse,
    this.addProductRequestState = RequestState.loading,
    this.failure = "",
  });
  AddProductState copyWith({
    AddProductResponse? addProductResponse,
    String? failure,
    RequestState? addProductRequestState,
  }) {
    return AddProductState(
      failure: failure ?? this.failure,
      addProductRequestState: addProductRequestState ?? this.addProductRequestState,
      addProductResponse: addProductResponse ?? this.addProductResponse,
    );
  }

  @override
  List<Object> get props => [
    addProductRequestState,
    failure!,
    addProductResponse ??
        AddProductResponse(statuscode: 0, result: null)
  ];
}

class AddProductInitial extends AddProductState {}

class AddProductSuccess extends AddProductState {
  final AddProductResponse addProductResponse;
  const AddProductSuccess({
    required this.addProductResponse,
  });
}

class AddProductLoading extends AddProductState {}

class AddProductRefresh extends AddProductState {}

class AddProductFailure extends AddProductState {
  final String failure;
  const AddProductFailure({
    required this.failure,
  });
}