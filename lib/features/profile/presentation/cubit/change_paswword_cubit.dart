import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice_app/features/profile/domain/entities/change_password_request.dart';
import 'package:invoice_app/features/profile/domain/use_cases/change_password_usecase.dart';
import '../../../../core/api/base_api_response.dart';
import '../../../../core/utils/enums.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final ChangePasswordUseCase changePasswordUseCase;
  String username = "";
  String? password;

  ChangePasswordCubit(
      this.changePasswordUseCase,
      ) : super(ChangePasswordInitial());

  Future<void> changePassword(ChangePasswordRequest changePasswordRequest) async {
    emit(ChangePasswordLoading());
    final response = await changePasswordUseCase.call(changePasswordRequest);

    response.fold((failure) {
      emit(ChangePasswordFailure(failure: failure.message));

      return emit(
        state.copyWith(
         changePasswordRequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.statuscode == 200 && response.result != null) {
        emit(ChangePasswordSuccess(stringResponse: response));
        return emit(
          state.copyWith(
            changePasswordRequestState: RequestState.success,
            stringResponse: response,
          ),
        );
      } else {
        emit(ChangePasswordFailure(failure: response.message?.first ?? ""));
        return emit(
          state.copyWith(
            changePasswordRequestState: RequestState.error,
            stringResponse: response,
          ),
        );
      }
    });
  }
}
