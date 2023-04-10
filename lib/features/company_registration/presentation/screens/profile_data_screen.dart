import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:invoice_app/core/assets/image_assets.dart';
import 'package:invoice_app/core/common_widgets/custom_elevated_button.dart';
import 'package:invoice_app/core/common_widgets/custom_scaffold.dart';
import 'package:invoice_app/core/common_widgets/lw_custom_text.dart';
import 'package:invoice_app/core/widgets/form_builder_fields/lw_custom_text_form_field.dart';
import 'package:invoice_app/features/company_registration/data/models/requests/company_register_request_model.dart';
import 'package:invoice_app/features/products/domain/entities/base_lookup.dart';
import '../../../../core/api/repository/disk_repo.dart';
import '../../../../core/assets/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dotted_border/dotted_border.dart';
import '../../../../core/popups/error_dialogue.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/widgets/form_builder_fields/lw_custom_dropdown_form_field.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/governate_lookup.dart';
import '../cubit/company_register_cubit.dart';

class ProfileDataScreen extends StatefulWidget {
  const ProfileDataScreen({Key? key}) : super(key: key);

  @override
  State<ProfileDataScreen> createState() => _ProfileDataScreenState();
}

class _ProfileDataScreenState extends State<ProfileDataScreen> {
  final TextEditingController? companyNameController = TextEditingController();
  final TextEditingController? taxNoController = TextEditingController();
  final TextEditingController? cityController = TextEditingController();
  final TextEditingController? buildingNoController = TextEditingController();
  final TextEditingController? addressController = TextEditingController();
  final cubit = CompanyRegisterCubit(sl(), sl(),sl());
  int _value = 1;
  int companyID = -1;
  final formKey = GlobalKey<FormBuilderState>();
  List<GovernateLookup> governates = [];
  List<BaseLookup> businessActivity = [];
  File? file;
  bool isFile = false;

