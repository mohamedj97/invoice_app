import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invoice_app/core/common_widgets/custom_elevated_button.dart';
import 'package:synchronized/synchronized.dart' as sync;
import '../../../features/auth/presentation/screens/login_screen.dart';
import '../../assets/colors.dart';
import '../../assets/font_assets.dart';
import '../../common_widgets/lw_custom_text.dart';
import '../../navigation/custom_page_route.dart';
import '../models/tokens_data.dart';
import '../repository/disk_repo.dart';
import '../repository/memory_repo.dart';

class AuthInterceptor extends Interceptor {
  final lock = sync.Lock();
  final Dio originalDio;
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  AuthInterceptor(Dio dio) : originalDio = dio;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // var controller = Get.find<LanguageChangeController>();
    // if(controller.languageCode == "ar"){
    //   options.headers["Accept-Language"] = "ar-EG,ar;";
    // }else{
    //   options.headers["Accept-Language"] = "en-US,en;";
    // }
    TokensData? tokensData = MemoryRepo().tokensData;
    if (tokensData != null) {
      options.headers["Authorization"] = "Bearer ${tokensData.token}";
    }
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode == 423) {
      //TODO: notify user ?
      MemoryRepo().deleteTokensData();
      await DiskRepo().deleteTokensData();
      return handler.reject(
        DioError(requestOptions: response.requestOptions, response: response),
      );
    }

    if (response.statusCode != 401) {
      //TODO: more handling for non 401 status code
      return handler.next(response);
    }
    if (response.statusCode == 401) {
      MemoryRepo().deleteTokensData();
      await DiskRepo().deleteTokensData();
      await showDialog(
          context: navigatorKey.currentContext!,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 24.0, horizontal: 32.0),
              title: LWCustomText(
                textAlign: TextAlign.center,
                title: "session_expired".tr(),
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
                    child: CustomElevatedButton(
                      onPressed: () async {
                        await DiskRepo().deleteTokensData();
                        MemoryRepo().deleteTokensData();
                        Navigator.of(navigatorKey.currentContext!)
                            .pushAndRemoveUntil(
                          CustomPageRoute.createRoute(
                            page: const LoginScreen(),
                          ),
                          (Route<dynamic> route) => false,
                        );
                        return handler.next(response);
                      },
                      title: "logout".tr(),
                    ),
                  ),
                ],
              ),
            );
          });
    }

    @override
    void onError(DioError err, ErrorInterceptorHandler handler) async {
      return handler.next(err);
    }

    // Future<bool> _shouldRetry() async {
    //   originalDio.lock();
    //   originalDio.interceptors.requestLock.lock();
    //   originalDio.interceptors.responseLock.lock();
    //   originalDio.interceptors.errorLock.lock();
    //   try {
    //     final tokensData = MemoryRepo().tokensData;
    //     if (tokensData == null) {
    //       return false;
    //     }
    //     if (tokensData.refreshTokenExpirationDate.isBefore(DateTime.now())) {
    //       //TODO: restart the app w/ message to the user
    //       MemoryRepo().deleteTokensData();
    //       await DiskRepo().deleteTokensData();
    //       return false;
    //     }
    //     var refreshTokenRequest = new RefreshTokenRequest()
    //       ..accessToken = tokensData.accessToken
    //     final refreshResponse = await ApiRepo().tokenCelient.refreshAccessToken(refreshTokenRequest);
    //     if (refreshResponse.status) {
    //       final newTokensData = TokensData.fromLoginResponseVm(refreshResponse.result);
    //       MemoryRepo().updateTokensData(newTokensData);
    //       await DiskRepo().updateTokensData(newTokensData);
    //       return true;
    //     } else {
    //       MemoryRepo().deleteTokensData();
    //       await DiskRepo().deleteTokensData();
    //       //TODO: restart the app w/ message to the user
    //       return false;
    //     }
    //   } finally {
    //     originalDio.unlock();
    //     originalDio.interceptors.requestLock.unlock();
    //     originalDio.interceptors.responseLock.unlock();
    //     originalDio.interceptors.errorLock.unlock();
    //   }
    // }

    _generateRequest(Response e) {
      final options = e.requestOptions;
      return originalDio.request(
        options.path,
        data: options.data,
        queryParameters: options.queryParameters,
      );
    }
  }
}
