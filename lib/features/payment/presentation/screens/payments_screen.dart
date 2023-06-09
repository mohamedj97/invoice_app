import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice_app/core/api/repository/disk_repo.dart';
import 'package:invoice_app/core/common_widgets/custom_scaffold.dart';
import 'package:invoice_app/features/payment/presentation/cubit/payment_cubit.dart';
import 'package:invoice_app/features/payment/presentation/screens/webview_screen.dart';

import '../../../../core/assets/colors.dart';
import '../../../../core/assets/font_assets.dart';
import '../../../../core/common_widgets/lw_custom_text.dart';
import '../../../../core/navigation/custom_page_route.dart';
import '../../../../core/popups/error_dialogue.dart';
import '../../../../core/utils/enums.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/payment_methods_results.dart';

class PaymentScreen extends StatefulWidget {
  final int invoiceId;

  const PaymentScreen({Key? key, required this.invoiceId}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final cubit = PaymentCubit(sl(), sl(), sl(), sl(),sl());
  int selectedIndex = 0;
  List<bool> isSelected = [true, false];

  @override
  void initState() {
    cubit.getPaymentMethods();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PaymentCubit>.value(
      value: cubit,
      child: BlocConsumer<PaymentCubit, PaymentState>(
        listener: (context, state) async {
          if (state.executePaymentRequestState == RequestState.success) {
            Navigator.of(context).push(CustomPageRoute.createRoute(
                page: WebViewScreen(url: state.executePaymentResponse!.result!.paymentData!.redirectTo!)));
          }
          if (state.executePaymentRequestState == RequestState.error) {
            getErrorDialogue(
              context: context,
              isUnAuthorized: state.executePaymentResponse!.statuscode == 401,
              message: state.executePaymentResponse?.message?.first ?? "something_went_wrong".tr(),
            );
          }
        },
        builder: (context, state) {
          return CustomScaffold(
            backGroundColor: AppColors.whiteColor,
            title: "payment".tr(),
            body: state is PaymentLoading
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    ),
                  )
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const ScrollPhysics(),
                    itemCount: state.getPaymentMethodsResponse?.result?.length ?? 0,
                    itemBuilder: (context, index) {
                      PG_PaymentMethod item = state.getPaymentMethodsResponse!.result![index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
                        child: InkWell(
                          onTap: () async {
                            await DiskRepo().ensureInitialized();
                            await BlocProvider.of<PaymentCubit>(context).executePayment(
                              paymentMethodId: item.paymentId,
                              invoiceId: widget.invoiceId,
                              userId: DiskRepo().loadUserId()??0,
                            );
                          },
                          child: Card(
                            color: AppColors.whiteColor,
                            elevation: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Image.network(
                                    item.logo,
                                    height: 50,
                                    width: 50,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(width: 16.0),
                                  LWCustomText(
                                    title: item.nameEn,
                                    color: AppColors.primary,
                                    fontFamily: FontAssets.avertaRegular,
                                  ),
                                ],
                              ),
                            ),
                            // Row(
                            //   children: [
                            //     const SizedBox(width: 8.0),
                            //     // if (item.logo == null)
                            //     //   Padding(
                            //     //     padding: const EdgeInsets.only(bottom: 16.0),
                            //     //     child: Image.asset(
                            //     //       ImageAssets.splashImage,
                            //     //       color: AppColors.primary,
                            //     //       height: 100,
                            //     //       width: 100,
                            //     //     ),
                            //     //   )
                            //     // else
                            //     Expanded(
                            //       child: Image.network(
                            //         item.logo,
                            //         height: 100,
                            //         width: 100,
                            //         fit: BoxFit.cover,
                            //       ),
                            //     ),
                            //     Expanded(
                            //       child: LWCustomText(
                            //         title: item.nameEn,
                            //         color: AppColors.labelColor,
                            //         fontFamily: FontAssets.avertaRegular,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ),
                        ),
                      );
                    },
                  ),
          );
        },
      ),
    );
  }
}
