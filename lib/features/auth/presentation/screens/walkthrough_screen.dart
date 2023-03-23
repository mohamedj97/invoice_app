// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:introduction_screen/introduction_screen.dart';
// import 'package:invoice_app/core/assets/font_assets.dart';
// import 'package:invoice_app/core/assets/image_assets.dart';
// import 'package:invoice_app/core/common_widgets/custom_elevated_button.dart';
// import 'package:invoice_app/core/common_widgets/lw_custom_text.dart';
// import 'package:invoice_app/core/navigation/custom_page_route.dart';
// import 'package:invoice_app/core/assets/colors.dart';
// import 'package:invoice_app/features/home/presentation/screens/home_screen.dart';
//
// class WalkThroughScreen extends StatefulWidget {
//   const WalkThroughScreen({super.key});
//
//   @override
//   _WalkThroughScreenState createState() => _WalkThroughScreenState();
// }
//
// class _WalkThroughScreenState extends State<WalkThroughScreen> {
//   final introKey = GlobalKey<IntroductionScreenState>();
//
//   void _onIntroEnd(context) {
//     Navigator.of(context).pushAndRemoveUntil(
//       CustomPageRoute.createRoute(
//         page: const HomeScreen(),
//       ),
//           (Route<dynamic> route) => false,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     const pageDecoration = PageDecoration(
//       bodyPadding: EdgeInsets.zero,
//       pageColor: Colors.white,
//       bodyFlex: 2,
//       imageFlex: 3,
//       imagePadding: EdgeInsets.zero,
//       titlePadding: EdgeInsets.zero,
//       contentMargin: EdgeInsets.zero,
//     );
//
//     return IntroductionScreen(
//       key: introKey,
//       globalBackgroundColor: AppColors.whiteColor,
//       globalFooter: Padding(
//         padding: const EdgeInsets.all(32.0),
//         child: SizedBox(
//           width: double.infinity,
//           child: CustomElevatedButton(
//             title: "get_started".tr(),
//             onPressed: () => _onIntroEnd(context),
//           ),
//         ),
//       ),
//       pages: [
//         PageViewModel(
//           useRowInLandscape: true,
//           useScrollView: true,
//           titleWidget: Image.asset(ImageAssets.walkThroughFirst),
//           bodyWidget: Padding(
//             padding: const EdgeInsets.all(32.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 LWCustomText(
//                   title: "powerful_invoicing_app".tr(),
//                   color: AppColors.blackColor,
//                   fontSize: 22.0,
//                   fontWeight: FontWeight.bold,
//                   fontFamily: FontAssets.avertaSemiBold,
//                 ),
//                 const SizedBox(height: 32.0),
//                 const LWCustomText(
//                   title:
//                       "Vivamus auctor dui dignissim, sollicitudin nunc ac, aliquam justo. Vestibulum pellentesque lacinia eleifend.",
//                   color: AppColors.blackColor,
//                   fontSize: 15.0,
//                   fontFamily: FontAssets.avertaSemiBold,
//                 ),
//               ],
//             ),
//           ),
//           decoration: pageDecoration,
//         ),
//         PageViewModel(
//           useRowInLandscape: true,
//           useScrollView: true,
//           titleWidget: Image.asset(ImageAssets.walkThroughSecond),
//           bodyWidget: Padding(
//             padding: const EdgeInsets.all(32.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 LWCustomText(
//                   title: "start_sending_your_invoices".tr(),
//                   color: AppColors.blackColor,
//                   fontSize: 22.0,
//                   fontWeight: FontWeight.bold,
//                   fontFamily: FontAssets.avertaSemiBold,
//                 ),
//                 const SizedBox(height: 32.0),
//                 const LWCustomText(
//                   title:
//                       "Vivamus auctor dui dignissim, sollicitudin nunc ac, aliquam justo. Vestibulum pellentesque lacinia eleifend.",
//                   color: AppColors.blackColor,
//                   fontSize: 15.0,
//                   fontFamily: FontAssets.avertaSemiBold,
//                 ),
//               ],
//             ),
//           ),
//           decoration: pageDecoration,
//         ),
//         PageViewModel(
//           useRowInLandscape: true,
//           useScrollView: true,
//           titleWidget: Image.asset(ImageAssets.walkThroughThird),
//           bodyWidget: Padding(
//             padding: const EdgeInsets.all(32.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children:  [
//                 LWCustomText(
//                   title: "accept_payments_anywhere".tr(),
//                   color: AppColors.blackColor,
//                   fontSize: 22.0,
//                   fontWeight: FontWeight.bold,
//                   fontFamily: FontAssets.avertaSemiBold,
//                 ),
//                 const SizedBox(height: 32.0),
//                 const LWCustomText(
//                   title:
//                       "Vivamus auctor dui dignissim, sollicitudin nunc ac, aliquam justo. Vestibulum pellentesque lacinia eleifend.",
//                   color: AppColors.blackColor,
//                   fontSize: 15.0,
//                   fontFamily: FontAssets.avertaSemiBold,
//                 ),
//               ],
//             ),
//           ),
//           decoration: pageDecoration,
//         ),
//       ],
//       onDone: () => _onIntroEnd(context),
//       //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
//       showSkipButton: false,
//       skipOrBackFlex: 0,
//       nextFlex: 0,
//       showBackButton: false,
//       showDoneButton: false,
//       showNextButton: false,
//       curve: Curves.easeInOut,
//       controlsMargin: const EdgeInsets.symmetric(vertical: 64.0),
//       dotsDecorator: const DotsDecorator(
//         size: Size(20.0, 5.0),
//         color: AppColors.secondary,
//         activeColor: AppColors.primary,
//         activeSize: Size(20.0, 5.0),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(5.0)),
//         ),
//         activeShape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(5.0)),
//         ),
//       ),
//     );
//   }
// }
