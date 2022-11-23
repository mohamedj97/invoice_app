import 'package:flutter/material.dart';

enum Flavor { dev, production }

class AppConfig extends InheritedWidget {
  AppConfig({Key? key, required String baseApiURL, required Widget child})
      : super(child: child, key: key) {
    baseURL = baseApiURL;
  }

  static Flavor? flavor;
  static String baseURL = '';

  static AppConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType(aspect: AppConfig);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
