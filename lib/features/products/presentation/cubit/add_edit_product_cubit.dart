import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:invoice_app/core/api/base_api_response.dart';
import 'package:invoice_app/features/products/data/models/requests/product_request_model.dart';
import 'package:invoice_app/features/products/domain/use_cases/edit_product_use_case.dart';
import '../../../../../core/utils/enums.dart';
import '../../data/models/responses/add_product_response_model.dart';
import '../../domain/use_cases/add_product_usecase.dart';

part 'add_edit_product_state.dart';

class AddEditProductCubit extends Cubit<AddEditProductState> {
  final AddProductUseCase addProductUseCase;
  final EditProductUseCase editProductUseCase;
  String username = "";
  String? password;

  AddEditProductCubit(
      this.addProductUseCase,
      this.editProductUseCase,
      ) : super(AddEditProductInitial());

  Future<void> addProduct(ProductModel productModel) async {
    emit(AddEditProductLoading());
    final response = await addProductUseCase.call(productModel);

    response.fold((failure) {
      emit(AddEditProductFailure(failure: failure.message));

      return emit(
        state.copyWith(
          addProductRequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.statuscode == 200 && response.result != null) {
        emit(AddEditProductSuccess(addProductResponse: response));
        return emit(
          state.copyWith(
            addProductRequestState: RequestState.success,
            addProductResponse: response,
          ),
        );
      } else {
        emit(AddEditProductFailure(failure: response.message?.first ?? ""));
        return emit(
          state.copyWith(
            addProductRequestState: RequestState.error,
            addProductResponse: response,
          ),
        );
      }
    });
  }

  Future<void> editProduct(int id,ProductModel productModel) async {
    emit(AddEditProductLoading());
    final response = await editProductUseCase.call(id,productModel);

    response.fold((failure) {
      emit(AddEditProductFailure(failure: failure.message));

      return emit(
        state.copyWith(
          editProductRequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.statuscode == 200 && response.result != null) {
        emit(AddEditProductSuccess(boolResponse: response));
        return emit(
          state.copyWith(
            editProductRequestState: RequestState.success,
            boolResponse: response,
          ),
        );
      } else {
        emit(AddEditProductFailure(failure: response.message?.first ?? ""));
        return emit(
          state.copyWith(
            editProductRequestState: RequestState.error,
            boolResponse: response,
          ),
        );
      }
    });
  }
}
