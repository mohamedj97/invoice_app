import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../core/utils/enums.dart';
import '../../../data/models/responses/login_response_model.dart';
import '../../../domain/entities/login_request.dart';
import '../../../domain/use_cases/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  //final AuthLocalDataSource authLocalDataSource;
  String email = "";
  String? password;

  LoginCubit(
    this.loginUseCase,
    //this.authLocalDataSource,
  ) : super(LoginInitial());

  Future<void> login(LoginRequest loginRequest) async {
    emit(LoginLoading());
    final response = await loginUseCase.call(loginRequest);

    response.fold((failure) {
      emit(LoginFailure(failure: failure.message));

      return emit(
        state.copyWith(
          loginRequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.status && response.result != null) {
        emit(LoginSuccess(loginResponse: response));
        //authLocalDataSource.updateTokenData(response.result);
        return emit(
          state.copyWith(
            loginRequestState: RequestState.success,
            loginResponse: response,
          ),
        );
      } else {
        emit(LoginFailure(failure: response.errorMessage!));
        return emit(
          state.copyWith(
            loginRequestState: RequestState.error,
            loginResponse: response,
          ),
        );
      }
    });
  }

  validateLoginForm(GlobalKey<FormBuilderState> formKey) {
    var formState = formKey.currentState;
    if (formState == null) return;
    bool isValid = formState.validate();
    if (!isValid) {
      return;
    }

    formState.save();
    email = formState.value["email"];
    password = formState.value["password"];
  }
}
