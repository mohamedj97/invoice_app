import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:invoice_app/features/customers/domain/use_cases/get_customer_types_use_case.dart';
import '../../../../../core/utils/enums.dart';
import '../../../data/models/responses/get_customer_types_response_model.dart';

part 'get_customer_types_state.dart';

class GetCustomerTypesCubit extends Cubit<GetCustomerTypesState> {
  final GetCustomerTypesUseCase getCustomerTypesUseCase;
  String username = "";
  String? password;

  GetCustomerTypesCubit(
      this.getCustomerTypesUseCase,
      ) : super(GetCustomerTypesInitial());

  Future<void> getCustomersLookUps() async {
    emit(GetCustomerTypesLoading());
    final response = await getCustomerTypesUseCase.call();

    response.fold((failure) {
      emit(GetCustomerTypesFailure(failure: failure.message));

      return emit(
        state.copyWith(
          getCustomerTypesRequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.statuscode == 200 && response.result != null) {
        emit(GetCustomerTypesSuccess(getCustomerTypesResponse: response));
        return emit(
          state.copyWith(
            getCustomerTypesRequestState: RequestState.success,
            getCustomerTypesResponse: response,
          ),
        );
      } else {
        emit(GetCustomerTypesFailure(failure: response.message?.first ?? ""));
        return emit(
          state.copyWith(
            getCustomerTypesRequestState: RequestState.error,
            getCustomerTypesResponse: response,
          ),
        );
      }
    });
  }
}
