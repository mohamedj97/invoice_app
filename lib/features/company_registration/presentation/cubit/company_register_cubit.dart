import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:invoice_app/core/api/base_api_response.dart';
import 'package:invoice_app/features/company_registration/domain/use_cases/register_company_usecase.dart';

import '../../../../../core/utils/enums.dart';
import '../../data/models/requests/company_register_request_model.dart';
import '../../data/models/responses/get_company_lookups_response_model.dart';
import '../../domain/use_cases/get_company_lookups_usecase.dart';

part 'company_register_state.dart';

class CompanyRegisterCubit extends Cubit<CompanyRegisterState> {
  final RegisterCompanyUseCase registerCompanyUseCase;
  final GetCompanyLookupsUseCase getCompanyLookupsUseCase;

  CompanyRegisterCubit(
    this.registerCompanyUseCase,
    this.getCompanyLookupsUseCase,
  ) : super(CompanyRegisterInitial());

  Future<void> registerCompany(
      {required CompanyRegisterRequestModel companyRegisterRequest, required int userId}) async {
    emit(CompanyRegisterLoading());
    final response = await registerCompanyUseCase.call(companyRegisterRequest: companyRegisterRequest, userId: userId);

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

  Future<void> getCompanyLookups({required int userId}) async {
    emit(CompanyRegisterLoading());
    final response = await getCompanyLookupsUseCase.call(userId: userId);

    response.fold((failure) {
      emit(CompanyRegisterFailure(failure: failure.message));

      return emit(
        state.copyWith(
          companyLookupsRequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.statuscode == 200 && response.result != null) {
        emit(CompanyRegisterSuccess(getCompanyLookupsResponse: response));
        return emit(
          state.copyWith(
            companyLookupsRequestState: RequestState.success,
            getCompanyLookupsResponse: response,
          ),
        );
      } else {
        emit(CompanyRegisterFailure(failure: response.message?.first ?? ""));
        return emit(
          state.copyWith(
            companyLookupsRequestState: RequestState.error,
            getCompanyLookupsResponse: response,
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
