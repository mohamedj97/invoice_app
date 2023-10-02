import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:invoice_app/core/api/base_api_response.dart';
import 'package:invoice_app/features/change_company/domain/use_cases/change_company_use_case.dart';
import '../../../../core/utils/enums.dart';
import '../../domain/entities/get_company_users_result.dart';
import '../../domain/use_cases/get_user_companies_use_case.dart';

part 'change_company_state.dart';

class ChangeCompanyCubit extends Cubit<ChangeCompanyState> {
  final ChangeCompanyUseCase changeCompanyUseCase;
  final GetUserCompaniesUseCase getUserCompaniesUseCase;

  ChangeCompanyCubit(
      this.changeCompanyUseCase,
      this.getUserCompaniesUseCase,
      ) : super(ChangeCompanyInitial());

  Future<void> getUserCompanies() async {
    emit(ChangeCompanyLoading());
    final response = await getUserCompaniesUseCase.call();

    response.fold((failure) {
      emit(ChangeCompanyFailure(failure: failure.message));

      return emit(
        state.copyWith(
          getUsersCompaniesRequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.statuscode == 200 && response.companies != null) {
        emit(ChangeCompanySuccess(getUsersCompaniesResponse: response));
        return emit(
          state.copyWith(
            getUsersCompaniesRequestState: RequestState.success,
            getUsersCompaniesResponse: response,
          ),
        );
      } else {
        emit(ChangeCompanyFailure(failure: response.message?.first ?? ""));
        return emit(
          state.copyWith(
            getUsersCompaniesRequestState: RequestState.error,
            getUsersCompaniesResponse: response,
          ),
        );
      }
    });
  }

  Future<void> changeCompany({required int companyId}) async {
    emit(ChangeCompanyLoading());
    final response = await changeCompanyUseCase.call(companyId: companyId);

    response.fold((failure) {
      emit(ChangeCompanyFailure(failure: failure.message));

      return emit(
        state.copyWith(
          changeCompanyRequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.statuscode == 200 && response.result != null) {
        emit(ChangeCompanySuccess(changeCompanyResponse: response));
        return emit(
          state.copyWith(
            changeCompanyRequestState: RequestState.success,
            changeCompanyResponse: response,
          ),
        );
      } else {
        emit(ChangeCompanyFailure(failure: response.message?.first ?? ""));
        return emit(
          state.copyWith(
            changeCompanyRequestState: RequestState.error,
            changeCompanyResponse: response,
          ),
        );
      }
    });
  }
}