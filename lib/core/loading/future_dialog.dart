import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_future_builder.dart';
import 'adaptive_dialog.dart';
import 'adaptive_progress_indicator.dart';

Future<T?> showFutureProgressDialog<T>({
  required BuildContext context,
  required InitFuture<T> initFuture,
  String? message,
}) async {
  return showAdaptiveDialog<T>(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AdaptiveProgressDialog<T>(
        initFuture: initFuture,
        message: message,
      );
    },
  );
}

class AdaptiveProgressDialog<T> extends StatelessWidget {
  final InitFuture<T> initFuture;
  final String? message;

  const AdaptiveProgressDialog({
    super.key,
    required this.initFuture,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      contentPadding: const EdgeInsets.all(16.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(40.0),
        ),
      ),
      content: SizedBox(
        height: 125.0,
        child: AdaptiveProgressDialogContent<T>(
          initFuture: initFuture,
        ),
      ),
    );
  }
}

class AdaptiveProgressDialogContent<T> extends StatelessWidget {
  final InitFuture<T> initFuture;

  const AdaptiveProgressDialogContent({
    super.key,
    required this.initFuture,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: CustomFutureBuilder<T>(
        initFuture: () async {
          try {
            var result = await initFuture();

            Navigator.of(context, rootNavigator: true).pop(result);

            return result;
          } catch (ex) {
            if (ex is DioError) {
              Navigator.of(context, rootNavigator: true)
                  .pop(ex.response?.data as T?);
            }
            Navigator.of(
              context,
            ).pop();
            rethrow;
          }
        },
        onLoading: (context) {
          return const LoadingWidget();
        },
        onError: (context, _) {
          return const LoadingWidget();
        },
        onSuccess: (context, snapshot) {
          return const AdaptiveProgressIndicator();
        },
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: AdaptiveProgressIndicator(),
          ),
        ),
        const SizedBox(height: 16.0),
        Text(
          "Loading...",
          style: Theme.of(context).textTheme.headline5,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
