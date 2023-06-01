import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice_app/core/assets/font_assets.dart';
import 'package:invoice_app/core/common_widgets/custom_elevated_button.dart';
import 'package:invoice_app/core/common_widgets/custom_scaffold.dart';
import 'package:invoice_app/core/common_widgets/lw_custom_text.dart';
import 'package:invoice_app/features/payment/presentation/cubit/payment_cubit.dart';
import 'package:invoice_app/features/payment/presentation/screens/payments_screen.dart';

import '../../../../core/assets/colors.dart';
import '../../../../core/navigation/custom_page_route.dart';
import '../../../../core/popups/error_dialogue.dart';
import '../../../../core/utils/enums.dart';
import '../../../../injection_container.dart';
import '../../../auth/presentation/screens/login_screen.dart';
import '../../domain/entities/subscription_plans_model.dart';
import '../widgets/pricing_item.dart';

class PricingScreen extends StatefulWidget {
  const PricingScreen({Key? key}) : super(key: key);

  @override
  State<PricingScreen> createState() => _PricingScreenState();
}

class _PricingScreenState extends State<PricingScreen> {
  final cubit = PaymentCubit(sl(), sl(), sl(), sl());
  int selectedIndex = 0;
  int paymentMethodId = -1;
  List<bool> isSelected = [true, false];

  @override
  void initState() {
    cubit.getSubscriptionPlans();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PaymentCubit>.value(
      value: cubit,
      child: BlocConsumer<PaymentCubit, PaymentState>(
        listener: (context, state) async {
          if (state.startSubscriptionRequestState == RequestState.success) {
            Navigator.of(context).push(CustomPageRoute.createRoute(
                page: PaymentScreen(
                    invoiceId: state.startSubscriptionResponse?.result ?? 1, paymentMethodId: paymentMethodId)));
          }
          if (state.startSubscriptionRequestState == RequestState.error) {
            getErrorDialogue(
              context: context,
              isUnAuthorized: state.startSubscriptionResponse!.statuscode == 401,
              message: state.startSubscriptionResponse?.message?.first ?? "something_went_wrong".tr(),
            );
          }
        },
        builder: (context, state) {
          return CustomScaffold(
            backGroundColor: AppColors.whiteColor,
            title: "pricing".tr(),
            body: state is PaymentLoading
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    ),
                  )
                : state.getSubscriptionPlansResponse?.result == null
                    ? const Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: const ScrollPhysics(),
                              itemCount: state.getSubscriptionPlansResponse!.result!.length,
                              itemBuilder: (context, index) {
                                if (index % 2 == 0) {
                                  selectedIndex == 1;
                                }
                                SubscriptionPlanModel item = state.getSubscriptionPlansResponse!.result![index];
                                return Column(
                                  children: [
                                    const SizedBox(height: 8.0),
                                    Center(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.pricingTextColor,
                                          borderRadius: const BorderRadius.all(Radius.circular(15)),
                                          border: Border.all(color: AppColors.pricingTextColor, width: 1.5),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                selectedIndex = 1;
                                              });
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    selectedIndex == 1 ? AppColors.primary : AppColors.pricingTextColor,
                                                borderRadius: const BorderRadius.all(Radius.circular(15)),
                                                border: Border.all(color: AppColors.pricingTextColor, width: 1.5),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(16.0),
                                                child: LWCustomText(
                                                  title: item.subscriptionTypeName ?? "",
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.whiteColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                        width:MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              color: AppColors.primary,
                                              border: Border.all(
                                                color: AppColors.searchBarColor,
                                              ),
                                              borderRadius: const BorderRadius.all(Radius.circular(15))),
                                          child: Column(
                                            children: [
                                              const SizedBox(height: 16.0),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  LWCustomText(
                                                    title: item.name ?? "",
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: FontAssets.avertaSemiBold,
                                                    fontSize: 25.0,
                                                    color: AppColors.whiteColor,
                                                  ),
                                                  const SizedBox(height: 8.0),
                                                  LWCustomText(
                                                    title: item.comment ?? "",
                                                    fontFamily: FontAssets.avertaSemiBold,
                                                    fontSize: 15.0,
                                                    color: AppColors.whiteColor,
                                                  ),
                                                  const SizedBox(height: 16.0),
                                                  Container(
                                                    decoration: const BoxDecoration(color: AppColors.whiteColor),
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(16.0),
                                                      child: LWCustomText(
                                                        title: "${item.price} ${"currency_egp".tr()}",
                                                        fontWeight: FontWeight.bold,
                                                        fontFamily: FontAssets.avertaSemiBold,
                                                        fontSize: 25.0,
                                                        color: AppColors.primary,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 16.0),
                                                  const Divider(
                                                    thickness: 0.5,
                                                    height: 2.0,
                                                    color: AppColors.searchBarColor,
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 16.0),
                                              Expanded(
                                                child: SizedBox(
                                                  width:MediaQuery.of(context).size.width,
                                                  child: ListView.builder(
                                                    scrollDirection: Axis.vertical,
                                                    itemCount: item.planFeatures.length,
                                                    shrinkWrap: true,
                                                    itemBuilder: (context, index) {
                                                      var feature = item.planFeatures[index];
                                                      return PricingItem(
                                                          title: feature.name,
                                                          iconColor: AppColors.whiteColor,
                                                          textColor: AppColors.whiteColor);
                                                    },
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 8.0),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                                                child: SizedBox(
                                                  width:double.infinity,
                                                  child: CustomElevatedButton(
                                                    title: "get_started".tr(),
                                                    color: AppColors.whiteColor,
                                                    textColor: AppColors.primary,
                                                    onPressed: () async {
                                                      setState(() {
                                                        paymentMethodId = item.id;
                                                      });
                                                      await BlocProvider.of<PaymentCubit>(context)
                                                          .startSubscription(subscriptionPlanId: item.id);
                                                    },
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 8.0),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: CustomElevatedButton(
                                  title: "free_trial".tr(),
                                  onPressed: () {
                                    Navigator.of(context).pushAndRemoveUntil(
                                      CustomPageRoute.createRoute(
                                        page: const LoginScreen(),
                                      ),
                                      (Route<dynamic> route) => false,
                                    );
                                  },
                                )),
                          ),
                        ],
                      ),
          );
        },
      ),
    );
  }
}
