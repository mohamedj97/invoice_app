import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/utils/enums.dart';
import '../../domain/entities/add_eta_connection.dart';
import '../../domain/entities/eta_connections_result.dart';
import '../../domain/entities/eta_lookups_result.dart';
import '../../domain/use_cases/add_eta_use_case.dart';
import '../../domain/use_cases/get_eta_lookusp_use_case.dart';
import '../../domain/use_cases/get_eta_use_case.dart';

part 'eta_state.dart';

class ETACubit extends Cubit<ETAState> {
  final AddETAUseCase addETAUseCase;
  final GetETALookupsUseCase getETALookupsUseCase;
  final GetETAUseCase getETAUseCase;

  ETACubit(
    this.addETAUseCase,
    this.getETALookupsUseCase,
    this.getETAUseCase,
  ) : super(ETAInitial());

  Future<void> addETA({required int companyId, required AddETAModel addETAModel}) async {
    emit(ETALoading());
    final response = await addETAUseCase.call(companyId: companyId, addETAModel: addETAModel);

    response.fold((failure) {
      emit(ETAFailure(failure: failure.message));

      return emit(
        state.copyWith(
          addETARequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.statuscode == 200 && response.result != null) {
        emit(ETASuccess(addETAResponse: response));
        return emit(
          state.copyWith(
            addETARequestState: RequestState.success,
            addETAResponse: response,
          ),
        );
      } else {
        emit(ETAFailure(failure: response.message?.first ?? ""));
        return emit(
          state.copyWith(
            addETARequestState: RequestState.error,
            addETAResponse: response,
          ),
        );
      }
    });
  }

  Future<void> getETALookups() async {
    emit(ETALoading());
    final response = await getETALookupsUseCase.call();

    response.fold((failure) {
      emit(ETAFailure(failure: failure.message));

      return emit(
        state.copyWith(
          getETALookupsRequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.statuscode == 200 && response.result != null) {
        emit(ETASuccess(getETALookupsResponse: response));
        return emit(
          state.copyWith(
            getETALookupsRequestState: RequestState.success,
            getETALookupsResponse: response,
          ),
        );
      } else {
        emit(ETAFailure(failure: response.message?.first ?? ""));
        return emit(
          state.copyWith(
            getETALookupsRequestState: RequestState.error,
            getETALookupsResponse: response,
          ),
        );
      }
    });
  }

  Future<void> getETA({required int companyId}) async {
    emit(ETALoading());
    final response = await getETAUseCase.call(companyId: companyId);

    response.fold((failure) {
      emit(ETAFailure(failure: failure.message));

      return emit(
        state.copyWith(
          getETARequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.statuscode == 200 && response.result != null) {
        emit(ETASuccess(getETAResponse: response));
        return emit(
          state.copyWith(
            getETARequestState: RequestState.success,
            getETAResponse: response,
          ),
        );
      } else {
        emit(ETAFailure(failure: response.message?.first ?? ""));
        return emit(
          state.copyWith(
            getETARequestState: RequestState.error,
            getETAResponse: response,
          ),
        );
      }
    });
  }
}
