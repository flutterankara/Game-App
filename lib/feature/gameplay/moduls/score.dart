import 'dart:ui';

import 'package:flame/components.dart';
import 'package:gameapp/core/services/navigation_service.dart';
import 'package:gameapp/product/providers/general_provider.dart';
import 'package:provider/provider.dart';

class Score extends TextComponent {
  TextComponent scoreText = TextComponent();

  @override
  void render(Canvas canvas) {
    scoreText.text = "Score: $score";
    scoreText.render(canvas);
  }

  int _score = 0;
  int get score => _score ~/ 100;
  @override
  void update(double dt) {
    _score += 1; // Örneğin her saniye skoru artır
    ns.context.read<GeneralProvider>().currentScore = score;
  }
}
