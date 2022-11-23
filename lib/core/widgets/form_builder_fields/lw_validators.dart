class LWValidators {
  static String? oneOf<T>(List<T> items, T? value, String? fieldName) {
    if (!items.contains(value)) {
      return "${fieldName ?? "This field"} is required.";
    }
  }

  static String? isNotNullNorEmpty(String? value, String? fieldName) {
    value = value?.trim();
    if (value == null) {
      return "${fieldName ?? "This field"} is required.";
    }
    if (value.isEmpty) {
      return "${fieldName ?? "This field"} is required.";
    }
    return null;
  }

  static String? required(dynamic value, String? fieldName) {
    if (value == null) {
      return "${fieldName ?? "This field"} is required.";
    }
    return null;
  }

  static String? email(String? value, String? fieldName) {
    value = value?.trim().toLowerCase();
    if (value == null) {
      return null;
    }
    var strList = value.split("@");
    if (!RegExp(r"^(?:[a-z0-9_-]+(?:\.[a-z0-9_-]+)*)@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])+)$")
        .hasMatch(value) ||
        strList[0].length > 64) {
      return "Invalid Email";
    }
    return null;
  }

  static String? phoneNumber(String? value, String? fieldName) {
    value = value?.trim();
    if (value == null || value == "") {
      return null;
    }
    if (!RegExp(r"^\+971\d{9}$").hasMatch(value)) {
      return "This ${fieldName ?? "Mobile Number"} format is not recognized.";
    }
    return null;
  }

  static String? fullName(String? value, String? fieldName) {
    value = value?.trim();
    if (value == null) {
      return null;
    }
    if (value.length < 2 || value.length > 100) {
      return "This field has a minimum of 2 characters and a maximum of 100 characters";
    }
    return null;
  }

  static String? description(String? value, String? fieldName) {
    if (value == null) {
      return null;
    }
    if (value.startsWith(" ")) {
      return "Description can't start with space.";
    }
    if (value.length < 2 || value.length > 2000) {
      return "This field has a minimum of 2 characters and a maximum of 2000 characters";
    }
    return null;
  }

  static String? password(String? value, String? fieldName) {
    if (value == null) {
      return null;
    }
    if (value.length < 8 || value.length > 25) {
      return "${fieldName ?? "Your password"} must be more than 8 symbols, less than 25 symbols.";
    }
    if (!RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W]).{8,25}$").hasMatch(value)) {
      return "${fieldName ?? "Your password"} needs to have a minimum of one small letter, one capital letter, one symbol, and one number.";
    }
    return null;
  }

  static String? loginPassword(String? value, String? fieldName) {
    if (value == null) {
      return null;
    }
    if (value.length < 8 || value.length > 25) {
      return "${fieldName ?? "Your password"} must be more than 8 symbols, less than 25 symbols.";
    }
    return null;
  }

  static String? cvv(String? value, String? fieldName) {
    if (value == null) {
      return null;
    }
    if (value.length != 4 && value.length != 3) {
      return "Invalid CVV.";
    }
    return null;
  }

  static String? expireDate(String? value, String? fieldName) {
    if (value == null) {
      return null;
    }

    final DateTime now = DateTime.now();
    final List<String> date = value.split(RegExp(r'/'));
    final int month = int.parse(date.first);
    final int year = int.parse('20${date.last}');
    final DateTime cardDate = DateTime(year, month);

    if (cardDate.isBefore(now) || month > 12 || month == 0) {
      return 'Invalid Expiration Date';
    }
    return null;
  }

  static String? creditCard(String? value, String? fieldName) {
    if (value == null) {
      return null;
    }

    var sanitized = value.replaceAll(RegExp(r'[^0-9]+'), '');
    RegExp _creditCardRegex = RegExp(
        r'^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})$');
    if (!_creditCardRegex.hasMatch(sanitized)) {
      return "Card Number is not Valid";
    }

    //Luhn Algorithm
    var sum = 0;
    String digit;
    var shouldDouble = false;
    for (var i = sanitized.length - 1; i >= 0; i--) {
      digit = sanitized.substring(i, (i + 1));
      var tmpNum = int.parse(digit);
      if (shouldDouble == true) {
        tmpNum *= 2;
        if (tmpNum >= 10) {
          sum += ((tmpNum % 10) + 1);
        } else {
          sum += tmpNum;
        }
      } else {
        sum += tmpNum;
      }
      shouldDouble = !shouldDouble;
    }
    bool isValid = sum % 10 == 0;

    if (!isValid) {
      return "Card Number is not Valid";
    }

    return null;
  }
}
