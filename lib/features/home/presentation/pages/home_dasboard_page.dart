import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice_app/core/api/repository/disk_repo.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/core/assets/font_assets.dart';
import 'package:invoice_app/core/assets/icon_assets.dart';
import 'package:invoice_app/core/common_widgets/lw_custom_text.dart';
import 'package:invoice_app/features/splash/presentation/widgets/splash_scaffold.dart';
import '../../../../core/assets/image_assets.dart';
import '../../../../core/popups/error_dialogue.dart';
import '../../../../core/utils/enums.dart';
import '../../../../injection_container.dart';
import '../../../statistics/presentation/cubit/get_submitted_invoices_cubit.dart';
import '../../../statistics/presentation/widgets/statistics_item.dart';

class HomeDashboardPage extends StatefulWidget {
  const HomeDashboardPage({Key? key}) : super(key: key);

  @override
  State<HomeDashboardPage> createState() => _HomeDashboardPageState();
}

class _HomeDashboardPageState extends State<HomeDashboardPage> {
  final cubitSales = GetSubmittedInvoicesCubit(sl(), sl());
  final cubitPurchase = GetSubmittedInvoicesCubit(sl(), sl());


  @override
  void initState() {
    cubitSales.getSubmittedInvoices();
    cubitPurchase.getReceivedInvoices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SplashScaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 24.0),
            Image.asset(ImageAssets.splashImage),
            const SizedBox(height: 24.0),
            Row(
              children: [
                const SizedBox(width: 16.0),
                Image.asset(IconAssets.handIcon, width: 30.0, height: 30.0),
                LWCustomText(
                    title: "${"hi".tr()}, ${ DiskRepo().loadUserName()} ",
                    fontSize: 16.0,
                    fontFamily: FontAssets.avertaRegular,
                    color: AppColors.whiteColor),
                LWCustomText(
                    title: "welcome_back".tr(),
                    color: AppColors.whiteColor,
                    fontSize: 12.0,
                    fontFamily: FontAssets.avertaRegular),
              ],
            ),
            const SizedBox(height: 24.0),
            Container(
              decoration: const BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40.0),
                  topLeft: Radius.circular(40.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  DefaultTabController(
                    length: 2, // length of tabs
                    initialIndex: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        TabBar(
                          labelColor: AppColors.primary,
                          unselectedLabelColor: AppColors.tabTitleColor,
                          indicatorColor: AppColors.primary,
                          tabs: [
                            Tab(text: 'purchase'.tr()),
                            Tab(text: 'sales'.tr()),
                          ],
                        ),
                        Container(
                          height: 500,
                          decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(color: AppColors.tabTitleColor, width: 0.5),
                            ),
                          ),
                          child: TabBarView(
                            children: <Widget>[
                              BlocProvider<GetSubmittedInvoicesCubit>.value(
                                value: cubitPurchase,
                                child: BlocConsumer<GetSubmittedInvoicesCubit, GetSubmittedInvoicesState>(
                                  listener: (context, totalState) async {
                                    if (totalState.getSubmittedInvoicesRequestState == RequestState.error) {
                                      await getErrorDialogue(
                                        context: context,
                                        isUnAuthorized: totalState.getSubmittedInvoiceResponse!.statuscode == 401,
                                        message: totalState.getSubmittedInvoiceResponse?.message ??
                                            "something_went_wrong".tr(),
                                      );
                                    }
                                  },
                                  builder: (context, totalState) {
                                    return totalState is GetSubmittedInvoicesLoading
                                        ? const Center(child: CircularProgressIndicator())
                                        : ListView(
                                            children: [
                                              StatisticsItem(
                                                title: "daily".tr(),
                                                invoicesTotals:
                                                totalState.getSubmittedInvoiceResponse?.result?.total_Daily,
                                              ),
                                              StatisticsItem(
                                                title: "monthly".tr(),
                                                invoicesTotals:
                                                totalState.getSubmittedInvoiceResponse?.result?.total_Monthly,
                                                backgroundColor: AppColors.scaffoldColor,
                                              ),
                                              StatisticsItem(
                                                title: "yearly".tr(),
                                                invoicesTotals:
                                                totalState.getSubmittedInvoiceResponse?.result?.total_Yearly,
                                              ),
                                            ],
                                          );
                                  },
                                ),
                              ),
                              BlocProvider<GetSubmittedInvoicesCubit>.value(
                                value: cubitSales,
                                child: BlocConsumer<GetSubmittedInvoicesCubit, GetSubmittedInvoicesState>(
                                  listener: (context, totalTax) async {
                                    if (totalTax.getSubmittedInvoicesRequestState == RequestState.error) {
                                      await getErrorDialogue(
                                        context: context,
                                        isUnAuthorized: totalTax.getSubmittedInvoiceResponse!.statuscode == 401,
                                        message: totalTax.getSubmittedInvoiceResponse?.message ??
                                            "something_went_wrong".tr(),
                                      );
                                    }
                                  },
                                  builder: (context, totalTax) {
                                    return totalTax is GetSubmittedInvoicesLoading
                                        ? const Center(child: CircularProgressIndicator())
                                        : ListView(
                                            children: [
                                              StatisticsItem(
                                                title: "daily".tr(),
                                                invoicesTotals:
                                                totalTax.getSubmittedInvoiceResponse?.result?.total_Daily,
                                              ),
                                              StatisticsItem(
                                                title: "monthly".tr(),
                                                invoicesTotals:
                                                totalTax.getSubmittedInvoiceResponse?.result?.total_Monthly,
                                                backgroundColor: AppColors.scaffoldColor,
                                              ),
                                              StatisticsItem(
                                                title: "yearly".tr(),
                                                invoicesTotals:
                                                totalTax.getSubmittedInvoiceResponse?.result?.total_Yearly,
                                              ),
                                            ],
                                          );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
