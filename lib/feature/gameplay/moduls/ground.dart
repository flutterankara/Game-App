import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';
import 'game.dart';

class Ground extends ParallaxComponent<FlappyEmberGame> {
  Ground() : super(priority: -1);

  @override
  Future<void> onLoad() async {
    final groundImage = await Flame.images.load('ground_new.png');
    parallax = Parallax([
      ParallaxLayer(
        ParallaxImage(
          groundImage,
          fill: LayerFill.none,
        ),
      )
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    // parallax?.baseVelocity.x = gameRef.speed;
  }
}
