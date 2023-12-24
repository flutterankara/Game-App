import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'gameplay_view_model.dart';

class GameplayView extends StatelessWidget {
  const GameplayView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GameplayViewModel>.reactive(viewModelBuilder: () => GameplayViewModel(), builder: builder);
  }

  Widget builder(BuildContext context, GameplayViewModel viewModel, Widget? child) {
    return GameWidget(game: viewModel.game);
  }
}
