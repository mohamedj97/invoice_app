import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:invoice_app/features/users/data/models/responses/get_single_user_response_model.dart';
import 'package:invoice_app/features/users/domain/use_cases/get_single_user_use_case.dart';
import '../../../../core/utils/enums.dart';
import '../../data/models/responses/get_users_response_model.dart';
import '../../domain/use_cases/get_users_use_case.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  final GetUsersUseCase getUsersUseCase;
  final GetSingleUserUseCase getSingleUserUseCase;

  UsersCubit(
      this.getUsersUseCase,
      this.getSingleUserUseCase,
      ) : super(UsersInitial());

  Future<void> getCompanyUsers() async {
    emit(UsersLoading());
    final response = await getUsersUseCase.call();

    response.fold((failure) {
      emit(UsersFailure(failure: failure.message));

      return emit(
        state.copyWith(
          getUsersRequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.statuscode == 200 && response.result != null) {
        emit(UsersSuccess(getUsersResponse: response));
        return emit(
          state.copyWith(
            getUsersRequestState: RequestState.success,
            getUsersResponse: response,
          ),
        );
      } else {
        emit(UsersFailure(failure: response.message?.first ?? ""));
        return emit(
          state.copyWith(
            getUsersRequestState: RequestState.error,
            getUsersResponse: response,
          ),
        );
      }
    });
  }


  Future<void> getSingleUser({required int id}) async {
    emit(UsersLoading());
    final response = await getSingleUserUseCase.call(id: id);

    response.fold((failure) {
      emit(UsersFailure(failure: failure.message));

      return emit(
        state.copyWith(
          getSingleUserRequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.statuscode == 200 && response.result != null) {
        emit(UsersSuccess(getSingleUserResponse: response));
        return emit(
          state.copyWith(
            getSingleUserRequestState: RequestState.success,
            getSingleUserResponse: response,
          ),
        );
      } else {
        emit(UsersFailure(failure: response.message?.first ?? ""));
        return emit(
          state.copyWith(
            getSingleUserRequestState: RequestState.error,
            getSingleUserResponse: response,
          ),
        );
      }
    });
  }

}
