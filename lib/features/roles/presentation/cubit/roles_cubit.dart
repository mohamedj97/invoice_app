import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:invoice_app/features/roles/domain/use_cases/get_features_use_case.dart';
import '../../../../core/utils/enums.dart';
import '../../data/models/responses/get_roles_response_model.dart';
import '../../domain/entities/get_fetaures_result.dart';
import '../../domain/entities/get_single_role_result.dart';
import '../../domain/use_cases/get_roles_use_case.dart';
import '../../domain/use_cases/get_single_role_use_case.dart';

part 'roles_state.dart';

class RolesCubit extends Cubit<RolesState> {
  final GetRolesUseCase getRolesUseCase;
  final GetSingleRoleRoleUseCase getSingleRoleRoleUseCase;
  final GetFeaturesUseCase getFeaturesUseCase;

  RolesCubit(
      this.getRolesUseCase,
      this.getSingleRoleRoleUseCase,
      this.getFeaturesUseCase,
      ) : super(RolesInitial());

  Future<void> getCompanyRoles(int companyId) async {
    emit(RolesLoading());
    final response = await getRolesUseCase.call(companyId);

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

  Future<void> getSingleRole({required int id}) async {
    emit(RolesLoading());
    final response = await getSingleRoleRoleUseCase.call(id: id);

    response.fold((failure) {
      emit(RolesFailure(failure: failure.message));

      return emit(
        state.copyWith(
          getSingleRoleRequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.statuscode == 200 && response.result != null) {
        emit(RolesSuccess(getSingleRoleResponse: response));
        return emit(
          state.copyWith(
            getSingleRoleRequestState: RequestState.success,
            getSingleRoleResponse: response,
          ),
        );
      } else {
        emit(RolesFailure(failure: response.message?.first ?? ""));
        return emit(
          state.copyWith(
            getSingleRoleRequestState: RequestState.error,
            getSingleRoleResponse: response,
          ),
        );
      }
    });
  }

  Future<void> getFeatures() async {
    emit(RolesLoading());
    final response = await getFeaturesUseCase.call();

    response.fold((failure) {
      emit(RolesFailure(failure: failure.message));

      return emit(
        state.copyWith(
          getFeaturesRequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.statuscode == 200 && response.result != null) {
        emit(RolesSuccess(getFeaturesResponse: response));
        return emit(
          state.copyWith(
            getFeaturesRequestState: RequestState.success,
            getFeaturesResponse: response,
          ),
        );
      } else {
        emit(RolesFailure(failure: response.message?.first ?? ""));
        return emit(
          state.copyWith(
            getFeaturesRequestState: RequestState.error,
            getFeaturesResponse: response,
          ),
        );
      }
    });
  }
}
