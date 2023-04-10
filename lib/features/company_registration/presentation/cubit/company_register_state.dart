part of 'company_register_cubit.dart';

class CompanyRegisterState extends Equatable {
  final IntResponse? intResponse;
  final BoolResponse? boolResponse;
  final GetCompanyLookupsResponse? getCompanyLookupsResponse;
  final String? failure;
  final RequestState? companyRegisterRequestState;
  final RequestState? companyLookupsRequestState;

  const CompanyRegisterState({
    this.intResponse,
    this.boolResponse,
    this.companyLookupsRequestState,
    this.getCompanyLookupsResponse,
    this.companyRegisterRequestState = RequestState.loading,
    this.failure = "",
  });
  CompanyRegisterState copyWith({
    IntResponse? intResponse,
    BoolResponse? boolResponse,
    GetCompanyLookupsResponse? getCompanyLookupsResponse,
    String? failure,
    RequestState? companyRegisterRequestState,
    RequestState? companyLookupsRequestState,
  }) {
    return CompanyRegisterState(
      failure: failure ?? this.failure,
      companyRegisterRequestState: companyRegisterRequestState ?? this.companyRegisterRequestState,
      companyLookupsRequestState: companyLookupsRequestState ?? this.companyLookupsRequestState,
      intResponse: intResponse ?? this.intResponse,
      boolResponse: boolResponse ?? this.boolResponse,
      getCompanyLookupsResponse: getCompanyLookupsResponse ?? this.getCompanyLookupsResponse,
    );
  }

  @override
  List<Object?> get props => [
    companyRegisterRequestState,
    companyLookupsRequestState,
    failure!,
    intResponse ??
        IntResponse(statuscode: 0, result: null),
    boolResponse ??
        BoolResponse(statuscode: 0, result: null),
    getCompanyLookupsResponse ??
        GetCompanyLookupsResponse(statuscode: 0, result: null),
  ];
}

class CompanyRegisterInitial extends CompanyRegisterState {}

class CompanyRegisterSuccess extends CompanyRegisterState {
  final IntResponse? intResponse;
  final BoolResponse? boolResponse;
  final GetCompanyLookupsResponse? getCompanyLookupsResponse;
  const CompanyRegisterSuccess({
     this.intResponse,
     this.boolResponse,
     this.getCompanyLookupsResponse,
  });
}

class CompanyRegisterLoading extends CompanyRegisterState {}

class CompanyRegisterFailure extends CompanyRegisterState {
  final String failure;
  const CompanyRegisterFailure({
    required this.failure,
  });
}
