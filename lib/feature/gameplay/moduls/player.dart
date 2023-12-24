import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:gameapp/product/navigate/navigation_enums.dart';
import 'package:gameapp/product/services/user_service.dart';
import 'package:provider/provider.dart';

import '../../../core/services/navigation_service.dart';
import '../../../product/providers/general_provider.dart';

class Player extends SpriteAnimationComponent with CollisionCallbacks, HasGameRef {
  Player() : super(position: Vector2.all(100), size: Vector2.all(50));

  final velocity = Vector2(0, 150);

  @override
  Future<void> onLoad() async {
    animation = SpriteAnimation.fromFrameData(
      await Flame.images.load('dash.png'),
      SpriteAnimationData.sequenced(
        amount: 3,
        textureSize: Vector2.all(16),
        stepTime: 0.12,
      ),
    );
    add(CircleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += velocity.y * dt;
  }

  @override
  void onCollisionStart(Set<Vector2> _, PositionComponent other) {
    super.onCollisionStart(_, other);
    gameRef.pauseEngine();
    showDialog(
      context: ns.context,
      builder: (context) {
        var generalProvider = ns.context.read<GeneralProvider>();
        if (generalProvider.currentScore > generalProvider.user!.highScore!) {
          UserService.instance.setUserScore(generalProvider.user!.id!, generalProvider.currentScore);
        }
        return AlertDialog(
          title: const Text('OYUN BİTTİ'),
          content: Text('Score: ${generalProvider.currentScore}'),
          actions: [
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    ns.navigateToPageClear(NavEnums.gameplay);
                  },
                  child: const Text(
                    'Yeniden Başlat',
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        );
      },
    );
    // ns.context
  }

  void fly() {
    add(
      MoveByEffect(
        Vector2(0, -100),
        EffectController(
          duration: 0.2,
          curve: Curves.decelerate,
        ),
      ),
    );
  }
}
