// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _PaymentClient implements PaymentClient {
  _PaymentClient(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<SubscriptionPlanModelListGenericResponseResult>
      getSubscriptionPlans() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SubscriptionPlanModelListGenericResponseResult>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'PaymentGateway/getsubscriptionplans',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value =
        SubscriptionPlanModelListGenericResponseResult.fromJson(_result.data!);
    return value;
  }

  @override
  Future<IntResponse> startSubscription(subscriptionPlanId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'SubscriptionPlanId': subscriptionPlanId
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<IntResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'PaymentGateway/startsubscription',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = IntResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PgPaymentMethodListGenericResponseResult> getPaymentMethods() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PgPaymentMethodListGenericResponseResult>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'PaymentGateway/getpaymentmethods',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value =
        PgPaymentMethodListGenericResponseResult.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PaymentGatewayResponseDataGenericResponseResult> executePayment(
    paymentMethodId,
    invoiceId,
    redirectUrl,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'paymentMethodId': paymentMethodId,
      r'invoiceId': invoiceId,
      r'redirectUrl': redirectUrl,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PaymentGatewayResponseDataGenericResponseResult>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'PaymentGateway/executepayment_mobile',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value =
    PaymentGatewayResponseDataGenericResponseResult.fromJson(_result.data!);
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
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjM4ZDNmMmY2LTQyYjgtNGIwZi04YjYyLTEzODUwMjRjYzQxNiIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWUiOiJhZG1pbjEiLCJqdGkiOiIyZDJkZmFmNi1iYzkwLTRiOTAtOTg3ZS0zZjM4MWYwNzRkNWQiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJBZG1pbiIsImV4cCI6MTY4NTMwNTA0NywiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo1MDAwIiwiYXVkIjoiaHR0cDovL2xvY2FsaG9zdDo1MDAwIn0.JlFmmdIgj3UNkO3iEp54ODuaEG7l_oFmDw8Afu22XI4";
      }
    }
    return requestOptions;
  }
}
