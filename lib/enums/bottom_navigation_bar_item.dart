import 'package:easy_localization/easy_localization.dart';

class BottomNavigationBarItem {
  /// The underlying value of this enum member.
  int value = 0;

  BottomNavigationBarItem._internal(this.value);

  static BottomNavigationBarItem home = BottomNavigationBarItem._internal(0);
  static BottomNavigationBarItem invoices = BottomNavigationBarItem._internal(1);
  static BottomNavigationBarItem products = BottomNavigationBarItem._internal(2);
  static BottomNavigationBarItem more = BottomNavigationBarItem._internal(3);

  String get name {
    switch (value) {
      case 0:
        return "home".tr();
      case 1:
        return "invoices".tr();
      case 2:
        return "products".tr();
      case 3:
        return "more".tr();
      default:
        throw ('Unknown enum value to decode name');
    }
  }
  BottomNavigationBarItem.fromJson(dynamic data) {
    switch (data) {
      case 0:
        value = data;
        break;
      case 1:
        value = data;
        break;
      case 2:
        value = data;
        break;
      case 3:
        value = data;
        break;
      default:
        throw ('Unknown enum value to decode: $data');
    }
  }

  static dynamic encode(BottomNavigationBarItem data) {
    return data.value;
  }
}
