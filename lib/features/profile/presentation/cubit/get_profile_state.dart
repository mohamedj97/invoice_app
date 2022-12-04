part of 'get_profile_cubit.dart';

class GetProfileState extends Equatable {
  final GetProfileResponse? getProfileResponse;
  final String? failure;
  final RequestState getProfileRequestState;

  const GetProfileState({
    this.getProfileResponse,
    this.getProfileRequestState = RequestState.loading,
    this.failure = "",
  });

  GetProfileState copyWith({
    GetProfileResponse? getProfileResponse,
    String? failure,
    RequestState? getProfileRequestState,
  }) {
    return GetProfileState(
      failure: failure ?? this.failure,
      getProfileRequestState:
      getProfileRequestState ?? this.getProfileRequestState,
      getProfileResponse: getProfileResponse ?? this.getProfileResponse,
    );
  }

  @override
  List<Object> get props => [
    getProfileRequestState,
    failure!,
    getProfileResponse ?? GetProfileResponse(statuscode: 0, result: null)
  ];
}

class GetProfileInitial extends GetProfileState {}

class GetProfileSuccess extends GetProfileState {
  final GetProfileResponse getProfileResponse;

  const GetProfileSuccess({
    required this.getProfileResponse,
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
