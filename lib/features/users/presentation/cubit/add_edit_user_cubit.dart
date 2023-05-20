import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:invoice_app/features/users/domain/entities/user_request.dart';
import 'package:invoice_app/features/users/domain/use_cases/add_user_use_case.dart';
import 'package:invoice_app/features/users/domain/use_cases/edit_user_use_case.dart';
import '../../../../core/api/base_api_response.dart';
import '../../../../core/utils/enums.dart';
import '../../data/models/responses/get_single_user_response_model.dart';

part 'add_edit_user_state.dart';

class AddEditUserCubit extends Cubit<AddEditUserState> {
  final AddUserUseCase addUserUseCase;
  final EditUserUseCase editUserUseCase;

  AddEditUserCubit(
    this.addUserUseCase,
    this.editUserUseCase,
  ) : super(AddEditUserInitial());

  Future<void> addUser({required UserRequest userRequest}) async {
    emit(AddEditUserLoading());
    final response = await addUserUseCase.call(userRequest: userRequest);

    response.fold((failure) {
      emit(AddEditUserFailure(failure: failure.message));

      return emit(
        state.copyWith(
          addUserRequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.statuscode == 200 && response.result != null) {
        emit(AddEditUserSuccess(getSingleUserResponse: response));
        return emit(
          state.copyWith(
            addUserRequestState: RequestState.success,
            getSingleUserResponse: response,
          ),
        );
      } else {
        emit(AddEditUserFailure(failure: response.message?.first ?? ""));
        return emit(
          state.copyWith(
            addUserRequestState: RequestState.error,
            getSingleUserResponse: response,
          ),
        );
      }
    });
  }

  Future<void> editUser({required int id, required UserRequest userRequest}) async {
    emit(AddEditUserLoading());
    final response = await editUserUseCase.call(id: id, userRequest: userRequest);

    response.fold((failure) {
      emit(AddEditUserFailure(failure: failure.message));

      return emit(
        state.copyWith(
          editUserRequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.statuscode == 200 && response.result != null) {
        emit(AddEditUserSuccess(boolResponse: response));
        return emit(
          state.copyWith(
            editUserRequestState: RequestState.success,
            boolResponse: response,
          ),
        );
      } else {
        emit(AddEditUserFailure(failure: response.message?.first ?? ""));
        return emit(
          state.copyWith(
            editUserRequestState: RequestState.error,
            boolResponse: response,
          ),
        );
      }
    });
  }
}
