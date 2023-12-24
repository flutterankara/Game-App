import 'package:flutter/material.dart';
import 'package:gameapp/core/constants/layout_constants.dart';
import 'package:gameapp/core/extension/context_extension.dart';
import 'package:gameapp/product/constants/image_constants.dart';
import 'package:stacked/stacked.dart';

import 'splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

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
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImageConstants.instance.flutterDash),
          LayoutConstants.midEmptyHeight,
          Text(
            'FLUT BIRD',
            style: TextStyle(fontSize: 50, fontFamily: 'PixelFont', fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
