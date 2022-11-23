import 'package:flutter/material.dart';
import 'package:invoice_app/core/assets/icon_assets.dart';
import 'package:invoice_app/core/assets/image_assets.dart';
import 'package:invoice_app/core/navigation/custom_page_route.dart';
import 'package:invoice_app/features/auth/presentation/screens/login_screen.dart';
import 'package:invoice_app/features/splash/presentation/widgets/splash_scaffold.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return const SplashScaffold(
      body: Center(
        child: FadeInImage(
          image: AssetImage(IconAssets.splashIcon),
          fadeInDuration: Duration(seconds: 2),
          placeholder: AssetImage(ImageAssets.emptyImage),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(CustomPageRoute.createRoute(page: const LoginScreen()));
    });
  }
}
