import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice_app/core/widgets/custom_back_button.dart';
import 'package:invoice_app/features/profile/presentation/widgets/company_subscription_item.dart';
import '../../../../core/assets/colors.dart';
import '../../../../core/assets/image_assets.dart';
import '../../../../core/common_widgets/custom_scaffold.dart';
import '../../../../core/navigation/custom_page_route.dart';
import '../../../../core/popups/error_dialogue.dart';
import '../../../../core/utils/enums.dart';
import '../../../../injection_container.dart';
import '../../../payment/domain/entities/get_company_subscribtions_resutlt.dart';
import '../../../payment/presentation/cubit/payment_cubit.dart';
import '../../../payment/presentation/screens/pricing_screen.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  final cubit = PaymentCubit(sl(), sl(), sl(), sl(), sl());

  @override
  void initState() {
    cubit.getCompanySubscription();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PaymentCubit>.value(
      value: cubit,
      child: BlocConsumer<PaymentCubit, PaymentState>(
        listener: (context, state) async {
          if (state.executePaymentRequestState == RequestState.success) {}
          if (state.companySubscriptionRequestState == RequestState.error && state.getCompanySubscriptionResponse!.statuscode != 405) {
            getErrorDialogue(
              context: context,
              isUnAuthorized: state.getCompanySubscriptionResponse!.statuscode == 401,
              message: state.getCompanySubscriptionResponse?.message?.first ?? "something_went_wrong".tr(),
            );
          }
        },
        builder: (context, state) {
          return CustomScaffold(
            backGroundColor: AppColors.whiteColor,
            leading: const CustomBackButton(),
            title: "subscription".tr(),
            body: state is PaymentLoading
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    ),
                  )
                : state.getCompanySubscriptionResponse?.result?.subscriptionPayment != null &&
                        state.getCompanySubscriptionResponse!.result!.subscriptionPayment.isNotEmpty
                    ? ListView.builder(
                        scrollDirection: Axis.vertical,
                        physics: const ScrollPhysics(),
                        itemCount: state.getCompanySubscriptionResponse?.result?.subscriptionPayment.length ?? 0,
                        itemBuilder: (context, index) {
                          SubscriptionPayment? item =
                              state.getCompanySubscriptionResponse?.result?.subscriptionPayment[index];
                          return CompanySubscriptionItem(invoice: item!);
                        },
                      )
                    : Center(
                        child: SizedBox(
                          height: 200,
                          width: 200,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                CustomPageRoute.createRoute(
                                  page: const PricingScreen(fromProfile: true),
                                ),
                              );
                            },
                            child: Image.asset(
                              ImageAssets.subscribe,
                              color: AppColors.profileItemColor,
                            ),
                          ),
                        ),
                      ),
          );
        },
      ),
    );
  }
}