  @override
  void initState() {
    cubit.getCompanyLookups(userId: DiskRepo().loadUserId() ?? 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CompanyRegisterCubit>.value(
      value: cubit,
      child: BlocConsumer<CompanyRegisterCubit, CompanyRegisterState>(
        listener: (context, state) async {
          if (state.companyRegisterRequestState == RequestState.success) {
            // Navigator.of(context).push(
            //   CustomPageRoute.createRoute(
            //     page: const PricingScreen(),
            //   ),
            //   //(Route<dynamic> route) => false,
            // );
            setState(() {
              companyID = state.intResponse?.result ?? -1;
            });
          }

          if (state.companyRegisterRequestState == RequestState.error) {
            await getErrorDialogue(
              context: context,
              isUnAuthorized: state.intResponse!.statuscode == 401,
              message: state.intResponse?.message?.first ?? "something_went_wrong".tr(),
            );
          }
        },
        builder: (context, state) {
          governates = state.getCompanyLookupsResponse?.result?.governates ?? [];
          businessActivity = state.getCompanyLookupsResponse?.result?.businessActivity ?? [];
          return CustomScaffold(
            backGroundColor: Colors.white,
            title: "complete_company_data".tr(),
            body: state is CompanyRegisterLoading
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    ),
                  )
                : FormBuilder(
                    key: formKey,
                    child: Padding(
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
                                    isRequired: true,
                                    controller: companyNameController,
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
                                    isRequired: true,
                                    keyboardType: TextInputType.number,
                                    controller: taxNoController,
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
                                  LWCustomText(title: "logo".tr(), color: AppColors.primary, fontSize: 16.0),
                                  const SizedBox(height: 8.0),
                                  InkWell(
                                    onTap: () async {
                                      final ImagePicker picker = ImagePicker();
                                      final XFile? xFileImage = await picker.pickImage(source: ImageSource.gallery);
                                      File image = File(xFileImage!.path);
                                      print("path ${xFileImage.path}");
                                      print("Bytes ${xFileImage.readAsBytes()}");
                                      setState(() {
                                        file = image;
                                        isFile = true;
                                      });
                                    },
                                    child: DottedBorder(
                                      color: Colors.grey[400]!,
                                      child: isFile
                                          ? Image.file(
                                              file!,
                                              fit: BoxFit.cover,
                                            )
                                          : Container(
                                              color: Colors.grey[100],
                                              width: MediaQuery.of(context).size.width,
                                              height: 100.0,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  const Icon(FontAwesomeIcons.arrowUpFromBracket,
                                                      color: AppColors.disabledBottomItemColor),
                                                  LWCustomText(
                                                      title: "upload".tr(), color: AppColors.disabledBottomItemColor)
                                                ],
                                              ),
                                            ),
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  LWCustomDropdownFormField<BaseLookup>(
                                    name: "business_activity",
                                    iconColor: AppColors.labelColor,
                                    showLabel: true,
                                    labelText: "business_activity".tr(),
                                    hintText: "choose_business_activity".tr(),
                                    isRequired: true,
                                    isCard: false,
                                    showRequiredSymbol: false,
                                    border: const UnderlineInputBorder(
                                      borderSide: BorderSide(color: AppColors.searchBarColor, width: 1.0),
                                    ),
                                    items: businessActivity,
                                    itemBuilder: (context, data) {
                                      return Column(
                                        children: [
                                          Text(data.name ?? ""),
                                          const Divider(color: AppColors.primary),
                                        ],
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 16.0),
                                  LWCustomTextFormField(
                                    name: "country",
                                    labelText: "country".tr(),
                                    initialValue: "egypt".tr(),
                                    isRequired: true,
                                    enabled: false,
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
                                  LWCustomDropdownFormField<GovernateLookup>(
                                    name: "governorate",
                                    iconColor: AppColors.labelColor,
                                    showLabel: true,
                                    labelText: "governorate".tr(),
                                    hintText: "choose_governorate".tr(),
                                    isRequired: true,
                                    isCard: false,
                                    showRequiredSymbol: false,
                                    border: const UnderlineInputBorder(
                                      borderSide: BorderSide(color: AppColors.searchBarColor, width: 1.0),
                                    ),
                                    items: governates,
                                    itemBuilder: (context, data) {
                                      return Column(
                                        children: [
                                          Text(data.name ?? ""),
                                          const Divider(color: AppColors.primary),
                                        ],
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 16.0),
                                  LWCustomTextFormField(
                                    name: "city",
                                    labelText: "city".tr(),
                                    hintText: "cairo".tr(),
                                    isRequired: true,
                                    controller: cityController,
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
                                    name: "building_number",
                                    labelText: "building_number".tr(),
                                    hintText: "12",
                                    isRequired: true,
                                    controller: buildingNoController,
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
                                    name: "address",
                                    labelText: "address".tr(),
                                    hintText: "12 street dock",
                                    isRequired: true,
                                    controller: addressController,
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
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: GestureDetector(
                                  onTap: () async {
                                    //To remove the keyboard when button is pressed
                                    FocusManager.instance.primaryFocus?.unfocus();

                                    var whatsappUrl =
                                        "whatsapp://send?phone=201007117763" + "&text=${Uri.encodeComponent("Hello")}";
                                    try {
                                      launch(whatsappUrl);
                                    } catch (e) {
                                      await getErrorDialogue(
                                        context: context,
                                        isUnAuthorized: false,
                                        message: "something_went_wrong".tr(),
                                      );
                                    }
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(12.0),
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                                        border: Border.all(color: AppColors.primary, width: 1.5)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Icon(FontAwesomeIcons.headset, color: AppColors.primary),
                                        LWCustomText(title: "support".tr(), color: AppColors.primary),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16.0),
                              Expanded(
                                flex: 3,
                                child: CustomElevatedButton(
                                  title: "proceed".tr(),
                                  onPressed: () {
                                    var formState = formKey.currentState;
                                    if (formState == null) return;
                                    if (!formState.saveAndValidate()) {
                                      return;
                                    }
                                    final String name = formState.value["company_name"] as String;

                                    final String taxRegId = formState.value["tax_no"] as String;

                                    final String street = formState.value["address"] as String;

                                    final String city = formState.value["city"] as String;

                                    final String buildingNumber = formState.value["building_number"];

                                    final BaseLookup activityId = formState.value["business_activity"] as BaseLookup;

                                    final GovernateLookup governorate =
                                        formState.value["governorate"] as GovernateLookup;

                                    BlocProvider.of<CompanyRegisterCubit>(context).registerCompany(
                                      userId: DiskRepo().loadUserId() ?? 0,
                                      companyRegisterRequest: CompanyRegisterRequestModel(
                                        id: 0,
                                        name: name,
                                        taxRegId: int.parse(taxRegId),
                                        activityid: activityId.id,
                                        country: 65,
                                        governate: governorate.id,
                                        city: city,
                                        street: street,
                                        builldingnumber: buildingNumber,
                                        active: true,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
