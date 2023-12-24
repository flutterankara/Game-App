import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gameapp/core/constants/app_constant.dart';
import 'package:gameapp/core/constants/layout_constants.dart';
import 'package:gameapp/core/extension/context_extension.dart';
import 'package:gameapp/feature/store/StoreMainWidget.dart';
import 'package:gameapp/product/navigate/navigation_enums.dart';
import 'package:gameapp/product/providers/general_provider.dart';
import 'package:gameapp/product/utils/google_ads.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import '../../core/services/navigation_service.dart';
import 'mainmenu_view_model.dart';
import 'package:lottie/lottie.dart';

class MainMenuView extends StatefulWidget {
  const MainMenuView({super.key});

  @override
  State<MainMenuView> createState() => _MainMenuViewState();
}

class _MainMenuViewState extends State<MainMenuView> {

  GoogleAds googleAds = GoogleAds();
  int sayac =  0;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainMenuViewModel>.reactive(
      viewModelBuilder: () => MainMenuViewModel(),
      builder: builder,
    );
  }

  Widget builder(BuildContext context, MainMenuViewModel viewModel, Widget? child) {
    GoogleAds googleAds = GoogleAds();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Scaffold(
      body: Stack(
        children: [
          if (googleAds.bannerAd != null)
            Align(
              alignment: Alignment.bottomCenter,
              child :SafeArea(child: SizedBox(
                width: 320.0,
                height: 50,
                child: AdWidget(ad: googleAds.bannerAd!),
              ),
              ),
            ),

          // Background Lottie Animation
          Lottie.asset(animBackground, fit: BoxFit.cover, width: double.infinity, height: double.infinity),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [


              Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.only(left: LayoutConstants.midSize),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ns.context.read<GeneralProvider>().user?.username ?? '',
                              style: const TextStyle(fontSize: 32, fontFamily: 'PixelFont', fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'High Score: ${ns.context.read<GeneralProvider>().user?.highScore ?? ''}',
                              style: const TextStyle(fontSize: 32, fontFamily: 'PixelFont', fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            // Handle the click event
                            print("Lottie widget clicked!");
                          },
                          child: Lottie.asset(animSetting, fit: BoxFit.cover, height: context.height / 6),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/png/flutGif.gif', height: context.height / 4),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'FLUT BIRD',
                        style: TextStyle(fontSize: 50, fontFamily: 'PixelFont', fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Handle the click event
                          print("Lottie widget clicked!");
                          ns.navigateToPage(NavEnums.gameplay);
                        },
                        child: Lottie.asset(animPlay, fit: BoxFit.cover, height: context.height / 6),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: GestureDetector(
                      onTap: () {
                        // Handle the click event
                        print("Lottie widget clicked!");
                      },
                      child: Card(
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Lottie.asset(animShop, fit: BoxFit.cover, height: context.height / 8),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextButton(
                                onPressed: (){
                                  sayac = sayac + 1;
                                  if(sayac % 3 == 0){
                                    googleAds.showInterstitialAd();
                                    googleAds.loadIntersititialAd();
                                  }
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => StoreMainWidget()));
                                },
                                child:Text("STORE",style: TextStyle(fontSize: 32, fontFamily: 'PixelFont', fontWeight: FontWeight.bold),),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: GestureDetector(
                      onTap: () {
                        // Handle the click event
                        print("Lottie widget clicked!");
                      },
                      child: Card(
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Lottie.asset(animLeaderBoard, fit: BoxFit.cover, height: context.height / 8),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'LEADERBOARD',
                                style: TextStyle(fontSize: 32, fontFamily: 'PixelFont', fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

        ],
      ),
    );
  }
}
