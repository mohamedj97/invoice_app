import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:invoice_app/features/invoices/domain/use_cases/get_invoices_use_case.dart';

import '../../../../../core/utils/enums.dart';
import '../../../data/models/responses/get_invoices_response_model.dart';

part 'get_invoices_state.dart';

class GetInvoicesCubit extends Cubit<GetInvoicesState> {
  final GetInvoicesUseCase getInvoicesUseCase;
  String username = "";
  String? password;

  GetInvoicesCubit(
      this.getInvoicesUseCase,
      ) : super(GetInvoicesInitial());

  Future<void> getInvoices() async {
    emit(GetInvoicesLoading());
    final response = await getInvoicesUseCase.call();

    response.fold((failure) {
      emit(GetInvoicesFailure(failure: failure.message));

      return emit(
        state.copyWith(
          getInvoicesRequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.statusCode == 200 && response.result != null) {
        emit(GetInvoicesSuccess(getInvoicesResponse: response));
        return emit(
          state.copyWith(
            getInvoicesRequestState: RequestState.success,
            getInvoicesResponse: response,
          ),
        );
      } else {
        emit(GetInvoicesFailure(failure: response.errorMessage ?? ""));
        return emit(
          state.copyWith(
            getInvoicesRequestState: RequestState.error,
            getInvoicesResponse: response,
          ),
        );
      }
    });
  }
}
