part of 'add_edit_role_cubit.dart';

class AddEditRoleState extends Equatable {
  final BoolResponse? boolResponse;
  final GetSingleRoleResponse? getSingleRoleResponse;
  final String? failure;
  final RequestState? addRoleRequestState;
  final RequestState? editRoleRequestState;

  const AddEditRoleState({
    this.boolResponse,
    this.getSingleRoleResponse,
    this.addRoleRequestState = RequestState.loading,
    this.editRoleRequestState = RequestState.loading,
    this.failure = "",
  });
  AddEditRoleState copyWith({
    BoolResponse? boolResponse,
    GetSingleRoleResponse? getSingleRoleResponse,
    String? failure,
    RequestState? addRoleRequestState,
    RequestState? editRoleRequestState,
  }) {
    return AddEditRoleState(
      failure: failure ?? this.failure,
      addRoleRequestState: addRoleRequestState ?? this.addRoleRequestState,
      editRoleRequestState: editRoleRequestState ?? this.editRoleRequestState,
      boolResponse: boolResponse ?? this.boolResponse,
      getSingleRoleResponse: getSingleRoleResponse ?? this.getSingleRoleResponse,
    );
  }

  @override
  List<Object?> get props => [
    addRoleRequestState,
    editRoleRequestState,
    failure!,
    boolResponse ??
        BoolResponse(statuscode: 0, result: null),
    getSingleRoleResponse ??
        GetSingleRoleResponse(statuscode: 0, result: null),
  ];
}

class AddEditRoleInitial extends AddEditRoleState {}

class AddEditRoleSuccess extends AddEditRoleState {
  final BoolResponse? boolResponse;
  final GetSingleRoleResponse? getSingleRoleResponse;
  const AddEditRoleSuccess({
    this.boolResponse,
    this.getSingleRoleResponse,
  });
}

class AddEditRoleLoading extends AddEditRoleState {}

class AddEditRoleRefresh extends AddEditRoleState {}

class AddEditRoleFailure extends AddEditRoleState {
  final String failure;
  const AddEditRoleFailure({
    required this.failure,
  });
}