import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:invoice_app/core/api/base_api_response.dart';
import 'package:invoice_app/features/roles/domain/use_cases/add_role_use_case.dart';
import 'package:invoice_app/features/roles/domain/use_cases/edit_role_use_case.dart';
import '../../../../core/utils/enums.dart';
import '../../domain/entities/get_single_role_result.dart';
import '../../domain/entities/role.dart';

part 'add_edit_role_state.dart';

class AddEditRoleCubit extends Cubit<AddEditRoleState> {
  final AddRoleUseCase addRoleUseCase;
  final EditRoleUseCase editRoleUseCase;

  AddEditRoleCubit(
      this.addRoleUseCase,
      this.editRoleUseCase,
      ) : super(AddEditRoleInitial());

  Future<void> addRole({required Role role}) async {
    emit(AddEditRoleLoading());
    final response = await addRoleUseCase.call(role: role);

    response.fold((failure) {
      emit(AddEditRoleFailure(failure: failure.message));

      return emit(
        state.copyWith(
          addRoleRequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.statuscode == 200 && response.result != null) {
        emit(AddEditRoleSuccess(getSingleRoleResponse: response));
        return emit(
          state.copyWith(
            addRoleRequestState: RequestState.success,
            getSingleRoleResponse: response,
          ),
        );
      } else {
        emit(AddEditRoleFailure(failure: response.message?.first ?? ""));
        return emit(
          state.copyWith(
            addRoleRequestState: RequestState.error,
            getSingleRoleResponse: response,
          ),
        );
      }
    });
  }

  Future<void> editRole({required int id,required Role role}) async {
    emit(AddEditRoleLoading());
    final response = await editRoleUseCase.call(id: id,role: role);

    response.fold((failure) {
      emit(AddEditRoleFailure(failure: failure.message));

      return emit(
        state.copyWith(
          editRoleRequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.statuscode == 200 && response.result != null) {
        emit(AddEditRoleSuccess(boolResponse: response));
        return emit(
          state.copyWith(
            editRoleRequestState: RequestState.success,
            boolResponse: response,
          ),
        );
      } else {
        emit(AddEditRoleFailure(failure: response.message?.first ?? ""));
        return emit(
          state.copyWith(
            editRoleRequestState: RequestState.error,
            boolResponse: response,
          ),
        );
      }
    });
  }

}
