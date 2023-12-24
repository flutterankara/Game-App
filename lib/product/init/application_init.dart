import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../firebase_options.dart';
import 'shared_manager.dart';
import 'timezone_init.dart';

class ApplicationInit {
  Future<void> firstlyInit() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await _initEasyLocalization();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    TimezoneInit().init();
    SharedManager.instance.initSharedManager();
  }

  /// EasyLocalization Initialization
  Future _initEasyLocalization() async {
    EasyLocalization.logger.enableBuildModes = [];
    await EasyLocalization.ensureInitialized();
  }
}
