part of 'change_company_cubit.dart';

class ChangeCompanyState extends Equatable {
  final BoolResponse? changeCompanyResponse;
  final GetUsersCompaniesResult? getUsersCompaniesResponse;
  final String? failure;
  final RequestState? changeCompanyRequestState;
  final RequestState? getUsersCompaniesRequestState;

  const ChangeCompanyState({
    this.changeCompanyResponse,
    this.getUsersCompaniesResponse,
    this.changeCompanyRequestState = RequestState.loading,
    this.getUsersCompaniesRequestState = RequestState.loading,
    this.failure = "",
  });
  ChangeCompanyState copyWith({
    BoolResponse? changeCompanyResponse,
    GetUsersCompaniesResult? getUsersCompaniesResponse,
    String? failure,
    RequestState? changeCompanyRequestState,
    RequestState? getUsersCompaniesRequestState,
  }) {
    return ChangeCompanyState(
      failure: failure ?? this.failure,
      changeCompanyRequestState: changeCompanyRequestState ?? this.changeCompanyRequestState,
      getUsersCompaniesRequestState: getUsersCompaniesRequestState ?? this.getUsersCompaniesRequestState,
      changeCompanyResponse: changeCompanyResponse ?? this.changeCompanyResponse,
      getUsersCompaniesResponse: getUsersCompaniesResponse ?? this.getUsersCompaniesResponse,
    );
  }

  @override
  List<Object?> get props => [
    getUsersCompaniesRequestState,
    changeCompanyRequestState,
    failure!,
    changeCompanyResponse ??
        BoolResponse(statuscode: 0, result: null),
    getUsersCompaniesResponse ??
        GetUsersCompaniesResult(statuscode: 0, companies: null, status: 0),
  ];
}

class ChangeCompanyInitial extends ChangeCompanyState {}

class ChangeCompanySuccess extends ChangeCompanyState {
  final BoolResponse? changeCompanyResponse;
  final GetUsersCompaniesResult? getUsersCompaniesResponse;
  const ChangeCompanySuccess({
    this.changeCompanyResponse,
    this.getUsersCompaniesResponse,
  });
}

class ChangeCompanyLoading extends ChangeCompanyState {}

class ChangeCompanyRefresh extends ChangeCompanyState {}

class ChangeCompanyFailure extends ChangeCompanyState {
  final String failure;
  const ChangeCompanyFailure({
    required this.failure,
  });
}