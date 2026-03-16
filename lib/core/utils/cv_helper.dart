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
      await launchUrl(
        Uri.parse(_assetPath),
        webOnlyWindowName: '_blank',
      );
      return;
    }

    final data = await rootBundle.load(_assetPath);
    final tempDirectory = await getTemporaryDirectory();
    final file = File('${tempDirectory.path}/Williams_Iwuoha_Formatted_CV.pdf');
    await file.writeAsBytes(data.buffer.asUint8List(), flush: true);
    await OpenFilex.open(file.path);
  }
}
