import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:invoice_app/features/products/data/models/requests/product_request_model.dart';
import '../../../../../core/utils/enums.dart';
import '../../data/models/responses/add_product_response_model.dart';
import '../../domain/use_cases/add_product_usecase.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  final AddProductUseCase addProductUseCase;
  String username = "";
  String? password;

  AddProductCubit(
      this.addProductUseCase,
      ) : super(AddProductInitial());

  Future<void> addProduct(ProductModel productModel) async {
    emit(AddProductLoading());
    final response = await addProductUseCase.call(productModel);

    response.fold((failure) {
      emit(AddProductFailure(failure: failure.message));

      return emit(
        state.copyWith(
          addProductRequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.statuscode == 200 && response.result != null) {
        emit(AddProductSuccess(addProductResponse: response));
        return emit(
          state.copyWith(
            addProductRequestState: RequestState.success,
            addProductResponse: response,
          ),
        );
      } else {
        emit(AddProductFailure(failure: response.message ?? ""));
        return emit(
          state.copyWith(
            addProductRequestState: RequestState.error,
            addProductResponse: response,
          ),
        );
      }
    });
  }
}
