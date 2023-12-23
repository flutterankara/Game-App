import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../init/language_manager.dart';
import '../init/product_states.dart';
import 'package:provider/provider.dart';

extension WidgetExtension on Widget {
  Widget get easyLocalization {
    LanguageManager languageManager = LanguageManager.instance;
    return EasyLocalization(
      supportedLocales: languageManager.supportLocales,
      path: languageManager.assetPath,
      fallbackLocale: languageManager.trLocale,
      child: this,
    );
  }

  Widget get multiProvider => MultiProvider(providers: ProductProvider().items, child: this);

  Widget get expanded => Expanded(child: this);
}
