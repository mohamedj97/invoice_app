import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:invoice_app/core/api/base_api_response.dart';
import 'package:invoice_app/features/branches/data/models/responses/add_branch_response_model.dart';
import 'package:invoice_app/features/branches/domain/entities/company_branch.dart';
import 'package:invoice_app/features/branches/domain/use_cases/add_branch_use_case.dart';
import 'package:invoice_app/features/branches/domain/use_cases/edit_branch_use_case.dart';
import '../../../../core/utils/enums.dart';

part 'add_edit_branch_state.dart';

class AddEditBranchCubit extends Cubit<AddEditBranchState> {
  final AddBranchUseCase addBranchUseCase;
  final EditBranchUseCase editBranchUseCase;

  AddEditBranchCubit(
      this.addBranchUseCase,
      this.editBranchUseCase,
      ) : super(AddEditBranchInitial());

  Future<void> addBranch({required CompanyBranch companyBranch}) async {
    emit(AddEditBranchLoading());
    final response = await addBranchUseCase.call(companyBranch: companyBranch);

    response.fold((failure) {
      emit(AddEditBranchFailure(failure: failure.message));

      return emit(
        state.copyWith(
          addBranchRequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.statuscode == 200 && response.result != null) {
        emit(AddEditBranchSuccess(addBranchResponse: response));
        return emit(
          state.copyWith(
            addBranchRequestState: RequestState.success,
            addBranchResponse: response,
          ),
        );
      } else {
        emit(AddEditBranchFailure(failure: response.message?.first ?? ""));
        return emit(
          state.copyWith(
            addBranchRequestState: RequestState.error,
            addBranchResponse: response,
          ),
        );
      }
    });
  }

  Future<void> editBranch({required int id,required CompanyBranch companyBranch}) async {
    emit(AddEditBranchLoading());
    final response = await editBranchUseCase.call(id: id,companyBranch: companyBranch);

    response.fold((failure) {
      emit(AddEditBranchFailure(failure: failure.message));

      return emit(
        state.copyWith(
          editBranchRequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.statuscode == 200 && response.result != null) {
        emit(AddEditBranchSuccess(boolResponse: response));
        return emit(
          state.copyWith(
            editBranchRequestState: RequestState.success,
            boolResponse: response,
          ),
        );
      } else {
        emit(AddEditBranchFailure(failure: response.message?.first ?? ""));
        return emit(
          state.copyWith(
            editBranchRequestState: RequestState.error,
            boolResponse: response,
          ),
        );
      }
    });
  }

}
