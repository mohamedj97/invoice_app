import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice_app/core/api/repository/disk_repo.dart';
import 'package:invoice_app/core/api/repository/memory_repo.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/core/assets/font_assets.dart';
import 'package:invoice_app/core/assets/icon_assets.dart';
import 'package:invoice_app/core/common_widgets/lw_custom_text.dart';
import 'package:invoice_app/features/auth/presentation/screens/login_screen.dart';
import 'package:invoice_app/features/customers/presentation/cubit/get_customers/get_customers_cubit.dart';
import 'package:invoice_app/features/profile/presentation/screens/business_data_screen.dart';
import '../../../../core/navigation/custom_page_route.dart';
import '../../../profile/presentation/screens/change_language_screen.dart';
import '../../../profile/presentation/screens/change_password_screen.dart';
import '../../../profile/presentation/screens/profile_customers_screen.dart';
import '../../../profile/presentation/screens/profile_data_screen.dart';
import '../../../profile/presentation/widgets/profile_item_widget.dart';
import 'package:invoice_app/injection_container.dart' as di;

class HomeMorePage extends StatelessWidget {
  const HomeMorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetCustomersCubit>(
      create: (context) => di.sl<GetCustomersCubit>(),
      child: ListView(
        children: [
          Container(
            width: double.infinity,
            color: AppColors.whiteColor,
            child: Column(
              children: const [
                CircleAvatar(
                  backgroundColor: AppColors.primary,
                  radius: 52,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        "https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?w=2000"),
                  ),
                ),
                SizedBox(height: 16.0),
                LWCustomText(
                    title: "Hazim Hassan",
                    color: AppColors.blackColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
                SizedBox(height: 8.0),
                LWCustomText(
                    title: "Business Name",
                    color: AppColors.blackColor,
                    fontSize: 12.0),
              ],
            ),
          ),
          ProfileItemWidget(
            title: "Profile Data",
            imagePath: IconAssets.profileIcon,
            onTap: () {
              Navigator.of(context).push(
                  CustomPageRoute.createRoute(page: const ProfileDataScreen()));
            },
          ),
          ProfileItemWidget(
            title: "Business Data",
            imagePath: IconAssets.businessIcon,
            onTap: () {
              Navigator.of(context).push(
                  CustomPageRoute.createRoute(page: const BusinessDataScreen()));
            },
          ),
          ProfileItemWidget(
            title: "Customers",
            imagePath: IconAssets.customersIcon,
            onTap: () {
              Navigator.of(context)
                  .push(CustomPageRoute.createRoute(page: const ProfileCustomersScreen()));
            },
          ),
          ProfileItemWidget(
            title: "Change Password",
            imagePath: IconAssets.lockIcon,
            onTap: () {
              Navigator.of(context).push(CustomPageRoute.createRoute(
                  page: const ChangePasswordScreen()));
            },
          ),
          ProfileItemWidget(
            title: "Change Language",
            imagePath: IconAssets.customersIcon,
            onTap: () {
              Navigator.of(context).push(CustomPageRoute.createRoute(
                  page: const ChangeLanguageScreen()));
            },
          ),
          ProfileItemWidget(
            title: "Support",
            imagePath: IconAssets.customersIcon,
            onTap: () {},
          ),
          ProfileItemWidget(
            title: "Logout",
            imagePath: IconAssets.profileIcon,
            onTap: () async {
              await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 24.0, horizontal: 32.0),
                    title: const LWCustomText(
                      textAlign: TextAlign.center,
                      title: "Do you want to log out of the app",
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
                          padding: const EdgeInsets.only(
                              left: 24.0, right: 24.0, top: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const LWCustomText(
                                  title: "Cancel",
                                  color: AppColors.iconsColor,
                                  fontSize: 15.0,
                                  fontFamily: FontAssets.avertaSemiBold,
                                ),
                              ),
                              TextButton(
                                onPressed: () async {
                                  await DiskRepo().deleteTokensData();
                                  await DiskRepo().deleteFirstLogin();
                                  MemoryRepo().deleteTokensData();
                                  Navigator.of(context).pushAndRemoveUntil(
                                    CustomPageRoute.createRoute(
                                      page: const LoginScreen(),
                                    ),
                                    (Route<dynamic> route) => false,
                                  );
                                },
                                child: const LWCustomText(
                                  title: "Logout",
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
  }
}
