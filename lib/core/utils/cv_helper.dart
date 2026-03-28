import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CvHelper {
  static const String _assetPath =
      'assets/docs/Williams_Iwuoha_Formatted_CV.pdf';

  static Future<void> openCv() async {
    if (kIsWeb) {
      final webAssetUrl = Uri.base.resolve('assets/$_assetPath');
      final fallbackUrl = Uri.base.resolve(_assetPath);

      final opened = await launchUrl(
        webAssetUrl,
        webOnlyWindowName: '_blank',
      );
      if (!opened) {
        await launchUrl(
          fallbackUrl,
          webOnlyWindowName: '_blank',
        );
      }
      return;
    }

    final data = await rootBundle.load(_assetPath);
    final tempDirectory = await getTemporaryDirectory();
    final file = File('${tempDirectory.path}/Williams_Iwuoha_Formatted_CV.pdf');
    await file.writeAsBytes(data.buffer.asUint8List(), flush: true);
    await OpenFilex.open(file.path);
  }
}
