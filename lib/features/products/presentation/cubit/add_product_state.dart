part of 'add_product_cubit.dart';

class AddProductState extends Equatable {
  final BoolResponse? boolResponse;
  final String? failure;
  final RequestState addProductRequestState;

  const AddProductState({
    this.boolResponse,
    this.addProductRequestState = RequestState.loading,
    this.failure = "",
  });
  AddProductState copyWith({
    BoolResponse? boolResponse,
    String? failure,
    RequestState? addProductRequestState,
  }) {
    return AddProductState(
      failure: failure ?? this.failure,
      addProductRequestState: addProductRequestState ?? this.addProductRequestState,
      boolResponse: boolResponse ?? this.boolResponse,
    );
  }

  @override
  List<Object> get props => [
    addProductRequestState,
    failure!,
    boolResponse ??
        BoolResponse(statuscode: 0, result: null)
  ];
}

class AddProductInitial extends AddProductState {}

class AddProductSuccess extends AddProductState {
  final BoolResponse boolResponse;
  const AddProductSuccess({
    required this.boolResponse,
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