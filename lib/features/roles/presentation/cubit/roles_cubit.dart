import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/utils/enums.dart';
import '../../data/models/responses/get_roles_response_model.dart';
import '../../domain/use_cases/get_roles_use_case.dart';

part 'roles_state.dart';

class RolesCubit extends Cubit<RolesState> {
  final GetRolesUseCase getRolesUseCase;

  RolesCubit(
      this.getRolesUseCase,
      ) : super(RolesInitial());

  Future<void> getCompanyRoles() async {
    emit(RolesLoading());
    final response = await getRolesUseCase.call();

    response.fold((failure) {
      emit(RolesFailure(failure: failure.message));

      return emit(
        state.copyWith(
          getRolesRequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.statuscode == 200 && response.result != null) {
        emit(RolesSuccess(getRolesResponse: response));
        return emit(
          state.copyWith(
            getRolesRequestState: RequestState.success,
            getRolesResponse: response,
          ),
        );
      } else {
        emit(RolesFailure(failure: response.message?.first ?? ""));
        return emit(
          state.copyWith(
            getRolesRequestState: RequestState.error,
            getRolesResponse: response,
          ),
        );
      }
    });
  }

}
