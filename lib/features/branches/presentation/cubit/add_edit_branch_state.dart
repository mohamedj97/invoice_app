part of 'add_edit_branch_cubit.dart';

class AddEditBranchState extends Equatable {
  final AddBranchResponse? addBranchResponse;
  final BoolResponse? boolResponse;
  final String? failure;
  final RequestState? addBranchRequestState;
  final RequestState? editBranchRequestState;

  const AddEditBranchState({
    this.addBranchResponse,
    this.boolResponse,
    this.addBranchRequestState = RequestState.loading,
    this.editBranchRequestState = RequestState.loading,
    this.failure = "",
  });
  AddEditBranchState copyWith({
    AddBranchResponse? addBranchResponse,
    BoolResponse? boolResponse,
    String? failure,
    RequestState? addBranchRequestState,
    RequestState? editBranchRequestState,
  }) {
    return AddEditBranchState(
      failure: failure ?? this.failure,
      addBranchRequestState: addBranchRequestState ?? this.addBranchRequestState,
      editBranchRequestState: editBranchRequestState ?? this.editBranchRequestState,
      addBranchResponse: addBranchResponse ?? this.addBranchResponse,
      boolResponse: boolResponse ?? this.boolResponse,
    );
  }

  @override
  List<Object?> get props => [
    addBranchRequestState,
    editBranchRequestState,
    failure!,
    addBranchResponse ??
        AddBranchResponse(statuscode: 0, result: null),
    boolResponse ??
        BoolResponse(statuscode: 0, result: null),
  ];
}

class AddEditBranchInitial extends AddEditBranchState {}

class AddEditBranchSuccess extends AddEditBranchState {
  final AddBranchResponse? addBranchResponse;
  final BoolResponse? boolResponse;
  const AddEditBranchSuccess({
    this.addBranchResponse,
    this.boolResponse,
  });
}

class AddEditBranchLoading extends AddEditBranchState {}

class AddEditBranchRefresh extends AddEditBranchState {}

class AddEditBranchFailure extends AddEditBranchState {
  final String failure;
  const AddEditBranchFailure({
    required this.failure,
  });
}