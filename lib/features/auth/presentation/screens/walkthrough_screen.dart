import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/core/assets/image_assets.dart';
import 'package:invoice_app/core/common_widgets/custom_elevated_button.dart';
import 'package:invoice_app/core/navigation/custom_page_route.dart';
import 'package:invoice_app/features/home/presentation/screens/home_screen.dart';

import '../widgets/intro_widget.dart';

class WalkThroughScreen extends StatefulWidget {
  const WalkThroughScreen({super.key});

  @override
  _WalkThroughScreenState createState() => _WalkThroughScreenState();
}

class _WalkThroughScreenState extends State<WalkThroughScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).pushAndRemoveUntil(
      CustomPageRoute.createRoute(
        page: const HomeScreen(),
      ),
          (Route<dynamic> route) => false,
    );
  }

  List<String> titles = [
    "powerful_invoicing_app".tr(),
    "start_sending_your_invoices".tr(),
    "accept_payments_anywhere".tr(),
  ];

  List<String> subTitles = [
    "Vivamus auctor dui dignissim, sollicitudin nunc ac, aliquam justo. Vestibulum pellentesque lacinia eleifend.",
    "Vivamus auctor dui dignissim, sollicitudin nunc ac, aliquam justo. Vestibulum pellentesque lacinia eleifend.",
    "Vivamus auctor dui dignissim, sollicitudin nunc ac, aliquam justo. Vestibulum pellentesque lacinia eleifend.",
  ];

  List<String> images = [
    ImageAssets.walkThroughFirst,
    ImageAssets.walkThroughSecond,
    ImageAssets.walkThroughThird,
  ];

  int pageIndex=0;

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (index){
                setState(() {
                  pageIndex=index;
                });
              },
              itemCount: 3,
              pageSnapping: true,
              clipBehavior: Clip.none,
              allowImplicitScrolling: true,
              itemBuilder: (context, index) {
                return IntroWidget(
                  imageAsset: images[index],
                  title: titles[index],
                  subTitle: subTitles[index],
                );
              },
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 5,
                width: 20,
                color: pageIndex == 0.0 ? AppColors.primary : Colors.black26,
              ),
              const SizedBox(width: 8.0),
              Container(
                height: 5,
                width: 20,
                color: pageIndex == 1.0 ? AppColors.primary : Colors.black26,
              ),
              const SizedBox(width: 8.0),
              Container(
                height: 5,
                width: 20,
                color: pageIndex == 2.0 ? AppColors.primary : Colors.black26,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
                title: "get_started".tr(),
                onPressed: () => _onIntroEnd(context),
              ),
            ),
          )
        ],
      ),
    );
  }
}
