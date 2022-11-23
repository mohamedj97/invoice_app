import 'package:freezed_annotation/freezed_annotation.dart';

import '../error/failure.dart';

part 'api_state.freezed.dart';

@freezed
class ApiState<T> with _$ApiState<T> {
  const factory ApiState.initial() = _Initial<T>;
  const factory ApiState.success(T value) = Data<T>;
  const factory ApiState.loading() = Loading<T>;
  const factory ApiState.noInternet() = NoInternet<T>;
  const factory ApiState.noData() = NoData<T>;
  const factory ApiState.error([Failure? failure]) = ErrorDetails<T>;
}

extension ApiState22<T> on ApiState<T> {
  bool get isInitial => this is _Initial;

  bool get isLoading => this is Loading;

  bool get isSuccess => this is Data;

  bool get isError => this is ErrorDetails;

  bool get noData => this is NoData;

  bool get isNoInternet => this is NoInternet;
}
