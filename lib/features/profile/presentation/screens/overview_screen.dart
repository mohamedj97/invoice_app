import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice_app/core/common_widgets/custom_scaffold.dart';
import 'package:invoice_app/core/widgets/custom_back_button.dart';
import 'package:invoice_app/features/profile/domain/entities/company_info.dart';
import '../../../../core/assets/colors.dart';
import '../../../../core/assets/image_assets.dart';
import '../../../../core/common_widgets/lw_custom_text.dart';
import '../../../../core/popups/error_dialogue.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/widgets/form_builder_fields/lw_custom_text_form_field.dart';
import '../../../../injection_container.dart';
import '../cubit/get_profile_cubit.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  final cubit = GetProfileCubit(sl(), sl());
  int _value = 0;

  @override
  void initState() {
    cubit.getCompanyLookupsDataForProfile();
    cubit.getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetProfileCubit>.value(
      value: cubit,
      child: BlocConsumer<GetProfileCubit, GetProfileState>(
        listener: (context, state) async {
          if (state.getProfileRequestState == RequestState.error) {
            await getErrorDialogue(
              context: context,
              isUnAuthorized: state.getProfileResponse!.statuscode == 401,
              message: state.getProfileResponse?.message?.first ?? "something_went_wrong".tr(),
            );
          }
        },
        builder: (context, state) {
          CompanyInfo? companyInfo = state.getProfileResponse?.result?.companies.first.companyInfo;
          String governate=state.getCompanyLookupsResponse?.result?.governates.firstWhere((element) => element.id==companyInfo?.governate).name??"";
          String businessActivity=state.getCompanyLookupsResponse?.result?.businessActivity.firstWhere((element) => element.id==companyInfo?.activityid).name??"";
          String country=state.getCompanyLookupsResponse?.result?.countries.firstWhere((element) => element.id==companyInfo?.country).name??"";
          return CustomScaffold(
            leading: const CustomBackButton(),
            backGroundColor: Colors.white,
            title: "overview".tr(),
            body: state is GetProfileLoading
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                LWCustomText(title: "account_type".tr(), fontWeight: FontWeight.bold),
                                const SizedBox(height: 16.0),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      // GestureDetector(
                                      //   onTap: () => setState(() => _value = 0),
                                      //   child: Center(
                                      //     child: Column(
                                      //       children: [
                                      //         Stack(
                                      //           clipBehavior: Clip.none,
                                      //           children: [
                                      //             CircleAvatar(
                                      //               radius: 60,
                                      //               backgroundColor:
                                      //                   _value == 0 ? AppColors.primary : AppColors.searchBarColor,
                                      //               child: Container(
                                      //                 padding: const EdgeInsets.all(4),
                                      //                 margin: const EdgeInsets.all(3),
                                      //                 decoration: const BoxDecoration(
                                      //                   color: Colors.white,
                                      //                   shape: BoxShape.circle,
                                      //                 ),
                                      //                 child: ClipOval(
                                      //                   child: SizedBox(
                                      //                     height: 250,
                                      //                     width: 250,
                                      //                     child: Image.asset(
                                      //                       ImageAssets.person,
                                      //                       fit: BoxFit.cover,
                                      //                     ),
                                      //                   ),
                                      //                 ),
                                      //               ),
                                      //             ),
                                      //             _value == 0
                                      //                 ? Positioned(
                                      //                     bottom: 50,
                                      //                     right: -12,
                                      //                     child: Center(
                                      //                       child: CircleAvatar(
                                      //                         backgroundColor: _value == 0
                                      //                             ? AppColors.primary
                                      //                             : AppColors.searchBarColor,
                                      //                         radius: 15.0,
                                      //                         child: const Icon(
                                      //                           Icons.check,
                                      //                           color: Colors.white,
                                      //                           size: 25,
                                      //                         ),
                                      //                       ),
                                      //                     ),
                                      //                   )
                                      //                 : const SizedBox(),
                                      //           ],
                                      //         ),
                                      //         const SizedBox(height: 16.0),
                                      //         LWCustomText(
                                      //           title: "individuals".tr(),
                                      //           fontSize: 18.0,
                                      //           color: _value == 0 ? AppColors.primary : AppColors.searchBarColor,
                                      //         )
                                      //       ],
                                      //     ),
                                      //   ),
                                      // ),
                                      // const SizedBox(width: 16.0),
                                      GestureDetector(
                                        onTap: () => setState(() => _value = 1),
                                        child: Center(
                                          child: Column(
                                            children: [
                                              Stack(
                                                clipBehavior: Clip.none,
                                                children: [
                                                  CircleAvatar(
                                                      radius: 60,
                                                      backgroundColor:
                                                          _value == 1 ? AppColors.primary : AppColors.searchBarColor,
                                                      child: Container(
                                                          padding: const EdgeInsets.all(4),
                                                          margin: const EdgeInsets.all(3),
                                                          decoration: const BoxDecoration(
                                                            color: Colors.white,
                                                            shape: BoxShape.circle,
                                                          ),
                                                          child: ClipOval(
                                                            child: SizedBox(
                                                              height: 250,
                                                              width: 250,
                                                              child: Image.asset(
                                                                ImageAssets.company,
                                                                fit: BoxFit.cover,
                                                              ),
                                                            ),
                                                          ))),
                                                  _value == 1
                                                      ? Positioned(
                                                          bottom: 50,
                                                          right: -12,
                                                          child: Center(
                                                            child: CircleAvatar(
                                                              backgroundColor: _value == 1
                                                                  ? AppColors.primary
                                                                  : AppColors.searchBarColor,
                                                              radius: 15.0,
                                                              child: const Icon(
                                                                Icons.check,
                                                                color: Colors.white,
                                                                size: 25,
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      : const SizedBox(),
                                                ],
                                              ),
                                              const SizedBox(height: 16.0),
                                              LWCustomText(
                                                title: "company".tr(),
                                                fontSize: 18.0,
                                                color: _value == 1 ? AppColors.primary : AppColors.searchBarColor,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 16.0),
                                LWCustomTextFormField(
                                  name: "company_name",
                                  labelText: "company_name".tr(),
                                  hintText: "company_name".tr(),
                                  isRequired: false,
                                  initialValue: companyInfo?.name ?? "",
                                  contentPadding: EdgeInsets.zero,
                                  borderDecoration: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.searchBarColor, width: 1.0),
                                  ),
                                  focusedBorderDecoration: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.dataFieldColor, width: 1.0),
                                  ),
                                  showRequiredSymbol: false,
                                ),
                                const SizedBox(height: 16.0),
                                LWCustomTextFormField(
                                  name: "tax_no",
                                  labelText: "tax_no".tr(),
                                  hintText: "123456789",
                                  isRequired: false,
                                  keyboardType: TextInputType.number,
                                  initialValue: companyInfo?.taxRegId.toString() ?? "",
                                  contentPadding: EdgeInsets.zero,
                                  borderDecoration: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.searchBarColor, width: 1.0),
                                  ),
                                  focusedBorderDecoration: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.dataFieldColor, width: 1.0),
                                  ),
                                  showRequiredSymbol: false,
                                ),
                                const SizedBox(height: 16.0),
                                if (companyInfo?.logo != null && companyInfo!.logo!.contains("http"))
                                  Column(
                                    children: [
                                      LWCustomText(title: "logo".tr(), color: AppColors.primary, fontSize: 16.0),
                                      const SizedBox(height: 8.0),
                                      Container(
                                        color: Colors.grey[100],
                                        width: MediaQuery.of(context).size.width,
                                        height: 100.0,
                                        child: Image.network(companyInfo.logo!),
                                      ),
                                    ],
                                  ),
                                const SizedBox(height: 16.0),
                                LWCustomTextFormField(
                                  name: "tax_no",
                                  labelText: "building_number".tr(),
                                  hintText: "123456789",
                                  isRequired: false,
                                  keyboardType: TextInputType.number,
                                  initialValue: companyInfo?.builldingnumber.toString() ?? "",
                                  contentPadding: EdgeInsets.zero,
                                  borderDecoration: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.searchBarColor, width: 1.0),
                                  ),
                                  focusedBorderDecoration: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.dataFieldColor, width: 1.0),
                                  ),
                                  showRequiredSymbol: false,
                                ),
                                const SizedBox(height: 16.0),
                                LWCustomTextFormField(
                                  name: "tax_no",
                                  labelText: "city".tr(),
                                  hintText: "123456789",
                                  isRequired: false,
                                  keyboardType: TextInputType.number,
                                  initialValue: companyInfo?.city.toString() ?? "",
                                  contentPadding: EdgeInsets.zero,
                                  borderDecoration: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.searchBarColor, width: 1.0),
                                  ),
                                  focusedBorderDecoration: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.dataFieldColor, width: 1.0),
                                  ),
                                  showRequiredSymbol: false,
                                ),
                                const SizedBox(height: 16.0),
                                LWCustomTextFormField(
                                  name: "tax_no",
                                  labelText: "postal_code".tr(),
                                  hintText: "123456789",
                                  isRequired: false,
                                  keyboardType: TextInputType.number,
                                  initialValue: companyInfo?.postalcode.toString() ?? "",
                                  contentPadding: EdgeInsets.zero,
                                  borderDecoration: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.searchBarColor, width: 1.0),
                                  ),
                                  focusedBorderDecoration: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.dataFieldColor, width: 1.0),
                                  ),
                                  showRequiredSymbol: false,
                                ),
                                const SizedBox(height: 16.0),
                                LWCustomTextFormField(
                                  name: "tax_no",
                                  labelText: "country".tr(),
                                  hintText: "123456789",
                                  isRequired: false,
                                  keyboardType: TextInputType.number,
                                  initialValue: governate,
                                  contentPadding: EdgeInsets.zero,
                                  borderDecoration: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.searchBarColor, width: 1.0),
                                  ),
                                  focusedBorderDecoration: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.dataFieldColor, width: 1.0),
                                  ),
                                  showRequiredSymbol: false,
                                ),
                                const SizedBox(height: 16.0),
                                LWCustomTextFormField(
                                  name: "tax_no",
                                  labelText: "business_activity".tr(),
                                  hintText: "123456789",
                                  isRequired: false,
                                  keyboardType: TextInputType.number,
                                  initialValue: businessActivity,
                                  contentPadding: EdgeInsets.zero,
                                  borderDecoration: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.searchBarColor, width: 1.0),
                                  ),
                                  focusedBorderDecoration: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.dataFieldColor, width: 1.0),
                                  ),
                                  showRequiredSymbol: false,
                                ),
                                const SizedBox(height: 16.0),
                                LWCustomTextFormField(
                                  name: "tax_no",
                                  labelText: "country".tr(),
                                  hintText: "123456789",
                                  isRequired: false,
                                  keyboardType: TextInputType.number,
                                  initialValue: country,
                                  contentPadding: EdgeInsets.zero,
                                  borderDecoration: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.searchBarColor, width: 1.0),
                                  ),
                                  focusedBorderDecoration: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.dataFieldColor, width: 1.0),
                                  ),
                                  showRequiredSymbol: false,
                                ),
                              ],
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
  }
}
