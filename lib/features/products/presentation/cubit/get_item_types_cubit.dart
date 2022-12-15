import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/utils/enums.dart';
import '../../data/models/responses/get_item_types_response_model.dart';
import '../../domain/use_cases/get_types_use_case.dart';

part 'get_item_types_state.dart';

class GetItemTypesCubit extends Cubit<GetItemTypesState> {
  final GetItemTypesUseCase getItemTypesUseCase;
  String username = "";
  String? password;

  GetItemTypesCubit(
      this.getItemTypesUseCase,
      ) : super(GetItemTypesInitial());

  Future<void> getProducts() async {
    emit(GetItemTypesLoading());
    final response = await getItemTypesUseCase.call();

    response.fold((failure) {
      emit(GetItemTypesFailure(failure: failure.message));

      return emit(
        state.copyWith(
          getItemTypesRequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.statuscode == 200 && response.result != null) {
        emit(GetItemTypesSuccess(getItemTypesResponse: response));
        return emit(
          state.copyWith(
            getItemTypesRequestState: RequestState.success,
            getItemTypesResponse: response,
          ),
        );
      } else {
        emit(GetItemTypesFailure(failure: response.message ?? ""));
        return emit(
          state.copyWith(
            getItemTypesRequestState: RequestState.error,
            getItemTypesResponse: response,
          ),
        );
      }
    });
  }
}
