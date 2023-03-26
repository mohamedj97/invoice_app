import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:invoice_app/features/products/data/models/responses/get_products_response_model.dart';
import 'package:invoice_app/features/products/domain/use_cases/get_products_use_case.dart';

import '../../../../../core/utils/enums.dart';

part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  final GetProductsUseCase getProductsUseCase;
  String username = "";
  String? password;

  GetProductsCubit(
      this.getProductsUseCase,
      ) : super(GetProductsInitial());

  Future<void> getProducts() async {
    emit(GetProductsLoading());
    final response = await getProductsUseCase.call();

    response.fold((failure) {
      emit(GetProductsFailure(failure: failure.message));

      return emit(
        state.copyWith(
          getProductsRequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.statuscode == 200 && response.result != null) {
        emit(GetProductsSuccess(getProductsResponse: response));
        return emit(
          state.copyWith(
            getProductsRequestState: RequestState.success,
            getProductsResponse: response,
          ),
        );
      } else {
        emit(GetProductsFailure(failure: response.message?.first ?? ""));
        return emit(
          state.copyWith(
            getProductsRequestState: RequestState.error,
            getProductsResponse: response,
          ),
        );
      }
    });
  }
}
