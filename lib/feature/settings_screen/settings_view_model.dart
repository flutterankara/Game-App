import 'package:stacked/stacked.dart';

import '../../core/services/navigation_service.dart';

class SettingsViewModel extends BaseViewModel {
  void returnBack() {
    ns.pop();
    //Ana Sayfaya geri dönecek
  }
}
