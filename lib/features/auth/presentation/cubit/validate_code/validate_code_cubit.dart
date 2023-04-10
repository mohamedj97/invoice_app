import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:invoice_app/features/auth/data/models/responses/register_response_model.dart';
import 'package:invoice_app/features/auth/domain/use_cases/resend_code_usecase.dart';
import '../../../../../core/utils/enums.dart';
import '../../../data/models/responses/validate_code_response_model.dart';
import '../../../domain/use_cases/validate_code_usecase.dart';

part 'validate_code_state.dart';

class ValidateCodeCubit extends Cubit<ValidateCodeState> {
  final ValidateCodeUseCase validateCodeUseCase;
  final ResendCodeUseCase resendCodeUseCase;
  String? otp;
  ValidateCodeCubit(
      this.validateCodeUseCase,
      this.resendCodeUseCase,
      ) : super(ValidateCodeInitial());

  Future<void> validateCode({required int userId,required String securityCode}) async {
    emit(ValidateCodeLoading());
    final response = await validateCodeUseCase.call(userId: userId,securityCode: securityCode);

    response.fold((failure) {
      emit(ValidateCodeFailure(failure: failure.message));

      return emit(
        state.copyWith(
          validateCodeRequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.statuscode == 200 && response.result != null) {
        emit(ValidateCodeSuccess(validateCodeResponse: response));
        return emit(
          state.copyWith(
            validateCodeRequestState: RequestState.success,
            validateCodeResponse: response,
          ),
        );
      } else {
        emit(ValidateCodeFailure(failure: response.message?.first ?? ""));
        return emit(
          state.copyWith(
            validateCodeRequestState: RequestState.error,
            validateCodeResponse: response,
          ),
        );
      }
    });
  }


  Future<void> resendCode({required int userId}) async {
    emit(ValidateCodeLoading());
    final response = await resendCodeUseCase.call(userId: userId);

    response.fold((failure) {
      emit(ValidateCodeFailure(failure: failure.message));

      return emit(
        state.copyWith(
          resendCodeRequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.statuscode == 200 && response.result != null) {
        emit(ValidateCodeSuccess(registerResponse: response));
        return emit(
          state.copyWith(
            resendCodeRequestState: RequestState.success,
            registerResponse: response,
          ),
        );
      } else {
        emit(ValidateCodeFailure(failure: response.message?.first ?? ""));
        return emit(
          state.copyWith(
            resendCodeRequestState: RequestState.error,
            registerResponse: response,
          ),
        );
      }
    });
  }

  validateValidateCodeForm(GlobalKey<FormBuilderState> formKey) {
    var formState = formKey.currentState;
    if (formState == null) return;
    bool isValid = formState.validate();
    if (!isValid) {
      return;
    }
    formState.save();
     otp = formState.value["otp"];
  }
}
