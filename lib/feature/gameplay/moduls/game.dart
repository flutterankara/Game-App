import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/text.dart';
import 'package:gameapp/feature/gameplay/moduls/score.dart';
import 'package:gameapp/product/providers/general_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/services/navigation_service.dart';
import 'box_stack.dart';
import 'ground.dart';
import 'player.dart';
import 'sky.dart';

class FlappyEmberGame extends FlameGame with HasCollisionDetection, TapDetector {
  FlappyEmberGame();

  double speed = 200;
  late final Player _player;

  @override
  Future<void> onLoad() async {
    // Add your components here
    add(_player = Player());
    add(Sky());
    add(Ground());
    add(ScreenHitbox());
    add(Score());
    add(TextComponent(
      text: ns.context.read<GeneralProvider>().user?.username ?? '',
      position: Vector2(0, 32.0),
    ));
  }

  @override
  void onTap() {
    _player.fly();
  }

  double _timeSinceBox = 0;
  final double _boxInterval = 1;

  @override
  void update(double dt) {
    super.update(dt);
    _timeSinceBox += dt;
    if (_timeSinceBox > _boxInterval) {
      add(BoxStack());
      _timeSinceBox = 0;
    }
  }
}
