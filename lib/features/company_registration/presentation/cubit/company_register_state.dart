part of 'company_register_cubit.dart';

class CompanyRegisterState extends Equatable {
  final IntResponse? intResponse;
  final String? failure;
  final RequestState companyRegisterRequestState;

  const CompanyRegisterState({
    this.intResponse,
    this.companyRegisterRequestState = RequestState.loading,
    this.failure = "",
  });
  CompanyRegisterState copyWith({
    IntResponse? intResponse,
    String? failure,
    RequestState? companyRegisterRequestState,
  }) {
    return CompanyRegisterState(
      failure: failure ?? this.failure,
      companyRegisterRequestState: companyRegisterRequestState ?? this.companyRegisterRequestState,
      intResponse: intResponse ?? this.intResponse,
    );
  }

  @override
  List<Object> get props => [
    companyRegisterRequestState,
    failure!,
    intResponse ??
        IntResponse(statuscode: 0, result: null)
  ];
}

class CompanyRegisterInitial extends CompanyRegisterState {}

class CompanyRegisterSuccess extends CompanyRegisterState {
  final IntResponse intResponse;
  const CompanyRegisterSuccess({
    required this.intResponse,
  });
}

class CompanyRegisterLoading extends CompanyRegisterState {}

class CompanyRegisterFailure extends CompanyRegisterState {
  final String failure;
  const CompanyRegisterFailure({
    required this.failure,
  });
}
