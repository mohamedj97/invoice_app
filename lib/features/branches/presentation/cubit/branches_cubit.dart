import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/utils/enums.dart';
import '../../data/models/responses/get_branches_response_model.dart';
import '../../domain/use_cases/get_branches_use_case.dart';

part 'branches_state.dart';

class BranchesCubit extends Cubit<BranchesState> {
  final GetBranchesUseCase getBranchesUseCase;

  BranchesCubit(
      this.getBranchesUseCase,
      ) : super(BranchesInitial());

  Future<void> getCompanyBranches(int companyId) async {
    emit(BranchesLoading());
    final response = await getBranchesUseCase.call(companyId);

    response.fold((failure) {
      emit(BranchesFailure(failure: failure.message));

      return emit(
        state.copyWith(
          getBranchesRequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.statuscode == 200 && response.result != null) {
        emit(BranchesSuccess(getBranchesResponse: response));
        return emit(
          state.copyWith(
            getBranchesRequestState: RequestState.success,
            getBranchesResponse: response,
          ),
        );
      } else {
        emit(BranchesFailure(failure: response.message?.first ?? ""));
        return emit(
          state.copyWith(
            getBranchesRequestState: RequestState.error,
            getBranchesResponse: response,
          ),
        );
      }
    });
  }

}
