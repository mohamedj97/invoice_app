part of 'get_profile_cubit.dart';

class GetProfileState extends Equatable {
  final GetProfileResponse? getProfileResponse;
  final GetCompanyLookupsResponse? getCompanyLookupsResponse;
  final String? failure;
  final RequestState getProfileRequestState;
  final RequestState getCompanyLookupsRequestState;

  const GetProfileState({
    this.getProfileResponse,
    this.getCompanyLookupsResponse,
    this.getProfileRequestState = RequestState.loading,
    this.getCompanyLookupsRequestState = RequestState.loading,
    this.failure = "",
  });

  GetProfileState copyWith({
    GetProfileResponse? getProfileResponse,
    GetCompanyLookupsResponse? getCompanyLookupsResponse,
    String? failure,
    RequestState? getProfileRequestState,
    RequestState? getCompanyLookupsRequestState,
  }) {
    return GetProfileState(
      failure: failure ?? this.failure,
      getProfileRequestState: getProfileRequestState ?? this.getProfileRequestState,
      getCompanyLookupsRequestState: getCompanyLookupsRequestState ?? this.getCompanyLookupsRequestState,
      getProfileResponse: getProfileResponse ?? this.getProfileResponse,
      getCompanyLookupsResponse: getCompanyLookupsResponse ?? this.getCompanyLookupsResponse,
    );
  }

  @override
  List<Object> get props => [
        getProfileRequestState,
        getCompanyLookupsRequestState,
        failure!,
        getProfileResponse ?? GetProfileResponse(statuscode: 0, result: null),
        getCompanyLookupsResponse ?? GetCompanyLookupsResponse(statuscode: 0, result: null, message: null)
      ];
}

class GetProfileInitial extends GetProfileState {}

class GetProfileSuccess extends GetProfileState {
  final GetProfileResponse? getProfileResponse;
  final GetCompanyLookupsResponse? getCompanyLookupsResponse;

  const GetProfileSuccess({
     this.getProfileResponse,
     this.getCompanyLookupsResponse,
  });
}

class GetProfileLoading extends GetProfileState {}

class GetProfileRefresh extends GetProfileState {}

class GetProfileFailure extends GetProfileState {
  final String failure;

  const GetProfileFailure({
    required this.failure,
  });
}
