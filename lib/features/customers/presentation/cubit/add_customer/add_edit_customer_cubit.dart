import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:invoice_app/core/api/base_api_response.dart';
import '../../../../../core/utils/enums.dart';
import '../../../data/models/requests/customer_request_model.dart';
import '../../../data/models/responses/add_customer_response_model.dart';
import '../../../domain/use_cases/add_customer_use_case.dart';
import '../../../domain/use_cases/edit_customer_use_case.dart';

part 'add_edit_customer_state.dart';

class AddCustomerCubit extends Cubit<AddEditCustomerState> {
  final AddCustomerUseCase addCustomerUseCase;
  final EditCustomerUseCase editCustomerUseCase;
  String username = "";
  String? password;

  AddCustomerCubit(
      this.addCustomerUseCase,
      this.editCustomerUseCase,
      ) : super(AddEditCustomerInitial());

  Future<void> addCustomer(CustomerModelModel customerModel) async {
    emit(AddEditCustomerLoading());
    final response = await addCustomerUseCase.call(customerModel);

    response.fold((failure) {
      emit(AddEditCustomerFailure(failure: failure.message));

      return emit(
        state.copyWith(
          addEditCustomerRequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.statuscode == 200 && response.result != null) {
        emit(AddEditCustomerSuccess(addCustomerResponse: response));
        return emit(
          state.copyWith(
            addEditCustomerRequestState: RequestState.success,
            addCustomerResponse: response,
          ),
        );
      } else {
        emit(AddEditCustomerFailure(failure: response.message ?? ""));
        return emit(
          state.copyWith(
            addEditCustomerRequestState: RequestState.error,
            addCustomerResponse: response,
          ),
        );
      }
    });
  }

  Future<void> editProduct(int id,CustomerModelModel customerModel) async {
    emit(AddEditCustomerLoading());
    final response = await editCustomerUseCase.call(id,customerModel);

    response.fold((failure) {
      emit(AddEditCustomerFailure(failure: failure.message));

      return emit(
        state.copyWith(
          addEditCustomerRequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.statuscode == 200 && response.result != null) {
        emit(AddEditCustomerSuccess(stringResponse: response));
        return emit(
          state.copyWith(
            addEditCustomerRequestState: RequestState.success,
            stringResponse: response,
          ),
        );
      } else {
        emit(AddEditCustomerFailure(failure: response.message ?? ""));
        return emit(
          state.copyWith(
            addEditCustomerRequestState: RequestState.error,
            stringResponse: response,
          ),
        );
      }
    });
  }
}
