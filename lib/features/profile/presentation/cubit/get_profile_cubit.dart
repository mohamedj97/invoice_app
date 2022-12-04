

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/enums.dart';
import '../../data/models/responses/get_profile_response_model.dart';
import '../../domain/use_cases/get_profile_use_case.dart';

part 'get_profile_state.dart';

class GetProfileCubit extends Cubit<GetProfileState> {
  final GetProfileUseCase getProfileUseCase;
  String username = "";
  String? password;

  GetProfileCubit(
      this.getProfileUseCase,
      ) : super(GetProfileInitial());

  Future<void> getProfile() async {
    emit(GetProfileLoading());
    final response = await getProfileUseCase.call();

    response.fold((failure) {
      emit(GetProfileFailure(failure: failure.message));

      return emit(
        state.copyWith(
          getProfileRequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.statuscode == 200 && response.result != null) {
        emit(GetProfileSuccess(getProfileResponse: response));
        return emit(
          state.copyWith(
            getProfileRequestState: RequestState.success,
            getProfileResponse: response,
          ),
        );
      } else {
        emit(GetProfileFailure(failure: response.message ?? ""));
        return emit(
          state.copyWith(
            getProfileRequestState: RequestState.error,
            getProfileResponse: response,
          ),
        );
      }
    });
  }
}
