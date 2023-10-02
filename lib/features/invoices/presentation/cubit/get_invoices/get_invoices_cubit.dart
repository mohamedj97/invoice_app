import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:invoice_app/core/api/base_api_response.dart';
import 'package:invoice_app/features/invoices/domain/use_cases/delete_invoice_use_case.dart';
import 'package:invoice_app/features/invoices/domain/use_cases/get_invoices_use_case.dart';
import 'package:invoice_app/features/invoices/domain/use_cases/get_single_invoice_use_case.dart';

import '../../../../../core/utils/enums.dart';
import '../../../data/models/requests/get_invoices_request_model.dart';
import '../../../data/models/responses/get_invoices_response_model.dart';
import '../../../data/models/responses/get_single_invoice_response_model.dart';

part 'get_invoices_state.dart';

class GetInvoicesCubit extends Cubit<GetInvoicesState> {
  final GetInvoicesUseCase getInvoicesUseCase;
  final DeleteInvoiceUseCase deleteInvoiceUseCase;
  final GetSingleInvoiceUseCase getSingleInvoiceUseCase;

  GetInvoicesCubit(
    this.getInvoicesUseCase,
    this.getSingleInvoiceUseCase,
    this.deleteInvoiceUseCase,
  ) : super(GetInvoicesInitial());

  Future<void> getInvoices(InvoiceFilterGenericFilterModel invoiceFilterGenericFilterModel) async {
    emit(GetInvoicesLoading());
    final response = await getInvoicesUseCase.call(invoiceFilterGenericFilterModel);

    response.fold((failure) {
      emit(GetInvoicesFailure(failure: failure.message));

      return emit(
        state.copyWith(
          getInvoicesRequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.statuscode == 200 && response.result != null) {
        emit(GetInvoicesSuccess(getInvoicesResponse: response));
        return emit(
          state.copyWith(
            getInvoicesRequestState: RequestState.success,
            getInvoicesResponse: response,
          ),
        );
      } else {
        emit(GetInvoicesFailure(failure: response.message?.first ?? ""));
        return emit(
          state.copyWith(
            getInvoicesRequestState: RequestState.error,
            getInvoicesResponse: response,
          ),
        );
      }
    });
  }

  Future<void> getSingleInvoice({required int id}) async {
    emit(GetInvoicesLoading());
    final response = await getSingleInvoiceUseCase.call(id);

    response.fold((failure) {
      emit(GetInvoicesFailure(failure: failure.message));

      return emit(
        state.copyWith(
          getInvoicesRequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.statuscode == 200 && response.result != null) {
        emit(GetInvoicesSuccess(getSingleInvoiceResponse: response));
        return emit(
          state.copyWith(
            getInvoicesRequestState: RequestState.success,
            getSingleInvoiceResponse: response,
          ),
        );
      } else {
        emit(GetInvoicesFailure(failure: response.message?.first ?? ""));
        return emit(
          state.copyWith(
            getInvoicesRequestState: RequestState.error,
            getSingleInvoiceResponse: response,
          ),
        );
      }
    });
  }

  Future<void> deleteInvoice({required int id}) async {
    emit(GetInvoicesLoading());
    final response = await deleteInvoiceUseCase.call(id);

    response.fold((failure) {
      emit(GetInvoicesFailure(failure: failure.message));

      return emit(
        state.copyWith(
          deleteInvoiceRequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.statuscode == 200 && response.result != null) {
        emit(GetInvoicesSuccess(deleteInvoiceResponse: response));
        return emit(
          state.copyWith(
            deleteInvoiceRequestState: RequestState.success,
            deleteInvoiceResponse: response,
          ),
        );
      } else {
        emit(GetInvoicesFailure(failure: response.message?.first ?? ""));
        return emit(
          state.copyWith(
            deleteInvoiceRequestState: RequestState.error,
            deleteInvoiceResponse: response,
          ),
        );
      }
    });
  }
}
