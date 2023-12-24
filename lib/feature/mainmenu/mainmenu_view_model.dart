import 'package:audioplayers/audioplayers.dart';
import 'package:gameapp/product/constants/product_constants.dart';
import 'package:gameapp/product/providers/general_provider.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../../core/services/navigation_service.dart';

class MainMenuViewModel extends BaseViewModel {
  AudioPlayer get audioPlayer => ns.context.read<GeneralProvider>().audioPlayer;
  void onViewModelReady() async {
    initBackgroundMusic();
  }

  Future initBackgroundMusic() async {
    await audioPlayer.setSourceAsset(ProductConstants.instance.backgroundSound);
    await audioPlayer.play(AssetSource(ProductConstants.instance.backgroundSound));
    await audioPlayer.setReleaseMode(ReleaseMode.loop);
    // notifyListeners();
    // setState(() {});
  }

  Future initJumpMusic() async {
    await audioPlayer.setSourceAsset(ProductConstants.instance.jumpSound);
    await audioPlayer.play(AssetSource(ProductConstants.instance.jumpSound));
    // setState(() {});
  }

  @override
  void dispose() {
    // audioPlayer.dispose();
    super.dispose();
  }
}
