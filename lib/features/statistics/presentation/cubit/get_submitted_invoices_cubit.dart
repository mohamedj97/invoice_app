import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:invoice_app/features/statistics/domain/use_cases/get_recieved_invoices_use_case.dart';
import 'package:invoice_app/features/statistics/domain/use_cases/get_submitted_invoices_use_case.dart';
import '../../../../../core/utils/enums.dart';
import '../../data/responses/get_submitted_invoices_response_model.dart';
import '../../domain/entities/invoices_totals.dart';

part 'get_submitted_invoices_state.dart';

class GetSubmittedInvoicesCubit extends Cubit<GetSubmittedInvoicesState> {
  final GetReceivedInvoiceUseCase getReceivedInvoiceUseCase;
  final GetSubmittedInvoiceUseCase getSubmittedInvoiceUseCase;
  List<InvoicesTotals> invoiceTotals = [];

  GetSubmittedInvoicesCubit(
    this.getReceivedInvoiceUseCase,
    this.getSubmittedInvoiceUseCase,
  ) : super(GetSubmittedInvoicesInitial());

  Future<void> getSubmittedInvoices() async {
    invoiceTotals.clear();
    emit(GetSubmittedInvoicesLoading());
    final response = await getSubmittedInvoiceUseCase.call();

    response.fold((failure) {
      emit(GetSubmittedInvoicesFailure(failure: failure.message));

      return emit(
        state.copyWith(
          getSubmittedInvoicesRequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.statuscode == 200 && response.result != null) {
        invoiceTotals
            .add(response.result!.total_Daily);
        invoiceTotals
            .add(response.result!.total_Monthly);
        invoiceTotals
            .add(response.result!.total_Yearly);
        emit(GetSubmittedInvoicesSuccess(getSubmittedInvoiceResponse: response));
        return emit(
          state.copyWith(
            getSubmittedInvoicesRequestState: RequestState.success,
            getSubmittedInvoiceResponse: response,
          ),
        );
      } else {
        invoiceTotals.clear();
        emit(GetSubmittedInvoicesFailure(failure: response.message?.first ?? ""));
        return emit(
          state.copyWith(
            getSubmittedInvoicesRequestState: RequestState.error,
            getSubmittedInvoiceResponse: response,
          ),
        );
      }
    });
  }

  Future<void> getReceivedInvoices() async {
    emit(GetSubmittedInvoicesLoading());
    final response = await getReceivedInvoiceUseCase.call();

    response.fold((failure) {
      invoiceTotals.clear();
      emit(GetSubmittedInvoicesFailure(failure: failure.message));

      return emit(
        state.copyWith(
          getSubmittedInvoicesRequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.statuscode == 200 && response.result != null) {
        invoiceTotals
            .add(response.result!.total_Daily);
        invoiceTotals
            .add(response.result!.total_Monthly);
        invoiceTotals
            .add(response.result!.total_Yearly);
        emit(GetSubmittedInvoicesSuccess(getSubmittedInvoiceResponse: response));
        return emit(
          state.copyWith(
            getSubmittedInvoicesRequestState: RequestState.success,
            getSubmittedInvoiceResponse: response,
          ),
        );
      } else {
        invoiceTotals.clear();
        emit(GetSubmittedInvoicesFailure(failure: response.message?.first ?? ""));
        return emit(
          state.copyWith(
            getSubmittedInvoicesRequestState: RequestState.error,
            getSubmittedInvoiceResponse: response,
          ),
        );
      }
    });
  }
}
