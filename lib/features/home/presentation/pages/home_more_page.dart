import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice_app/core/api/repository/disk_repo.dart';
import 'package:invoice_app/core/api/repository/memory_repo.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/core/assets/font_assets.dart';
import 'package:invoice_app/core/assets/icon_assets.dart';
import 'package:invoice_app/core/common_widgets/lw_custom_text.dart';
import 'package:invoice_app/features/auth/presentation/screens/login_screen.dart';
import 'package:invoice_app/features/profile/domain/entities/user_info_data.dart';
import 'package:invoice_app/features/profile/presentation/cubit/get_profile_cubit.dart';
import 'package:invoice_app/features/profile/presentation/screens/subscription_screen.dart';
import '../../../../core/navigation/custom_page_route.dart';
import '../../../../core/popups/error_dialogue.dart';
import '../../../../core/utils/enums.dart';
import '../../../../injection_container.dart';
import '../../../profile/presentation/screens/change_language_screen.dart';
import '../../../profile/presentation/screens/change_password_screen.dart';
import '../../../profile/presentation/screens/company_data_screen.dart';
import '../../../profile/presentation/screens/profile_customers_screen.dart';
import '../../../profile/presentation/screens/profile_data_screen.dart';
import '../../../profile/presentation/widgets/profile_item_widget.dart';

class HomeMorePage extends StatefulWidget {
  const HomeMorePage({Key? key}) : super(key: key);

  @override
  State<HomeMorePage> createState() => _HomeMorePageState();
}

class _HomeMorePageState extends State<HomeMorePage> {
  final cubit = GetProfileCubit(sl(),sl());

