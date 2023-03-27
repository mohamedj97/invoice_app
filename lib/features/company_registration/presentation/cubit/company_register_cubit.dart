import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:invoice_app/core/api/base_api_response.dart';
import 'package:invoice_app/features/company_registration/domain/use_cases/register_company_usecase.dart';

import '../../../../../core/utils/enums.dart';
import '../../data/models/requests/company_register_request_model.dart';


part 'company_register_state.dart';

class CompanyRegisterCubit extends Cubit<CompanyRegisterState> {
  final RegisterCompanyUseCase registerCompanyUseCase;


  CompanyRegisterCubit(
      this.registerCompanyUseCase,
      ) : super(CompanyRegisterInitial());

  Future<void> registerCompany({required CompanyRegisterRequestModel companyRegisterRequest, required int userId}) async {
    emit(CompanyRegisterLoading());
    final response = await registerCompanyUseCase.call(companyRegisterRequest: companyRegisterRequest,userId: userId);

    response.fold((failure) {
      emit(CompanyRegisterFailure(failure: failure.message));

      return emit(
        state.copyWith(
          companyRegisterRequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.statuscode == 200 && response.result != null) {
        emit(CompanyRegisterSuccess(intResponse: response));
        return emit(
          state.copyWith(
            companyRegisterRequestState: RequestState.success,
            intResponse: response,
          ),
        );
      } else {
        emit(CompanyRegisterFailure(failure: response.message?.first ?? ""));
        return emit(
          state.copyWith(
            companyRegisterRequestState: RequestState.error,
            intResponse: response,
          ),
        );
      }
    });
  }

  validateRegisterCompanyForm(GlobalKey<FormBuilderState> formKey) {
    var formState = formKey.currentState;
    if (formState == null) return;
    bool isValid = formState.validate();
    if (!isValid) {
      return;
    }

    formState.save();
    // username = formState.value["username"];
    // password = formState.value["password"];
  }
}
