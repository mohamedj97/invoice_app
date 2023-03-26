import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../core/utils/enums.dart';
import '../../../data/data_sources/local_data_sources/auth_local_data_source.dart';
import '../../../data/models/responses/login_response_model.dart';
import '../../../domain/entities/login_request.dart';
import '../../../domain/use_cases/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  final AuthLocalDataSource authLocalDataSource;
  String username = "";
  String? password;

  LoginCubit(
    this.loginUseCase,
    this.authLocalDataSource,
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
      if (response.statuscode == 200 && response.result != null) {
        emit(LoginSuccess(loginResponse: response));
        authLocalDataSource.updateTokenData(response);
        return emit(
          state.copyWith(
            loginRequestState: RequestState.success,
            loginResponse: response,
          ),
        );
      } else {
        emit(LoginFailure(failure: response.message?.first ?? ""));
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
    username = formState.value["username"];
    password = formState.value["password"];
  }
}
