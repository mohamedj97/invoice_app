part of 'get_customers_cubit.dart';

class GetCustomersState extends Equatable {
  final GetCustomersResponse? getCustomersResponse;
  final String? failure;
  final RequestState getCustomersRequestState;

  const GetCustomersState({
    this.getCustomersResponse,
    this.getCustomersRequestState = RequestState.loading,
    this.failure = "",
  });

  GetCustomersState copyWith({
    GetCustomersResponse? getCustomersResponse,
    String? failure,
    RequestState? getCustomersRequestState,
  }) {
    return GetCustomersState(
      failure: failure ?? this.failure,
      getCustomersRequestState:
          getCustomersRequestState ?? this.getCustomersRequestState,
      getCustomersResponse: getCustomersResponse ?? this.getCustomersResponse,
    );
  }

  @override
  List<Object> get props => [
        getCustomersRequestState,
        failure!,
        getCustomersResponse ??
            GetCustomersResponse(statuscode: 0, result: null)
      ];
}

class GetCustomersInitial extends GetCustomersState {}

class GetCustomersSuccess extends GetCustomersState {
  final GetCustomersResponse getCustomersResponse;

  const GetCustomersSuccess({
    required this.getCustomersResponse,
  });
}

class GetCustomersLoading extends GetCustomersState {}

class GetCustomersFailure extends GetCustomersState {
  final String failure;

  const GetCustomersFailure({
    required this.failure,
  });
}
