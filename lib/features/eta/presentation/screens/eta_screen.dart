import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:invoice_app/core/api/repository/disk_repo.dart';
import 'package:invoice_app/core/common_widgets/custom_scaffold.dart';
import 'package:invoice_app/core/widgets/custom_back_button.dart';
import 'package:invoice_app/features/eta/domain/entities/add_eta_connection.dart';
import 'package:invoice_app/features/eta/presentation/cubit/eta_cubit.dart';
import '../../../../core/assets/colors.dart';
import '../../../../core/assets/font_assets.dart';
import '../../../../core/common_widgets/lw_custom_text.dart';
import '../../../../core/popups/error_dialogue.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/widgets/form_builder_fields/lw_custom_date_form_field.dart';
import '../../../../core/widgets/form_builder_fields/lw_custom_dropdown_form_field.dart';
import '../../../../core/widgets/form_builder_fields/lw_custom_text_form_field.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/eta_connections_result.dart';
import '../../domain/entities/eta_lookups_result.dart';

class ETAScreen extends StatefulWidget {
  const ETAScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ETAScreen> createState() => _ETAScreenState();
}

class _ETAScreenState extends State<ETAScreen> {
  final formKey = GlobalKey<FormBuilderState>();
  final cubit = ETACubit(sl(), sl(), sl());
  final lookupsCubit = ETACubit(sl(), sl(), sl());
  CompanyETAConnectionModel? etaConnection;

