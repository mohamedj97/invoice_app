import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice_app/features/customers/presentation/cubit/get_customers/get_customers_cubit.dart';
import 'package:invoice_app/features/splash/presentation/screens/splash_screen.dart';
import 'core/utils/theme/theme.dart';
import 'features/auth/presentation/cubit/form_submit/formsubmit_cubit.dart';
import 'features/auth/presentation/cubit/login/login_cubit.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await di.init();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/locale',
      startLocale: const Locale('en'),
      fallbackLocale: const Locale('en'),
      useOnlyLangCode: true,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.//
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FormSubmitCubit>(
          create: (context) => FormSubmitCubit(),
        ),
        BlocProvider<LoginCubit>(
          create: (context) => di.sl<LoginCubit>(),
        ),
      ],
      child: MaterialApp(
        title: 'title'.tr(),
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        localizationsDelegates: context.localizationDelegates,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.themeData,
        home: const SplashScreen(),
      ),
    );
  }
}
