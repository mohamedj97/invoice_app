import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/utils/enums.dart';
import '../../../data/models/responses/get_invoices_types_response_model.dart';
import '../../../domain/use_cases/get_invoice_types_use_case.dart';

part 'get_invoice_types_state.dart';

class GetInvoiceTypesCubit extends Cubit<GetInvoiceTypesState> {
  final GetInvoiceTypesUseCase getInvoiceTypesUseCase;
  String username = "";
  String? password;

  GetInvoiceTypesCubit(
      this.getInvoiceTypesUseCase,
      ) : super(GetInvoiceTypesInitial());

  Future<void> getInvoicesLookups() async {
    emit(GetInvoiceTypesLoading());
    final response = await getInvoiceTypesUseCase.call();

    response.fold((failure) {
      emit(GetInvoiceTypesFailure(failure: failure.message));

      return emit(
        state.copyWith(
          getInvoiceTypesRequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.statuscode == 200 && response.result != null) {
        emit(GetInvoiceTypesSuccess(getInvoiceTypesResponse: response));
        return emit(
          state.copyWith(
            getInvoiceTypesRequestState: RequestState.success,
            getInvoiceTypesResponse: response,
          ),
        );
      } else {
        emit(GetInvoiceTypesFailure(failure: response.message?.first ?? ""));
        return emit(
          state.copyWith(
            getInvoiceTypesRequestState: RequestState.error,
            getInvoiceTypesResponse: response,
          ),
        );
      }
    });
  }
}
