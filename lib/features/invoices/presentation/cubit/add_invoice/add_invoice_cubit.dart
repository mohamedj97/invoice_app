import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:invoice_app/features/invoices/domain/use_cases/add_invoice_use_case.dart';
import '../../../../../core/api/base_api_response.dart';
import '../../../../../core/utils/enums.dart';
import '../../../data/models/requests/invoice_request_model.dart';

part 'add_invoice_state.dart';

class AddInvoiceCubit extends Cubit<AddInvoiceState> {
  final AddInvoiceUseCase addInvoiceUseCase;
  String username = "";
  String? password;

  AddInvoiceCubit(
      this.addInvoiceUseCase,
      ) : super(AddInvoiceInitial());

  Future<void> addInvoice(InvoiceRequestModel invoiceRequestModel) async {
    emit(AddInvoiceLoading());
    final response = await addInvoiceUseCase.call(invoiceRequestModel);

    response.fold((failure) {
      emit(AddInvoiceFailure(failure: failure.message));

      return emit(
        state.copyWith(
          addInvoiceRequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.statuscode == 200 && response.result != null) {
        emit(AddInvoiceSuccess(stringResponse: response));
        return emit(
          state.copyWith(
            addInvoiceRequestState: RequestState.success,
            stringResponse: response,
          ),
        );
      } else {
        emit(AddInvoiceFailure(failure: response.message ?? ""));
        return emit(
          state.copyWith(
            addInvoiceRequestState: RequestState.error,
            stringResponse: response,
          ),
        );
      }
    });
  }
}
