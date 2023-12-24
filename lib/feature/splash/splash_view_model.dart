import 'package:gameapp/core/services/navigation_service.dart';
import 'package:gameapp/product/init/shared_manager.dart';
import 'package:gameapp/product/models/user/user_model.dart';
import 'package:gameapp/product/navigate/navigation_enums.dart';
import 'package:gameapp/product/providers/general_provider.dart';
import 'package:gameapp/product/services/user_service.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class SplashViewModel extends BaseViewModel {
  void onViewModelReady() async {
    try {
      var id = SharedManager.instance.getStringValue(SharedKeys.userId);
      UserModel? user;
      if (id != null) {
        var result = await UserService.instance.getUser(id);
        if (result.isSuccess) user = result.data;
      } else {
        var result = await UserService.instance.saveUser();
        if (result.isSuccess) user = result.data;
        SharedManager.instance.setStringValue(SharedKeys.userId, user!.id!);
        SharedManager.instance.setStringValue(SharedKeys.username, user.username!);
      }
      ns.context.read<GeneralProvider>().user = user;
      await Future.delayed(const Duration(seconds: 1));
      ns.navigateToPageClear(NavEnums.gameplay);
    } catch (e) {
      print(e);
    }
  }
}
