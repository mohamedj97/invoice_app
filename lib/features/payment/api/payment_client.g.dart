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
  Future<CompanySubscriptionResult> getCompanySubscription() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CompanySubscriptionResult>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'PaymentGateway/getcompanysubscription',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CompanySubscriptionResult.fromJson(_result.data!);
    return value;
  }

  @override
  Future<IntResponse> startSubscription(
    subscriptionPlanId,
    userId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'SubscriptionPlanId': subscriptionPlanId,
      r'userId': userId,
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
    userId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'paymentMethodId': paymentMethodId,
      r'invoiceId': invoiceId,
      r'userId': userId,
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
        "Bearer ${MemoryRepo().tokensData?.token ?? ""}";
      }
    }
    return requestOptions;
  }
}
