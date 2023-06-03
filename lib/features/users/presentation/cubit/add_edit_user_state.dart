part of 'add_edit_user_cubit.dart';

class AddEditUserState extends Equatable {
  final BoolResponse? boolResponse;
  final AddUserResult? getSingleUserResponse;
  final String? failure;
  final RequestState? editUserRequestState;
  final RequestState? addUserRequestState;

  const AddEditUserState({
    this.boolResponse,
    this.getSingleUserResponse,
    this.editUserRequestState = RequestState.loading,
    this.addUserRequestState = RequestState.loading,
    this.failure = "",
  });
  AddEditUserState copyWith({
    BoolResponse? boolResponse,
    AddUserResult? getSingleUserResponse,
    String? failure,
    RequestState? addUserRequestState,
    RequestState? editUserRequestState,
  }) {
    return AddEditUserState(
      failure: failure ?? this.failure,
      addUserRequestState: addUserRequestState ?? this.addUserRequestState,
      editUserRequestState: editUserRequestState ?? this.editUserRequestState,
      boolResponse: boolResponse ?? this.boolResponse,
      getSingleUserResponse: getSingleUserResponse ?? this.getSingleUserResponse,
    );
  }

  @override
  List<Object?> get props => [
    addUserRequestState,
    editUserRequestState,
    failure!,
    getSingleUserResponse ??
        AddUserResult(statuscode: 0, result: null,message: null,status: 0,exception: null),
    boolResponse ??
        BoolResponse(statuscode: 0, result: null),
  ];
}

class AddEditUserInitial extends AddEditUserState {}

class AddEditUserSuccess extends AddEditUserState {
  final BoolResponse? boolResponse;
  final AddUserResult? getSingleUserResponse;
  const AddEditUserSuccess({
    this.boolResponse,
    this.getSingleUserResponse,
  });
}

class AddEditUserLoading extends AddEditUserState {}

class AddEditUserRefresh extends AddEditUserState {}

class AddEditUserFailure extends AddEditUserState {
  final String failure;
  const AddEditUserFailure({
    required this.failure,
  });
}