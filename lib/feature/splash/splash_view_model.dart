import 'package:gameapp/core/services/navigation_service.dart';
import 'package:gameapp/product/navigate/navigation_enums.dart';
import 'package:stacked/stacked.dart';

class SplashViewModel extends BaseViewModel {
  void onViewModelReady() async {
    await Future.delayed(const Duration(seconds: 1));
    ns.navigateToPageClear(NavEnums.gameplay);
  }
}
