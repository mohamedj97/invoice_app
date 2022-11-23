import 'dart:io';

import 'package:flutter/services.dart';

Future<void> initCerts() async {
  ByteData data =
      await PlatformAssetBundle().load('assets/certs/https_cert.cer');
  SecurityContext.defaultContext
      .setTrustedCertificatesBytes(data.buffer.asUint8List());
}
