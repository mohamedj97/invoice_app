import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/utils/enums.dart';
import '../../data/models/responses/get_users_response_model.dart';
import '../../domain/use_cases/get_users_use_case.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  final GetUsersUseCase getUsersUseCase;

  UsersCubit(
      this.getUsersUseCase,
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

}
