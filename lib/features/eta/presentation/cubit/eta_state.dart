part of 'eta_cubit.dart';

class ETAState extends Equatable {
  final EtaConnectionResult? getETAResponse;
  final AddEtaConnectionResult? addETAResponse;
  final EtaConnectionLookupsResult? getETALookupsResponse;
  final String? failure;
  final RequestState? getETARequestState;
  final RequestState? addETARequestState;
  final RequestState? getETALookupsRequestState;

  const ETAState({
    this.getETAResponse,
    this.addETAResponse,
    this.getETALookupsResponse,
    this.addETARequestState = RequestState.loading,
    this.getETARequestState = RequestState.loading,
    this.getETALookupsRequestState = RequestState.loading,
    this.failure = "",
  });
  ETAState copyWith({
    EtaConnectionResult? getETAResponse,
    AddEtaConnectionResult? addETAResponse,
    EtaConnectionLookupsResult? getETALookupsResponse,
    String? failure,
    RequestState? getETARequestState,
    RequestState? addETARequestState,
    RequestState? getETALookupsRequestState,
  }) {
    return ETAState(
      failure: failure ?? this.failure,
      addETARequestState: addETARequestState ?? this.addETARequestState,
      getETARequestState: getETARequestState ?? this.getETARequestState,
      getETALookupsRequestState: getETALookupsRequestState ?? this.getETALookupsRequestState,
      getETAResponse: getETAResponse ?? this.getETAResponse,
      addETAResponse: addETAResponse ?? this.addETAResponse,
      getETALookupsResponse: getETALookupsResponse ?? this.getETALookupsResponse,
    );
  }

  @override
  List<Object?> get props => [
    addETARequestState,
    getETARequestState,
    getETALookupsRequestState,
    failure!,
    addETAResponse ??
        AddEtaConnectionResult(statuscode: 0, result: null),
    getETALookupsResponse ??
        EtaConnectionLookupsResult(statuscode: 0, result: null),
    getETAResponse ??
        EtaConnectionResult(statuscode: 0, result: null),
  ];
}

class ETAInitial extends ETAState {}

class ETASuccess extends ETAState {
  final EtaConnectionResult? getETAResponse;
  final AddEtaConnectionResult? addETAResponse;
  final EtaConnectionLookupsResult? getETALookupsResponse;
  const ETASuccess({
    this.getETAResponse,
    this.addETAResponse,
    this.getETALookupsResponse,
  });
}

class ETALoading extends ETAState {}

class ETARefresh extends ETAState {}

class ETAFailure extends ETAState {
  final String failure;
  const ETAFailure({
    required this.failure,
  });
}