import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdaptiveAlertDialogAction {
  final String title;
  final void Function() onPressed;
  final bool isPrimary;

  const AdaptiveAlertDialogAction({
    required this.title,
    required this.onPressed,
    this.isPrimary = false,
  });
}

class AdaptiveAlertDialog extends StatelessWidget {
  final Widget? icon;
  final String? title;
  final String? content;
  final List<AdaptiveAlertDialogAction>? actions;
  final bool showCloseButton;

  const AdaptiveAlertDialog({
    this.icon,
    this.title,
    this.content,
    this.showCloseButton = true,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      contentPadding: const EdgeInsets.only(
        top: 24.0,
        left: 24.0,
        right: 24.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(40.0),
        ),
      ),
      content: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.6,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) icon!,
                if (title != null) const SizedBox(height: 16.0),
                if (title != null)
                  Text(
                    title!,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                const SizedBox(height: 16.0),
                if (content != null)
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 100.0,
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                content!,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                if (actions == null || actions!.isEmpty)
                  const SizedBox(height: 24.0),
              ],
            ),
            if (showCloseButton)
              Positioned(
                top: 0.0,
                right: 0.0,
                child: IconButton(
                  icon:
                      Icon(Icons.close, color: Theme.of(context).primaryColor),
                  tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
                  onPressed: () => Navigator.maybePop(context),
                ),
              ),
          ],
        ),
      ),
      actions: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (actions != null && actions!.isNotEmpty)
              const SizedBox(height: 8.0),
            if (actions != null && actions!.isNotEmpty)
              for (final action in actions!.where((a) => a.isPrimary))
                Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: ElevatedButton(
                    onPressed: action.onPressed,
                    child: Text(
                      action.title.toUpperCase(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
            if (actions != null && actions!.isNotEmpty)
              for (final action in actions!.where((a) => !a.isPrimary))
                Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: OutlinedButton(
                    onPressed: action.onPressed,
                    child: Text(
                      action.title.toUpperCase(),
                    ),
                  ),
                ),
            if (actions != null && actions!.isNotEmpty)
              const SizedBox(height: 24.0),
          ],
        ),
      ],
    );
  }
}

Future<T?> showAdaptiveAlertDialog<T>({
  required BuildContext context,
  required Widget icon,
  String? title,
  required String content,
  List<AdaptiveAlertDialogAction>? actions,
  bool barrierDismissible = true,
  bool showCloseButton = true,
}) async {
  return showDialog<T>(
    barrierDismissible: barrierDismissible,
    context: context,
    builder: (context) {
      return AdaptiveAlertDialog(
        showCloseButton: showCloseButton,
        icon: IconTheme(
          data: Theme.of(context).iconTheme.copyWith(size: 75.0),
          child: Provider<UniversalImageSizeProvider>.value(
            updateShouldNotify: (_, __) => false,
            value: UniversalImageSizeProvider(size: 85.0),
            child: icon,
          ),
        ),
        title: title,
        content: content,
        actions: actions ??
            [
              if (!showCloseButton)
                AdaptiveAlertDialogAction(
                  title: "Ok",
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  isPrimary: true,
                ),
            ],
      );
    },
  );
}

class UniversalImageSizeProvider {
  final double size;

  UniversalImageSizeProvider({
    required this.size,
  });
}
