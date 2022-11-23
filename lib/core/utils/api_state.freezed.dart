// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'api_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ApiState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(T value) success,
    required TResult Function() loading,
    required TResult Function() noInternet,
    required TResult Function() noData,
    required TResult Function(Failure? failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(T value)? success,
    TResult? Function()? loading,
    TResult? Function()? noInternet,
    TResult? Function()? noData,
    TResult? Function(Failure? failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(T value)? success,
    TResult Function()? loading,
    TResult Function()? noInternet,
    TResult Function()? noData,
    TResult Function(Failure? failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Data<T> value) success,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(NoInternet<T> value) noInternet,
    required TResult Function(NoData<T> value) noData,
    required TResult Function(ErrorDetails<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Data<T> value)? success,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(NoInternet<T> value)? noInternet,
    TResult? Function(NoData<T> value)? noData,
    TResult? Function(ErrorDetails<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Data<T> value)? success,
    TResult Function(Loading<T> value)? loading,
    TResult Function(NoInternet<T> value)? noInternet,
    TResult Function(NoData<T> value)? noData,
    TResult Function(ErrorDetails<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiStateCopyWith<T, $Res> {
  factory $ApiStateCopyWith(
          ApiState<T> value, $Res Function(ApiState<T>) then) =
      _$ApiStateCopyWithImpl<T, $Res, ApiState<T>>;
}

/// @nodoc
class _$ApiStateCopyWithImpl<T, $Res, $Val extends ApiState<T>>
    implements $ApiStateCopyWith<T, $Res> {
  _$ApiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<T, $Res> {
  factory _$$_InitialCopyWith(
          _$_Initial<T> value, $Res Function(_$_Initial<T>) then) =
      __$$_InitialCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<T, $Res>
    extends _$ApiStateCopyWithImpl<T, $Res, _$_Initial<T>>
    implements _$$_InitialCopyWith<T, $Res> {
  __$$_InitialCopyWithImpl(
      _$_Initial<T> _value, $Res Function(_$_Initial<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial<T> implements _Initial<T> {
  const _$_Initial();

  @override
  String toString() {
    return 'ApiState<$T>.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(T value) success,
    required TResult Function() loading,
    required TResult Function() noInternet,
    required TResult Function() noData,
    required TResult Function(Failure? failure) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(T value)? success,
    TResult? Function()? loading,
    TResult? Function()? noInternet,
    TResult? Function()? noData,
    TResult? Function(Failure? failure)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(T value)? success,
    TResult Function()? loading,
    TResult Function()? noInternet,
    TResult Function()? noData,
    TResult Function(Failure? failure)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Data<T> value) success,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(NoInternet<T> value) noInternet,
    required TResult Function(NoData<T> value) noData,
    required TResult Function(ErrorDetails<T> value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Data<T> value)? success,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(NoInternet<T> value)? noInternet,
    TResult? Function(NoData<T> value)? noData,
    TResult? Function(ErrorDetails<T> value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Data<T> value)? success,
    TResult Function(Loading<T> value)? loading,
    TResult Function(NoInternet<T> value)? noInternet,
    TResult Function(NoData<T> value)? noData,
    TResult Function(ErrorDetails<T> value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements ApiState<T> {
  const factory _Initial() = _$_Initial<T>;
}

/// @nodoc
abstract class _$$DataCopyWith<T, $Res> {
  factory _$$DataCopyWith(_$Data<T> value, $Res Function(_$Data<T>) then) =
      __$$DataCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T value});
}

/// @nodoc
class __$$DataCopyWithImpl<T, $Res>
    extends _$ApiStateCopyWithImpl<T, $Res, _$Data<T>>
    implements _$$DataCopyWith<T, $Res> {
  __$$DataCopyWithImpl(_$Data<T> _value, $Res Function(_$Data<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$Data<T>(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$Data<T> implements Data<T> {
  const _$Data(this.value);

  @override
  final T value;

  @override
  String toString() {
    return 'ApiState<$T>.success(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Data<T> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataCopyWith<T, _$Data<T>> get copyWith =>
      __$$DataCopyWithImpl<T, _$Data<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(T value) success,
    required TResult Function() loading,
    required TResult Function() noInternet,
    required TResult Function() noData,
    required TResult Function(Failure? failure) error,
  }) {
    return success(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(T value)? success,
    TResult? Function()? loading,
    TResult? Function()? noInternet,
    TResult? Function()? noData,
    TResult? Function(Failure? failure)? error,
  }) {
    return success?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(T value)? success,
    TResult Function()? loading,
    TResult Function()? noInternet,
    TResult Function()? noData,
    TResult Function(Failure? failure)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Data<T> value) success,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(NoInternet<T> value) noInternet,
    required TResult Function(NoData<T> value) noData,
    required TResult Function(ErrorDetails<T> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Data<T> value)? success,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(NoInternet<T> value)? noInternet,
    TResult? Function(NoData<T> value)? noData,
    TResult? Function(ErrorDetails<T> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Data<T> value)? success,
    TResult Function(Loading<T> value)? loading,
    TResult Function(NoInternet<T> value)? noInternet,
    TResult Function(NoData<T> value)? noData,
    TResult Function(ErrorDetails<T> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Data<T> implements ApiState<T> {
  const factory Data(final T value) = _$Data<T>;

  T get value;
  @JsonKey(ignore: true)
  _$$DataCopyWith<T, _$Data<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingCopyWith<T, $Res> {
  factory _$$LoadingCopyWith(
          _$Loading<T> value, $Res Function(_$Loading<T>) then) =
      __$$LoadingCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$LoadingCopyWithImpl<T, $Res>
    extends _$ApiStateCopyWithImpl<T, $Res, _$Loading<T>>
    implements _$$LoadingCopyWith<T, $Res> {
  __$$LoadingCopyWithImpl(
      _$Loading<T> _value, $Res Function(_$Loading<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Loading<T> implements Loading<T> {
  const _$Loading();

  @override
  String toString() {
    return 'ApiState<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Loading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(T value) success,
    required TResult Function() loading,
    required TResult Function() noInternet,
    required TResult Function() noData,
    required TResult Function(Failure? failure) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(T value)? success,
    TResult? Function()? loading,
    TResult? Function()? noInternet,
    TResult? Function()? noData,
    TResult? Function(Failure? failure)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(T value)? success,
    TResult Function()? loading,
    TResult Function()? noInternet,
    TResult Function()? noData,
    TResult Function(Failure? failure)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Data<T> value) success,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(NoInternet<T> value) noInternet,
    required TResult Function(NoData<T> value) noData,
    required TResult Function(ErrorDetails<T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Data<T> value)? success,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(NoInternet<T> value)? noInternet,
    TResult? Function(NoData<T> value)? noData,
    TResult? Function(ErrorDetails<T> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Data<T> value)? success,
    TResult Function(Loading<T> value)? loading,
    TResult Function(NoInternet<T> value)? noInternet,
    TResult Function(NoData<T> value)? noData,
    TResult Function(ErrorDetails<T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading<T> implements ApiState<T> {
  const factory Loading() = _$Loading<T>;
}

/// @nodoc
abstract class _$$NoInternetCopyWith<T, $Res> {
  factory _$$NoInternetCopyWith(
          _$NoInternet<T> value, $Res Function(_$NoInternet<T>) then) =
      __$$NoInternetCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$NoInternetCopyWithImpl<T, $Res>
    extends _$ApiStateCopyWithImpl<T, $Res, _$NoInternet<T>>
    implements _$$NoInternetCopyWith<T, $Res> {
  __$$NoInternetCopyWithImpl(
      _$NoInternet<T> _value, $Res Function(_$NoInternet<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NoInternet<T> implements NoInternet<T> {
  const _$NoInternet();

  @override
  String toString() {
    return 'ApiState<$T>.noInternet()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoInternet<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(T value) success,
    required TResult Function() loading,
    required TResult Function() noInternet,
    required TResult Function() noData,
    required TResult Function(Failure? failure) error,
  }) {
    return noInternet();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(T value)? success,
    TResult? Function()? loading,
    TResult? Function()? noInternet,
    TResult? Function()? noData,
    TResult? Function(Failure? failure)? error,
  }) {
    return noInternet?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(T value)? success,
    TResult Function()? loading,
    TResult Function()? noInternet,
    TResult Function()? noData,
    TResult Function(Failure? failure)? error,
    required TResult orElse(),
  }) {
    if (noInternet != null) {
      return noInternet();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Data<T> value) success,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(NoInternet<T> value) noInternet,
    required TResult Function(NoData<T> value) noData,
    required TResult Function(ErrorDetails<T> value) error,
  }) {
    return noInternet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Data<T> value)? success,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(NoInternet<T> value)? noInternet,
    TResult? Function(NoData<T> value)? noData,
    TResult? Function(ErrorDetails<T> value)? error,
  }) {
    return noInternet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Data<T> value)? success,
    TResult Function(Loading<T> value)? loading,
    TResult Function(NoInternet<T> value)? noInternet,
    TResult Function(NoData<T> value)? noData,
    TResult Function(ErrorDetails<T> value)? error,
    required TResult orElse(),
  }) {
    if (noInternet != null) {
      return noInternet(this);
    }
    return orElse();
  }
}

abstract class NoInternet<T> implements ApiState<T> {
  const factory NoInternet() = _$NoInternet<T>;
}

/// @nodoc
abstract class _$$NoDataCopyWith<T, $Res> {
  factory _$$NoDataCopyWith(
          _$NoData<T> value, $Res Function(_$NoData<T>) then) =
      __$$NoDataCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$NoDataCopyWithImpl<T, $Res>
    extends _$ApiStateCopyWithImpl<T, $Res, _$NoData<T>>
    implements _$$NoDataCopyWith<T, $Res> {
  __$$NoDataCopyWithImpl(_$NoData<T> _value, $Res Function(_$NoData<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NoData<T> implements NoData<T> {
  const _$NoData();

  @override
  String toString() {
    return 'ApiState<$T>.noData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoData<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(T value) success,
    required TResult Function() loading,
    required TResult Function() noInternet,
    required TResult Function() noData,
    required TResult Function(Failure? failure) error,
  }) {
    return noData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(T value)? success,
    TResult? Function()? loading,
    TResult? Function()? noInternet,
    TResult? Function()? noData,
    TResult? Function(Failure? failure)? error,
  }) {
    return noData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(T value)? success,
    TResult Function()? loading,
    TResult Function()? noInternet,
    TResult Function()? noData,
    TResult Function(Failure? failure)? error,
    required TResult orElse(),
  }) {
    if (noData != null) {
      return noData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Data<T> value) success,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(NoInternet<T> value) noInternet,
    required TResult Function(NoData<T> value) noData,
    required TResult Function(ErrorDetails<T> value) error,
  }) {
    return noData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Data<T> value)? success,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(NoInternet<T> value)? noInternet,
    TResult? Function(NoData<T> value)? noData,
    TResult? Function(ErrorDetails<T> value)? error,
  }) {
    return noData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Data<T> value)? success,
    TResult Function(Loading<T> value)? loading,
    TResult Function(NoInternet<T> value)? noInternet,
    TResult Function(NoData<T> value)? noData,
    TResult Function(ErrorDetails<T> value)? error,
    required TResult orElse(),
  }) {
    if (noData != null) {
      return noData(this);
    }
    return orElse();
  }
}

abstract class NoData<T> implements ApiState<T> {
  const factory NoData() = _$NoData<T>;
}

/// @nodoc
abstract class _$$ErrorDetailsCopyWith<T, $Res> {
  factory _$$ErrorDetailsCopyWith(
          _$ErrorDetails<T> value, $Res Function(_$ErrorDetails<T>) then) =
      __$$ErrorDetailsCopyWithImpl<T, $Res>;
  @useResult
  $Res call({Failure? failure});
}

/// @nodoc
class __$$ErrorDetailsCopyWithImpl<T, $Res>
    extends _$ApiStateCopyWithImpl<T, $Res, _$ErrorDetails<T>>
    implements _$$ErrorDetailsCopyWith<T, $Res> {
  __$$ErrorDetailsCopyWithImpl(
      _$ErrorDetails<T> _value, $Res Function(_$ErrorDetails<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(_$ErrorDetails<T>(
      freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc

class _$ErrorDetails<T> implements ErrorDetails<T> {
  const _$ErrorDetails([this.failure]);

  @override
  final Failure? failure;

  @override
  String toString() {
    return 'ApiState<$T>.error(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorDetails<T> &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorDetailsCopyWith<T, _$ErrorDetails<T>> get copyWith =>
      __$$ErrorDetailsCopyWithImpl<T, _$ErrorDetails<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(T value) success,
    required TResult Function() loading,
    required TResult Function() noInternet,
    required TResult Function() noData,
    required TResult Function(Failure? failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(T value)? success,
    TResult? Function()? loading,
    TResult? Function()? noInternet,
    TResult? Function()? noData,
    TResult? Function(Failure? failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(T value)? success,
    TResult Function()? loading,
    TResult Function()? noInternet,
    TResult Function()? noData,
    TResult Function(Failure? failure)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Data<T> value) success,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(NoInternet<T> value) noInternet,
    required TResult Function(NoData<T> value) noData,
    required TResult Function(ErrorDetails<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Data<T> value)? success,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(NoInternet<T> value)? noInternet,
    TResult? Function(NoData<T> value)? noData,
    TResult? Function(ErrorDetails<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Data<T> value)? success,
    TResult Function(Loading<T> value)? loading,
    TResult Function(NoInternet<T> value)? noInternet,
    TResult Function(NoData<T> value)? noData,
    TResult Function(ErrorDetails<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorDetails<T> implements ApiState<T> {
  const factory ErrorDetails([final Failure? failure]) = _$ErrorDetails<T>;

  Failure? get failure;
  @JsonKey(ignore: true)
  _$$ErrorDetailsCopyWith<T, _$ErrorDetails<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
