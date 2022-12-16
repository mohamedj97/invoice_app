import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/utils/enums.dart';
import '../../../data/models/requests/customer_request_model.dart';
import '../../../data/models/responses/add_customer_response_model.dart';
import '../../../domain/use_cases/add_customer_use_case.dart';

part 'add_customer_state.dart';

class AddCustomerCubit extends Cubit<AddCustomerState> {
  final AddCustomerUseCase addCustomerUseCase;
  String username = "";
  String? password;

  AddCustomerCubit(
      this.addCustomerUseCase,
      ) : super(AddCustomerInitial());

  Future<void> addCustomer(CustomerModelModel customerModel) async {
    emit(AddCustomerLoading());
    final response = await addCustomerUseCase.call(customerModel);

    response.fold((failure) {
      emit(AddCustomerFailure(failure: failure.message));

      return emit(
        state.copyWith(
          addCustomerRequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.statuscode == 200 && response.result != null) {
        emit(AddCustomerSuccess(addCustomerResponse: response));
        return emit(
          state.copyWith(
            addCustomerRequestState: RequestState.success,
            addCustomerResponse: response,
          ),
        );
      } else {
        emit(AddCustomerFailure(failure: response.message ?? ""));
        return emit(
          state.copyWith(
            addCustomerRequestState: RequestState.error,
            addCustomerResponse: response,
          ),
        );
      }
    });
  }
}
