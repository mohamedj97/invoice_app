import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:invoice_app/features/branches/presentation/screens/branches_screen.dart';
import 'package:invoice_app/features/profile/presentation/screens/overview_screen.dart';
import 'package:invoice_app/features/users/presentation/screens/users_screen.dart';
import '../../../../core/assets/colors.dart';
import '../../../../core/common_widgets/custom_scaffold.dart';
import '../../../../core/navigation/custom_page_route.dart';
import '../../../../core/widgets/custom_back_button.dart';
import '../../../roles/presentation/screens/add_edit_role_screen.dart';
import '../widgets/profile_item_widget.dart';

class CompanyDataScreen extends StatefulWidget {
  const CompanyDataScreen({Key? key}) : super(key: key);

  @override
  State<CompanyDataScreen> createState() => _CompanyDataScreenState();
}

class _CompanyDataScreenState extends State<CompanyDataScreen> {
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backGroundColor: AppColors.whiteColor,
      leading: const CustomBackButton(),
      title: "company_data".tr(),
      body: Column(
        children: [
          ProfileItemWidget(
            title: "overview".tr(),
            showDivider: true,
            onTap: () {
              Navigator.of(context).push(
                CustomPageRoute.createRoute(
                  page: const OverviewScreen(),
                ),
              );
            },
          ),
          ProfileItemWidget(
            title: "branches".tr(),
            showDivider: true,
            onTap: () {
              Navigator.of(context).push(
                CustomPageRoute.createRoute(
                  page: const BranchesScreen(),
                ),
              );
            },
          ),
          ProfileItemWidget(
            title: "users".tr(),
            showDivider: true,
            onTap: () {
              Navigator.of(context).push(
                CustomPageRoute.createRoute(
                  page: const UsersScreen(),
                ),
              );
            },
          ),
          ProfileItemWidget(
            title: "roles".tr(),
            showDivider: true,
            onTap: () {
              Navigator.of(context).push(
                CustomPageRoute.createRoute(
                  page: const AddEditRoleScreen(),
                ),
              );
            },
          ),
          ProfileItemWidget(
            title: "eta".tr(),
            showDivider: true,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
