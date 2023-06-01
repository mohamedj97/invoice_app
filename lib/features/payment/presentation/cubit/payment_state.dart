part of 'payment_cubit.dart';

class PaymentState extends Equatable {
  final SubscriptionPlanModelListGenericResponseResult? getSubscriptionPlansResponse;
  final PgPaymentMethodListGenericResponseResult? getPaymentMethodsResponse;
  final PaymentGatewayResponseDataGenericResponseResult? executePaymentResponse;
  final IntResponse? startSubscriptionResponse;
  final RequestState? getSubscriptionPlansRequestState;
  final String? failure;
  final RequestState? getPaymentMethodsRequestState;
  final RequestState? executePaymentRequestState;
  final RequestState? startSubscriptionRequestState;

  const PaymentState({
    this.getSubscriptionPlansResponse,
    this.executePaymentResponse,
    this.getPaymentMethodsResponse,
    this.startSubscriptionResponse,
    this.getSubscriptionPlansRequestState = RequestState.loading,
    this.executePaymentRequestState = RequestState.loading,
    this.getPaymentMethodsRequestState = RequestState.loading,
    this.startSubscriptionRequestState = RequestState.loading,
    this.failure = "",
  });
  PaymentState copyWith({
     SubscriptionPlanModelListGenericResponseResult? getSubscriptionPlansResponse,
    PgPaymentMethodListGenericResponseResult? getPaymentMethodsResponse,
    PaymentGatewayResponseDataGenericResponseResult? executePaymentResponse,
     IntResponse? startSubscriptionResponse,
     RequestState? getSubscriptionPlansRequestState,
     String? failure,
     RequestState? getPaymentMethodsRequestState,
     RequestState? executePaymentRequestState,
     RequestState? startSubscriptionRequestState,
  }) {
    return PaymentState(
      failure: failure ?? this.failure,
      getSubscriptionPlansResponse: getSubscriptionPlansResponse ?? this.getSubscriptionPlansResponse,
      executePaymentResponse: executePaymentResponse ?? this.executePaymentResponse,
      getPaymentMethodsResponse: getPaymentMethodsResponse ?? this.getPaymentMethodsResponse,
      startSubscriptionResponse: startSubscriptionResponse ?? this.startSubscriptionResponse,
      getSubscriptionPlansRequestState: getSubscriptionPlansRequestState ?? this.getSubscriptionPlansRequestState,
      getPaymentMethodsRequestState: getPaymentMethodsRequestState ?? this.getPaymentMethodsRequestState,
      startSubscriptionRequestState: startSubscriptionRequestState ?? this.startSubscriptionRequestState,
      executePaymentRequestState: executePaymentRequestState ?? this.executePaymentRequestState,
    );
  }

  @override
  List<Object?> get props => [
    startSubscriptionRequestState,
    getPaymentMethodsRequestState,
    executePaymentRequestState,
    getSubscriptionPlansRequestState,
    failure!,
    startSubscriptionResponse ??
        IntResponse(statuscode: 0, result: null),
    getSubscriptionPlansResponse ??
        SubscriptionPlanModelListGenericResponseResult(statuscode: 0, result: null, status: null, message: []),
    getPaymentMethodsResponse ??
        SubscriptionPlanModelListGenericResponseResult(statuscode: 0, result: null, status: null, message: []),

    executePaymentResponse ??
        PaymentGatewayResponseDataGenericResponseResult(statuscode: 0, result: null, status: null, message: [], exception: null),
  ];
}

class PaymentInitial extends PaymentState {}

class PaymentSuccess extends PaymentState {
  final SubscriptionPlanModelListGenericResponseResult? getSubscriptionPlansResponse;
  final PgPaymentMethodListGenericResponseResult? getPaymentMethodsResponse;
  final PaymentGatewayResponseDataGenericResponseResult? executePaymentResponse;
  final IntResponse? startSubscriptionResponse;
  const PaymentSuccess({
    this.getSubscriptionPlansResponse,
    this.executePaymentResponse,
    this.getPaymentMethodsResponse,
    this.startSubscriptionResponse,
  });
}

class PaymentLoading extends PaymentState {}

class PaymentRefresh extends PaymentState {}

class PaymentFailure extends PaymentState {
  final String failure;
  const PaymentFailure({
    required this.failure,
  });
}