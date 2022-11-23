import 'package:flutter/material.dart';
import 'package:invoice_app/core/assets/colors.dart';
import '../../../../core/assets/font_assets.dart';
import '../../../../core/common_widgets/lw_custom_text.dart';
import '../../../../core/common_widgets/search_bar.dart';
import '../../../../core/navigation/custom_page_route.dart';
import '../../../customers/domain/entities/customer.dart';
import '../../../customers/presentation/screens/add_customer_screen.dart';

class HomeCustomersPage extends StatelessWidget {
  const HomeCustomersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Customer> customers = [
      Customer(
          name: "ahmed Ragab",
          type: "1",
          identityID: "1234567891011",
          code: "123456",
          country: "egypt",
          city: "cairo",
          street: "ssss",
          buildingNumber: "15",
          government: "cairo"),
      Customer(
          name: "Mohamed Ibrahim",
          type: "2",
          identityID: "9897623232",
          code: "69566",
          country: "egypt",
          city: "Giza",
          street: "ppppp",
          buildingNumber: "5",
          government: "Giza"),
      Customer(
          name: "Mahmoud Kamel",
          type: "3",
          identityID: "603203266",
          code: "131699",
          country: "egypt",
          city: "Alex",
          street: "iii",
          buildingNumber: "19",
          government: "Alex"),
    ];
    TextEditingController searchController = TextEditingController();
    return Column(
      children: [
        SearchBar(
          searchController: searchController,
          searchHintText: "Search by customer name",
        ),
        const SizedBox(height: 8.0),
        Expanded(
          child: Container(
            color: AppColors.scaffoldColor,
            child: ListView.builder(
              itemCount: customers.length,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                if (index != customers.length - 1) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        CustomPageRoute.createRoute(
                          page:
                              AddCustomerScreen(customerItem: customers[index]),
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      color: AppColors.whiteColor,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 24.0, left: 8.0),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              LWCustomText(
                                title: customers[index].name,
                                color: AppColors.labelColor,
                                fontSize: 18.0,
                                fontFamily: FontAssets.avertaRegular,
                              ),
                              const SizedBox(height: 24.0),
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
                  );
                } else {
                  return Container(
                    width: double.infinity,
                    color: AppColors.whiteColor,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 24.0, left: 8.0, bottom: 24.0),
                      child: LWCustomText(
                        title: customers[index].name,
                        color: AppColors.labelColor,
                        fontSize: 18.0,
                        fontFamily: FontAssets.avertaRegular,
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        )
      ],
    );
  }
}
