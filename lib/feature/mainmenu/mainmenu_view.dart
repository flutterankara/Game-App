import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gameapp/core/constants/app_constant.dart';
import 'package:gameapp/core/extension/context_extension.dart';
import 'package:stacked/stacked.dart';
import 'mainmenu_view_model.dart';
import 'package:lottie/lottie.dart';

class MainMenuView extends StatelessWidget {
  const MainMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainMenuViewModel>.reactive(
      viewModelBuilder: () => MainMenuViewModel(),
      builder: builder,
    );
  }

  Widget builder(
      BuildContext context, MainMenuViewModel viewModel, Widget? child) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Scaffold(
      body: Stack(
        children: [
          // Background Lottie Animation
          Lottie.asset(animBackground,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Handle the click event
                          print("Lottie widget clicked!");
                        },
                        child: Lottie.asset(animSetting,
                            fit: BoxFit.cover, height: context.height / 6),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/png/flutGif.gif',
                          height: context.height / 4),
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
                        style: TextStyle(
                            fontSize: 50,
                            fontFamily: 'PixelFont',
                            fontWeight: FontWeight.bold),
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
                        },
                        child: Lottie.asset(animPlay,
                            fit: BoxFit.cover, height: context.height / 6),
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
                            Lottie.asset(animShop,
                                fit: BoxFit.cover, height: context.height / 8),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'STORE',
                                style: TextStyle(
                                    fontSize: 32,
                                    fontFamily: 'PixelFont',
                                    fontWeight: FontWeight.bold),
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
                            Lottie.asset(animLeaderBoard,
                                fit: BoxFit.cover, height: context.height / 8),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'LEADERBOARD',
                                style: TextStyle(
                                    fontSize: 32,
                                    fontFamily: 'PixelFont',
                                    fontWeight: FontWeight.bold),
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