  @override
  void initState() {
    cubit.getProfile();
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetProfileCubit>.value(
      value: cubit,
      child: BlocConsumer<GetProfileCubit, GetProfileState>(listener: (context, state) async {
        if (state.getProfileRequestState == RequestState.success) {
          await DiskRepo().updateCompanyId(state.getProfileResponse?.result?.companies.first.companyInfo.id ?? 1);
        }
        if (state.getProfileRequestState == RequestState.error) {
          getErrorDialogue(
            context: context,
            isUnAuthorized: state.getProfileResponse!.statuscode == 401,
            message: state.getProfileResponse?.message?.first ?? "something_went_wrong".tr(),
          );
        }
      }, builder: (context, state) {
        return state is GetProfileLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                onRefresh: () async {
                  await cubit.getProfile();
                },
                child: ListView(
                  children: [
                    Container(
                      width: double.infinity,
                      color: AppColors.whiteColor,
                      child: Column(
                        children: [
                          // const CircleAvatar(
                          //   backgroundColor: AppColors.primary,
                          //   radius: 52,
                          //   child: CircleAvatar(
                          //     radius: 50,
                          //     backgroundImage: NetworkImage(
                          //         "https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?w=2000"),
                          //   ),
                          // ),
                          const SizedBox(height: 16.0),
                          LWCustomText(
                              title: state.getProfileResponse!.statuscode == 0
                                  ? "no_internet_connection".tr()
                                  : state.getProfileResponse?.result?.userName ?? "",
                              color: AppColors.blackColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                          const SizedBox(height: 8.0),
                          LWCustomText(
                              title: state.getProfileResponse?.result?.companies[0].companyInfo.name ?? "",
                              color: AppColors.blackColor,
                              fontSize: 12.0),
                        ],
                      ),
                    ),
                    ProfileItemWidget(
                      title: "profile_data".tr(),
                      imagePath: IconAssets.profileIcon,
                      onTap: () {
                        state.getProfileResponse!.statuscode == 0
                            ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: LWCustomText(
                                    title: state.getProfileResponse?.message?.first ?? "no_internet_connection".tr()),
                              ))
                            : Navigator.of(context).push(
                                CustomPageRoute.createRoute(
                                  page: ProfileDataScreen(
                                    user: state.getProfileResponse!.result as UserInfoData,
                                  ),
                                ),
                              );
                      },
                    ),
                    // ProfileItemWidget(
                    //   title: "company_data".tr(),
                    //   imagePath: IconAssets.businessIcon,
                    //   onTap: () {
                    //     state.getProfileResponse!.statuscode == 0
                    //         ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    //             content: LWCustomText(
                    //                 title: state.getProfileResponse?.message?.first ?? "no_internet_connection".tr()),
                    //           ))
                    //         : Navigator.of(context).push(CustomPageRoute.createRoute(
                    //             page: OverviewScreen(
                    //             companyInfo: state.getProfileResponse?.result?.companies[0].companyInfo,
                    //           )));
                    //   },
                    // ),
                    ProfileItemWidget(
                      title: "company_data".tr(),
                      imagePath: IconAssets.businessIcon,
                      onTap: () {
                        state.getProfileResponse!.statuscode == 0
                            ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: LWCustomText(
                                    title: state.getProfileResponse?.message?.first ?? "no_internet_connection".tr()),
                              ))
                            : Navigator.of(context).push(
                                CustomPageRoute.createRoute(
                                  page: const CompanyDataScreen(),
                                ),
                              );
                      },
                    ),
                    ProfileItemWidget(
                      title: "customers".tr(),
                      imagePath: IconAssets.customersIcon,
                      onTap: () {
                        state.getProfileResponse!.statuscode == 0
                            ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: LWCustomText(
                                    title: state.getProfileResponse?.message?.first ?? "no_internet_connection".tr()),
                              ))
                            : Navigator.of(context).push(
                                CustomPageRoute.createRoute(
                                  page: const ProfileCustomersScreen(),
                                ),
                              );
                      },
                    ),
                    ProfileItemWidget(
                      title: "change_password".tr(),
                      imagePath: IconAssets.lockIcon,
                      onTap: () {
                        state.getProfileResponse!.statuscode == 0
                            ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: LWCustomText(
                                    title: state.getProfileResponse?.message?.first ?? "no_internet_connection".tr()),
                              ))
                            : Navigator.of(context).push(CustomPageRoute.createRoute(
                                page: ChangePasswordScreen(
                                userName: state.getProfileResponse?.result?.userName ?? "user_name".tr(),
                              )));
                      },
                    ),
                    ProfileItemWidget(
                      title: "change_language".tr(),
                      imagePath: IconAssets.languageIcon,
                      onTap: () {
                        Navigator.of(context).push(CustomPageRoute.createRoute(page: const ChangeLanguageScreen()));
                      },
                    ),
                    ProfileItemWidget(
                      title: "subscription".tr(),
                      imagePath: IconAssets.subscribeIcon,
                      onTap: () {
                        Navigator.of(context).push(CustomPageRoute.createRoute(page: const SubscriptionScreen()));
                      },
                    ),
                    // ProfileItemWidget(
                    //   title: "support".tr(),
                    //   imagePath: IconAssets.customersIcon,
                    //   onTap: () {},
                    // ),
                    ProfileItemWidget(
                      title: "logout".tr(),
                      imagePath: IconAssets.logoutIcon,
                      onTap: () async {
                        await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              contentPadding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 32.0),
                              title: LWCustomText(
                                textAlign: TextAlign.center,
                                title: "logout_subtitle".tr(),
                                color: AppColors.dialogueTitleColor,
                                fontFamily: FontAssets.avertaSemiBold,
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Divider(
                                    thickness: 0.5,
                                    height: 0.0,
                                    color: AppColors.searchBarColor,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 16.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: LWCustomText(
                                            title: "cancel".tr(),
                                            color: AppColors.iconsColor,
                                            fontSize: 15.0,
                                            fontFamily: FontAssets.avertaSemiBold,
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () async {
                                            await DiskRepo().deleteTokensData();
                                            MemoryRepo().deleteTokensData();
                                            await DiskRepo().deleteUserName();
                                            Navigator.of(context).pushAndRemoveUntil(
                                              CustomPageRoute.createRoute(
                                                page: const LoginScreen(),
                                              ),
                                              (Route<dynamic> route) => false,
                                            );
                                          },
                                          child: LWCustomText(
                                            title: "logout".tr(),
                                            color: AppColors.errorColor,
                                            fontSize: 15.0,
                                            fontFamily: FontAssets.avertaSemiBold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      color: AppColors.errorColor,
                    ),
                  ],
                ),
              );
      }),
    );
  }
}
