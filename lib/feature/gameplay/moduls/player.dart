import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:gameapp/core/extension/context_extension.dart';
import 'package:gameapp/product/navigate/navigation_enums.dart';
import 'package:gameapp/product/services/user_service.dart';
import 'package:provider/provider.dart';

import '../../../core/services/navigation_service.dart';
import '../../../product/providers/general_provider.dart';

class Player extends SpriteAnimationComponent
    with CollisionCallbacks, HasGameRef {
  Player() : super(position: Vector2.all(100), size: Vector2.all(50));

  final velocity = Vector2(0, 150);

  @override
  Future<void> onLoad() async {
    var dashType = ns.context.read<GeneralProvider>().dashType;
    animation = SpriteAnimation.fromFrameData(
      await Flame.images.load( dashType != null ?'dashs/${dashType.asset}' : 'dash.png'),
      SpriteAnimationData.sequenced(
        amount: 3,
        textureSize: Vector2.all(dashType != null ? dashType.size.toDouble() : 16),
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
      barrierDismissible: false,
      context: ns.context,
      builder: (context) {
        var generalProvider = ns.context.read<GeneralProvider>();
        if (generalProvider.currentScore > generalProvider.user!.highScore!) {
          UserService.instance.setUserScore(
              generalProvider.user!.id!, generalProvider.currentScore);
        }
        return AlertDialog(
          backgroundColor: Colors.teal,
          title:  const Text(
            'GAME OVER',
            style: TextStyle(
                fontSize: 40,
                fontFamily: 'PixelFont',
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('SCORE: ${generalProvider.currentScore}',
                      style: const TextStyle(
                          fontSize: 40,
                          fontFamily: 'PixelFont',
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ],
              ),
              Card( color: Colors.white,
                  child: Image.asset('assets/png/flutGif.gif', height: context.height / 4)),
            ],
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  ns.navigateToPageClear(NavEnums.menu);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Set your desired background color here
                ),
                child: const Text(
                  'MAIN MENU',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'PixelFont',
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
            ElevatedButton(
                onPressed: () {
                  ns.navigateToPageClear(NavEnums.gameplay);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Set your desired background color here
                ),
                child: const Text(
                  'RESTART',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'PixelFont',
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ))
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
