import 'core/strings/end_points.dart';

enum Environment {staging, production }

extension EnvironmentExtension on Environment {
  String get name {
    switch (this) {
      case Environment.staging:
        return "Staging";
      case Environment.production:
        return "Production";
    }
  }
}

const Environment kEnvironment = Environment.staging;

String get geoApiKey {
  if (kEnvironment == Environment.production) {
    return "AIzaSyBqylCMhwCPepgZBIx-mgtgjSaiFbfFnUo";
  }
  return "AIzaSyBqylCMhwCPepgZBIx-mgtgjSaiFbfFnUo";
}

String get apiBaseUrl {
  switch (kEnvironment) {
    case Environment.staging:
      return EndPoints.stagingBaseUrl;
    case Environment.production:
      return EndPoints.productionBaseUrl;
  }
}

String get androidPackageName => "com.outout.mobile";

String get iOSBundleId => "com.outout.ios";

String get appStoreId => "1580266037";

String get dynamicLinksUriPrefix {
  if (kEnvironment == Environment.production) {
    //TODO: update production dynamicLinksUriPrefix
    return "";
  }
  return "https://outoutstaging.page.link";
}

// //TODO: update dynamicLinksBaseUrl
// String get websiteUrl => "https://outout.com/";
//
// String get dynamicLinksBaseUrl => websiteUrl;
