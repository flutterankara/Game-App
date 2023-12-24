import 'package:flutter/material.dart';
import 'package:gameapp/core/constants/layout_constants.dart';
import 'package:gameapp/core/extension/context_extension.dart';
import 'package:gameapp/product/constants/image_constants.dart';
import 'package:stacked/stacked.dart';

import 'leaderboard_view_model.dart';

class LeaderboardView extends StatelessWidget {
  const LeaderboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      viewModelBuilder: () => SplashViewModel(),
      builder: builder,
      onViewModelReady: (viewModel) => viewModel.onViewModelReady(),
    );
  }

  Widget builder(BuildContext context, SplashViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Leaderboard',
          style: TextStyle(fontSize: 32, fontFamily: 'PixelFont', fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: LayoutConstants.midAllPadding,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: viewModel.userList
              .map((e) => Card(
                    child: ListTile(
                      title: Text(
                        e.username,
                        style: const TextStyle(fontSize: 18, fontFamily: 'PixelFont', fontWeight: FontWeight.bold),
                      ),
                      trailing:Text(
                        e.highScore.toString(),
                        style: const TextStyle(fontSize: 18, fontFamily: 'PixelFont', fontWeight: FontWeight.bold),
                      )
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
