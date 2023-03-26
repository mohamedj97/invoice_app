import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../../../../../core/utils/enums.dart';
import '../../../data/data_sources/local_data_sources/auth_local_data_source.dart';
import '../../../data/models/responses/register_response_model.dart';
import '../../../domain/entities/register_request.dart';
import '../../../domain/use_cases/register_usecase.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase registerUseCase;
  final AuthLocalDataSource authLocalDataSource;
  String username = "";
  String? password;
  String? email;
  String? confirmPassword;

  RegisterCubit(
      this.registerUseCase,
      this.authLocalDataSource,
      ) : super(RegisterInitial());

  Future<void> register(RegisterRequest registerRequest) async {
    emit(RegisterLoading());
    final response = await registerUseCase.call(registerRequest);

    response.fold((failure) {
      emit(RegisterFailure(failure: failure.message));

      return emit(
        state.copyWith(
          registerRequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.statuscode == 200 && response.result != null) {
        emit(RegisterSuccess(registerResponse: response));
        authLocalDataSource.updateUserIdAndValidateTime(response);
        return emit(
          state.copyWith(
            registerRequestState: RequestState.success,
            registerResponse: response,
          ),
        );
      } else {
        emit(RegisterFailure(failure: response.message?.first ?? ""));
        return emit(
          state.copyWith(
            registerRequestState: RequestState.error,
            registerResponse: response,
          ),
        );
      }
    });
  }

  validateRegisterForm(GlobalKey<FormBuilderState> formKey) {
    var formState = formKey.currentState;
    if (formState == null) return;
    bool isValid = formState.validate();
    if (!isValid) {
      return;
    }

    formState.save();
    username = formState.value["name"];
    email = formState.value["email"];
    confirmPassword = formState.value["confirm_password"];
    password = formState.value["password"];
  }
}
