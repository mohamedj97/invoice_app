import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/utils/enums.dart';
import '../../../data/models/responses/get_customers_response_model.dart';
import '../../../domain/use_cases/get_customers_use_case.dart';

part 'get_customers_state.dart';

class GetCustomersCubit extends Cubit<GetCustomersState> {
  final GetCustomersUseCase getCustomersUseCase;

  GetCustomersCubit(
      this.getCustomersUseCase,
      ) : super(GetCustomersInitial());

  Future<void> getCustomers() async {
    emit(GetCustomersLoading());
    final response = await getCustomersUseCase.call();

    response.fold((failure) {
      emit(GetCustomersFailure(failure: failure.message));

      return emit(
        state.copyWith(
          getCustomersRequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.statuscode == 200 && response.result != null) {
        emit(GetCustomersSuccess(getCustomersResponse: response));
        return emit(
          state.copyWith(
            getCustomersRequestState: RequestState.success,
            getCustomersResponse: response,
          ),
        );
      } else {
        emit(GetCustomersFailure(failure: response.message ?? ""));
        return emit(
          state.copyWith(
            getCustomersRequestState: RequestState.error,
            getCustomersResponse: response,
          ),
        );
      }
    });
  }
}
