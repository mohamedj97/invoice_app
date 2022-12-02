import 'package:easy_localization/easy_localization.dart';
import 'package:invoice_app/core/assets/icon_assets.dart';

class BottomAppBarItemsData {
  static const activeIconsList = <String>[
    IconAssets.homeActiveIcon,
    IconAssets.invoiceActiveIcon,
    IconAssets.productsActiveIcon,
    IconAssets.moreActiveIcon,
  ];
  static const disabledIconsList = <String>[
    IconAssets.homeDisabledIcon,
    IconAssets.invoiceDisabledIcon,
    IconAssets.productsDisabledIcon,
    IconAssets.moreDisabledIcon,
  ];
 static final labelList = <String>[
    "home".tr(),
    "invoices".tr(),
    "products".tr(),
    "more".tr(),
  ];
}