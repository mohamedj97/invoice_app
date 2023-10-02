import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:invoice_app/core/common_widgets/custom_scaffold.dart';
import 'package:invoice_app/features/change_company/presentation/cubit/change_company_cubit.dart';

import '../../../../core/assets/colors.dart';
import '../../../../core/assets/font_assets.dart';
import '../../../../core/common_widgets/lw_custom_text.dart';
import '../../../../core/navigation/custom_page_route.dart';
import '../../../../core/popups/error_dialogue.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/widgets/custom_back_button.dart';
import '../../../../core/widgets/form_builder_fields/lw_custom_dropdown_form_field.dart';
import '../../../../injection_container.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../../domain/entities/get_company_users_result.dart';

class ChangeCompanyScreen extends StatefulWidget {
  const ChangeCompanyScreen({Key? key}) : super(key: key);

  @override
  State<ChangeCompanyScreen> createState() => _ChangeCompanyScreenState();
}

class _ChangeCompanyScreenState extends State<ChangeCompanyScreen> {
  final cubit = ChangeCompanyCubit(sl(), sl());
  List<MiniCompanyInfo> companies = [];
  final formKey = GlobalKey<FormBuilderState>();



  @override
  void initState() {
    cubit.getUserCompanies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChangeCompanyCubit>.value(
      value: cubit,
      child: BlocConsumer<ChangeCompanyCubit, ChangeCompanyState>(listener: (context, state) async {
        if (state.changeCompanyRequestState == RequestState.success) {
          Navigator.of(context).pushAndRemoveUntil(
            CustomPageRoute.createRoute(
              page: const HomeScreen(),
            ),
            (Route<dynamic> route) => false,
          );
        }
        if (state.changeCompanyRequestState == RequestState.error) {
          await getErrorDialogue(
            context: context,
            isUnAuthorized: state.changeCompanyResponse!.statuscode == 401,
            message: state.changeCompanyResponse?.message?.first ?? "something_went_wrong".tr(),
          );
        }
        if (state.getUsersCompaniesRequestState == RequestState.error) {
          await getErrorDialogue(
            context: context,
            isUnAuthorized: state.getUsersCompaniesResponse!.statuscode == 401,
            message: state.getUsersCompaniesResponse?.message?.first ?? "something_went_wrong".tr(),
          );
        }
      }, builder: (context, state) {
        return CustomScaffold(
          title: "change_company".tr(),
          leading: const CustomBackButton(),
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
                      final MiniCompanyInfo customerType = formState.value["company"] as MiniCompanyInfo;
                      BlocProvider.of<ChangeCompanyCubit>(context).changeCompany(companyId: customerType.companyId);
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
          body: state is ChangeCompanyLoading
              ? const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                  ),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: Container(
                      color: AppColors.whiteColor,
                      child: FormBuilder(
                        key: formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8.0),
                              LWCustomText(
                                title: "company_name".tr(),
                                color: AppColors.labelColor,
                                fontFamily: FontAssets.avertaRegular,
                              ),
                              const SizedBox(height: 16.0),
                              LWCustomDropdownFormField<MiniCompanyInfo>(
                                iconColor: AppColors.labelColor,
                                name: "company",
                                showLabel: false,
                                labelText: "",
                                initialValue: null,
                                hintText: "company".tr(),
                                isRequired: true,
                                isCard: false,
                                items: state.getUsersCompaniesResponse?.companies??[],
                                itemBuilder: (context, data) {
                                  return Text(data.name ?? "NA");
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
        );
      }),
    );
  }
}
