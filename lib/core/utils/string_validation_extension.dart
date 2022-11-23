extension StringExtention on String? {
  String get capitalize {
    return '${this![0].toUpperCase()}${this!.substring(1).toLowerCase()}';
  }

  String? get chars {
    final string = this?.trim().split(' ');
    if ((string?.length ?? 0) >= 2) {
      return '${string![0].substring(0, 1).toUpperCase()} ${string[1].substring(0, 1).toUpperCase()}';
    }
    return string?[0].substring(0, 2).toUpperCase();
  }
}

extension NullableStringExtention on String? {
  bool get isEmptyOrNull => this == null || this!.trim().isEmpty;

  String? get getNullIfEmpty => this?.trim().isNotEmpty == true ? this : null;
  bool get isValidPassword => this != null && this!.length >= 4;

  bool get isValidEmail =>
      this != null &&
      RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
          .hasMatch(this!.trim());
}
