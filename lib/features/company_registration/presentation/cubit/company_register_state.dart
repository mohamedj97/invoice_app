part of 'company_register_cubit.dart';

class CompanyRegisterState extends Equatable {
  final IntResponse? intResponse;
  final GetCompanyLookupsResponse? getCompanyLookupsResponse;
  final String? failure;
  final RequestState companyRegisterRequestState;

  const CompanyRegisterState({
    this.intResponse,
    this.getCompanyLookupsResponse,
    this.companyRegisterRequestState = RequestState.loading,
    this.failure = "",
  });
  CompanyRegisterState copyWith({
    IntResponse? intResponse,
    GetCompanyLookupsResponse? getCompanyLookupsResponse,
    String? failure,
    RequestState? companyRegisterRequestState,
  }) {
    return CompanyRegisterState(
      failure: failure ?? this.failure,
      companyRegisterRequestState: companyRegisterRequestState ?? this.companyRegisterRequestState,
      intResponse: intResponse ?? this.intResponse,
      getCompanyLookupsResponse: getCompanyLookupsResponse ?? this.getCompanyLookupsResponse,
    );
  }

  @override
  List<Object> get props => [
    companyRegisterRequestState,
    failure!,
    intResponse ??
        IntResponse(statuscode: 0, result: null),
    getCompanyLookupsResponse ??
        GetCompanyLookupsResponse(statuscode: 0, result: null),
  ];
}

class CompanyRegisterInitial extends CompanyRegisterState {}

class CompanyRegisterSuccess extends CompanyRegisterState {
  final IntResponse? intResponse;
  final GetCompanyLookupsResponse? getCompanyLookupsResponse;
  const CompanyRegisterSuccess({
     this.intResponse,
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
