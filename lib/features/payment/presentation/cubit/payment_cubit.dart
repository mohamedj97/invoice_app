import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:invoice_app/core/api/base_api_response.dart';
import '../../../../core/utils/enums.dart';
import '../../domain/entities/excute_payment_result.dart';
import '../../domain/entities/get_company_subscribtions_resutlt.dart';
import '../../domain/entities/payment_methods_results.dart';
import '../../domain/entities/subscription_plans_model.dart';
import '../../domain/use_cases/execuste_paymnet_use_case.dart';
import '../../domain/use_cases/get_company_subscribtion_use_case.dart';
import '../../domain/use_cases/get_payment_method_use_case.dart';
import '../../domain/use_cases/get_subscription_plans_use_case.dart';
import '../../domain/use_cases/start_subscriptions_plans.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final ExecutePaymentUseCase executePaymentUseCase;
  final GetPaymentMethodsUseCase getPaymentMethodsUseCase;
  final GetSubscriptionPlansUseCase getSubscriptionPlansUseCase;
  final StartSubscriptionPlansUseCase startSubscriptionPlansUseCase;
  final GetCompanySubscriptionUseCase getCompanySubscriptionUseCase;

  PaymentCubit(
      this.executePaymentUseCase,
      this.getCompanySubscriptionUseCase,
      this.getPaymentMethodsUseCase,
      this.getSubscriptionPlansUseCase,
      this.startSubscriptionPlansUseCase,
      ) : super(PaymentInitial());

  Future<void> getSubscriptionPlans() async {
    emit(PaymentLoading());
    final response = await getSubscriptionPlansUseCase.call();

    response.fold((failure) {
      emit(PaymentFailure(failure: failure.message));

      return emit(
        state.copyWith(
          getSubscriptionPlansRequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.statuscode == 200 && response.result != null) {
        emit(PaymentSuccess(getSubscriptionPlansResponse: response));
        return emit(
          state.copyWith(
            getSubscriptionPlansRequestState: RequestState.success,
            getSubscriptionPlansResponse: response,
          ),
        );
      } else {
        emit(PaymentFailure(failure: response.message?.first ?? ""));
        return emit(
          state.copyWith(
            getSubscriptionPlansRequestState: RequestState.error,
            getSubscriptionPlansResponse: response,
          ),
        );
      }
    });
  }

  Future<void> startSubscription({required int subscriptionPlanId,required int userId}) async {
    emit(PaymentLoading());
    final response = await startSubscriptionPlansUseCase.call(subscriptionPlanId: subscriptionPlanId,userId: userId);

    response.fold((failure) {
      emit(PaymentFailure(failure: failure.message));

      return emit(
        state.copyWith(
          startSubscriptionRequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.statuscode == 200 && response.result != null) {
        emit(PaymentSuccess(startSubscriptionResponse: response));
        return emit(
          state.copyWith(
            startSubscriptionRequestState: RequestState.success,
            startSubscriptionResponse: response,
          ),
        );
      } else {
        emit(PaymentFailure(failure: response.message?.first ?? ""));
        return emit(
          state.copyWith(
            startSubscriptionRequestState: RequestState.error,
            startSubscriptionResponse: response,
          ),
        );
      }
    });
  }

  Future<void> getPaymentMethods() async {
    emit(PaymentLoading());
    final response = await getPaymentMethodsUseCase.call();

    response.fold((failure) {
      emit(PaymentFailure(failure: failure.message));

      return emit(
        state.copyWith(
          getPaymentMethodsRequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.statuscode == 200 && response.result != null) {
        emit(PaymentSuccess(getPaymentMethodsResponse: response));
        return emit(
          state.copyWith(
            getPaymentMethodsRequestState: RequestState.success,
            getPaymentMethodsResponse: response,
          ),
        );
      } else {
        emit(PaymentFailure(failure: response.message?.first ?? ""));
        return emit(
          state.copyWith(
            getPaymentMethodsRequestState: RequestState.error,
            getPaymentMethodsResponse: response,
          ),
        );
      }
    });
  }

  Future<void> getCompanySubscription() async {
    emit(PaymentLoading());
    final response = await getCompanySubscriptionUseCase.call();

    response.fold((failure) {
      emit(PaymentFailure(failure: failure.message));

      return emit(
        state.copyWith(
          companySubscriptionRequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.statuscode == 200) {
        emit(PaymentSuccess(getCompanySubscriptionResponse: response));
        return emit(
          state.copyWith(
            companySubscriptionRequestState: RequestState.success,
            getCompanySubscriptionResponse: response,
          ),
        );
      } else {
        emit(PaymentFailure(failure: response.message?.first ?? ""));
        return emit(
          state.copyWith(
            companySubscriptionRequestState: RequestState.error,
            getCompanySubscriptionResponse: response,
          ),
        );
      }
    });
  }


  Future<void>  executePayment({required int paymentMethodId, required int invoiceId, required int userId}) async {
    emit(PaymentLoading());
    final response = await executePaymentUseCase.call(invoiceId: invoiceId,paymentMethodId: paymentMethodId,userId: userId);

    response.fold((failure) {
      emit(PaymentFailure(failure: failure.message));

      return emit(
        state.copyWith(
          executePaymentRequestState: RequestState.error,
          failure: failure.message,
        ),
      );
    }, (response) {
      if (response.statuscode == 200 && response.result != null) {
        emit(PaymentSuccess(executePaymentResponse: response));
        return emit(
          state.copyWith(
            executePaymentRequestState: RequestState.success,
            executePaymentResponse: response,
          ),
        );
      } else {
        emit(PaymentFailure(failure: response.message?.first ?? ""));
        return emit(
          state.copyWith(
            executePaymentRequestState: RequestState.error,
            executePaymentResponse: response,
          ),
        );
      }
    });
  }

}
