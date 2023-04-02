// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customers_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _CustomersClient implements CustomersClient {
  _CustomersClient(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<GetCustomersResponse> getCustomers(
      customerFilterGenericFilterModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(customerFilterGenericFilterModel.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetCustomersResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Customers/getcustomers',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetCustomersResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetCustomerTypesResponse> getCustomersLookUps() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetCustomerTypesResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Customers/getCustomer-lookups',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetCustomerTypesResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AddCustomerResponse> addCustomer(customerModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(customerModel.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AddCustomerResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Customers',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AddCustomerResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<StringResponse> editCustomer(
    id,
    customerModel,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(customerModel.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<StringResponse>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Customers/$id',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = StringResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
        requestOptions.headers["Authorization"] =
        "Bearer ${MemoryRepo().tokensData?.token ?? ""}";
      }
    }
    return requestOptions;
  }
}