  @override
  void initState() {
    lookupsCubit.getETALookups();
    cubit.getETA(companyId: DiskRepo().loadCompanyId() ?? 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ETACubit>.value(
      value: cubit,
      child: BlocConsumer<ETACubit, ETAState>(
        listener: (context, state) async {
          if (state.addETARequestState == RequestState.success) {
            Navigator.of(context).pop();
          }
          if (state.getETARequestState == RequestState.error) {
            await getErrorDialogue(
              context: context,
              isUnAuthorized: state.getETAResponse!.statuscode == 401,
              message: state.getETAResponse?.message?.first ?? "something_went_wrong".tr(),
            );
          }
        },
        builder: (context, state) {
          etaConnection = state.getETAResponse?.result;
          return BlocProvider<ETACubit>.value(
            value: lookupsCubit,
            child: BlocConsumer<ETACubit, ETAState>(
              listener: (cc, ss) async {
                if (ss.getETALookupsRequestState == RequestState.error) {
                  await getErrorDialogue(
                    context: cc,
                    isUnAuthorized: ss.getETALookupsResponse!.statuscode == 401,
                    message: ss.getETALookupsResponse?.message?.first ?? "something_went_wrong".tr(),
                  );
                }
              },
              builder: (cc, ss) {
                var etaLookups = ss.getETALookupsResponse?.result;
                return CustomScaffold(
                  leading: const CustomBackButton(),
                  title: "eta".tr(),
                  actions: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: InkWell(
                            onTap: () {
                              var formState = formKey.currentState;
                              if (formState == null) return;
                              if (!formState.saveAndValidate()) {
                                return;
                              }

                              final String clientID = formState.value["client_id"] as String;
                              final String clientSecret = formState.value["client_secret"] as String;
                              final String testClientID = formState.value["test_client_id"] as String;
                              final String testClientSecret = formState.value["test_client_secret"] as String;

                              final DateTime prodExpiryDate = formState.value["expiration_date"] as DateTime;
                              final DateTime preProdExpiryDate = formState.value["test_expiration_date"] as DateTime;

                              final EtaEnvironment environmentType =
                                  formState.value["environment_type"] as EtaEnvironment;
                              final EtaEnvironment invoiceVersion =
                                  formState.value["invoice_version"] as EtaEnvironment;

                              BlocProvider.of<ETACubit>(context).addETA(
                                  companyId: DiskRepo().loadCompanyId() ?? 1,
                                  addETAModel: AddETAModel(
                                    id: etaConnection!.id,
                                    companyId: etaConnection!.companyId,
                                    activeEnvironment: environmentType.id,
                                    invoiceVersion: invoiceVersion.id,
                                    prodClientId: clientID,
                                    prodExpiryDate: prodExpiryDate,
                                    prodClientSecret: clientSecret,
                                    preprodClientSecret: testClientSecret,
                                    preprodClientId: testClientID,
                                    preprodExpiryDate: preProdExpiryDate,
                                  ));
                            },
                            child: LWCustomText(
                              title: "save".tr(),
                              color: AppColors.primary,
                              fontFamily: FontAssets.avertaSemiBold,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                  ],
                  body: state is ETALoading
                      ? const Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Column(
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                child: FormBuilder(
                                  key: formKey,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      if (etaConnection?.activeEnvironment != null)
                                        Container(
                                          color: AppColors.whiteColor,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(height: 8.0),
                                                LWCustomText(
                                                  title: "environment_type".tr(),
                                                  color: AppColors.labelColor,
                                                  fontFamily: FontAssets.avertaRegular,
                                                ),
                                                const SizedBox(height: 16.0),
                                                LWCustomDropdownFormField<EtaEnvironment>(
                                                  iconColor: AppColors.labelColor,
                                                  name: "environment_type",
                                                  showLabel: false,
                                                  labelText: "",
                                                  initialValue: etaLookups?.etaEnvironments.firstWhere(
                                                      (element) => element.id == etaConnection?.activeEnvironment),
                                                  hintText: "environment_type".tr(),
                                                  isRequired: false,
                                                  isCard: false,
                                                  items: etaLookups?.etaEnvironments ?? [],
                                                  itemBuilder: (context, data) {
                                                    return Text(data.name);
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      const Divider(
                                        thickness: 0.5,
                                        height: 0.0,
                                        color: AppColors.searchBarColor,
                                      ),
                                      if (etaConnection?.invoiceVersion != null)
                                        Container(
                                          color: AppColors.whiteColor,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(height: 8.0),
                                                LWCustomText(
                                                  title: "invoice_version".tr(),
                                                  color: AppColors.labelColor,
                                                  fontFamily: FontAssets.avertaRegular,
                                                ),
                                                const SizedBox(height: 16.0),
                                                LWCustomDropdownFormField<EtaEnvironment>(
                                                  iconColor: AppColors.labelColor,
                                                  name: "invoice_version",
                                                  showLabel: false,
                                                  labelText: "",
                                                  initialValue: etaLookups?.invoiceVersions.firstWhere(
                                                      (element) => element.id == etaConnection?.invoiceVersion),
                                                  hintText: "invoice_version".tr(),
                                                  isRequired: false,
                                                  isCard: false,
                                                  items: etaLookups?.invoiceVersions ?? [],
                                                  itemBuilder: (context, data) {
                                                    return Text(data.name);
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      const Divider(
                                        thickness: 0.5,
                                        height: 0.0,
                                        color: AppColors.searchBarColor,
                                      ),
                                      if (etaConnection?.prodClientId != null)
                                        Container(
                                          color: AppColors.whiteColor,
                                          child: Center(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(height: 16.0),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 8.0),
                                                  child: LWCustomText(
                                                    title: "client_id".tr(),
                                                    color: AppColors.labelColor,
                                                    fontFamily: FontAssets.avertaRegular,
                                                  ),
                                                ),
                                                const SizedBox(height: 8.0),
                                                LWCustomTextFormField(
                                                  name: "client_id",
                                                  showLabel: false,
                                                  enabled: true,
                                                  labelText: "",
                                                  hintText: "client_id".tr(),
                                                  isRequired: false,
                                                  initialValue: etaConnection?.prodClientId ?? "",
                                                  isCard: false,
                                                  borderDecoration: InputBorder.none,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      const Divider(
                                        thickness: 0.5,
                                        height: 0.0,
                                        color: AppColors.searchBarColor,
                                      ),
                                      Container(
                                        color: AppColors.whiteColor,
                                        child: Center(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(height: 16.0),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 8.0),
                                                child: LWCustomText(
                                                  title: "client_secret".tr(),
                                                  color: AppColors.labelColor,
                                                  fontFamily: FontAssets.avertaRegular,
                                                ),
                                              ),
                                              const SizedBox(height: 8.0),
                                              LWCustomTextFormField(
                                                name: "client_secret",
                                                showLabel: false,
                                                labelText: "",
                                                enabled: true,
                                                hintText: "client_secret".tr(),
                                                isRequired: false,
                                                initialValue: etaConnection?.prodClientSecret ?? "",
                                                isCard: false,
                                                borderDecoration: InputBorder.none,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const Divider(
                                        thickness: 0.5,
                                        height: 0.0,
                                        color: AppColors.searchBarColor,
                                      ),
                                      if (etaConnection?.prodExpiryDate != null)
                                        Container(
                                          color: AppColors.whiteColor,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                LWCustomText(
                                                  title: "expiration_date".tr(),
                                                  color: AppColors.labelColor,
                                                  fontFamily: FontAssets.avertaRegular,
                                                ),
                                                SizedBox(
                                                  width: 150,
                                                  child: LWCustomDateFormField(
                                                    isRequired: false,
                                                    name: "expiration_date",
                                                    labelText: "",
                                                    initialValue: etaConnection?.prodExpiryDate ?? DateTime.now(),
                                                    hintText: "choose_date".tr(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      const Divider(
                                        thickness: 0.5,
                                        height: 0.0,
                                        color: AppColors.searchBarColor,
                                      ),
                                      if (etaConnection?.preprodClientId != null)
                                        Container(
                                          color: AppColors.whiteColor,
                                          child: Center(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(height: 16.0),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 8.0),
                                                  child: LWCustomText(
                                                    title: "test_client_id".tr(),
                                                    color: AppColors.labelColor,
                                                    fontFamily: FontAssets.avertaRegular,
                                                  ),
                                                ),
                                                const SizedBox(height: 8.0),
                                                LWCustomTextFormField(
                                                  name: "test_client_id",
                                                  showLabel: false,
                                                  labelText: "",
                                                  hintText: "test_client_id".tr(),
                                                  isRequired: false,
                                                  enabled: true,
                                                  initialValue: etaConnection?.preprodClientId ?? "",
                                                  isCard: false,
                                                  borderDecoration: InputBorder.none,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      const Divider(
                                        thickness: 0.5,
                                        height: 0.0,
                                        color: AppColors.searchBarColor,
                                      ),
                                      if (etaConnection?.preprodClientSecret != null)
                                        Container(
                                          color: AppColors.whiteColor,
                                          child: Center(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(height: 16.0),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 8.0),
                                                  child: LWCustomText(
                                                    title: "test_client_secret".tr(),
                                                    color: AppColors.labelColor,
                                                    fontFamily: FontAssets.avertaRegular,
                                                  ),
                                                ),
                                                const SizedBox(height: 8.0),
                                                LWCustomTextFormField(
                                                  name: "test_client_secret",
                                                  showLabel: false,
                                                  labelText: "",
                                                  hintText: "test_client_secret".tr(),
                                                  isRequired: false,
                                                  enabled: true,
                                                  initialValue: etaConnection?.preprodClientSecret ?? "",
                                                  isCard: false,
                                                  borderDecoration: InputBorder.none,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      const Divider(
                                        thickness: 0.5,
                                        height: 0.0,
                                        color: AppColors.searchBarColor,
                                      ),
                                      if (etaConnection?.preprodExpiryDate != null)
                                        Container(
                                          color: AppColors.whiteColor,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                LWCustomText(
                                                  title: "test_expiration_date".tr(),
                                                  color: AppColors.labelColor,
                                                  fontFamily: FontAssets.avertaRegular,
                                                ),
                                                SizedBox(
                                                  width: 150,
                                                  child: LWCustomDateFormField(
                                                    isRequired: false,
                                                    name: "test_expiration_date",
                                                    labelText: "",
                                                    initialValue:
                                                        etaConnection?.preprodExpiryDate ?? DateTime.now(),
                                                    hintText: "choose_date".tr(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      const Divider(
                                        thickness: 0.5,
                                        height: 0.0,
                                        color: AppColors.searchBarColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
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
