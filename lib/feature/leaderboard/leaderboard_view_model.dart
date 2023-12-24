import 'package:gameapp/core/models/simple_result.dart';
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
    fetchUsers();
  }

  var userList = [];

  void fetchUsers() async {
    try {
      setBusy(true);
      SimpleResult result = await UserService.instance.fetchUsers();
      if (result.isSuccess) userList = result.data;
      setBusy(false);
    } catch (e) {}
  }
}
